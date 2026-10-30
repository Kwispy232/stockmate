import 'package:flutter/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'dart:convert';

import '../domain/inventory.dart';

class Catalog {
  const Catalog(this.branches, this.products);
  final List<Branch> branches;
  final List<Product> products;

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
    (json['branches'] as List).map((v) => Branch.fromJson(Map<String, dynamic>.from(v))).toList(),
    (json['products'] as List).map((v) => Product.fromJson(Map<String, dynamic>.from(v))).toList(),
  );

  Map<String, dynamic> toJson() => {
    'branches': branches.map((v) => v.toJson()).toList(),
    'products': products.map((v) => v.toJson()).toList(),
  };
}

abstract interface class InventoryGateway {
  Future<Catalog> fetchCatalog();
  Future<void> submit(Inventory inventory);
  Future<List<Inventory>> fetchSubmitted();
}

class DemoGateway implements InventoryGateway {
  DemoGateway({this.isOnline});
  final bool Function()? isOnline;

  @override
  Future<Catalog> fetchCatalog() async =>
      Catalog.fromJson(jsonDecode(await rootBundle.loadString('assets/demo/catalog.json')));

  @override
  Future<void> submit(Inventory inventory) async {
    if (isOnline?.call() == false) throw InventoryIssue.network;
    await Future<void>.delayed(const Duration(milliseconds: 350));
  }

  @override
  Future<List<Inventory>> fetchSubmitted() async => [];
}

class SupabaseInventoryGateway implements InventoryGateway {
  const SupabaseInventoryGateway(this.client);
  final SupabaseClient client;

  @override
  Future<Catalog> fetchCatalog() async {
    final branches = await client.from('branches').select().order('name');
    final products = await client.from('catalog_items').select().order('name');
    return Catalog(
      branches.map((row) => Branch(id: row['id'], name: row['name'])).toList(),
      products
          .map(
            (row) => Product(
              id: row['id'],
              branchId: row['branch_id'],
              name: row['name'],
              sku: row['sku'],
              barcode: row['barcode'],
              category: row['category'],
              expected: row['expected'],
            ),
          )
          .toList(),
    );
  }

  @override
  Future<void> submit(Inventory inventory) async {
    try {
      await client.rpc(
        'submit_inventory',
        params: {
          'p_id': inventory.id,
          'p_branch_id': inventory.branchId,
          'p_title': inventory.title,
          'p_created_at': inventory.createdAt.toUtc().toIso8601String(),
          'p_lines': [
            for (final line in inventory.lines)
              {'product_id': line.productId, 'expected': line.expected, 'counted': line.counted},
          ],
        },
      );
    } on PostgrestException catch (error) {
      throw switch (error.message) {
        'access_denied' => InventoryIssue.accessDenied,
        'stale_catalog' => InventoryIssue.staleCatalog,
        'submission_changed' => InventoryIssue.submissionChanged,
        _ => InventoryIssue.network,
      };
    }
  }

  @override
  Future<List<Inventory>> fetchSubmitted() async {
    final rows = await client
        .from('inventories')
        .select('*, branches(name), inventory_lines(*)')
        .order('created_at', ascending: false);
    return [
      for (final row in rows)
        Inventory(
          id: row['id'],
          branchId: row['branch_id'],
          branchName: row['branches']['name'],
          title: row['title'],
          createdAt: DateTime.parse(row['created_at']),
          status: InventoryStatus.submitted,
          lines: [
            for (final line in row['inventory_lines'])
              CountLine(
                productId: line['product_id'],
                name: line['name'],
                sku: line['sku'],
                barcode: line['barcode'],
                expected: line['expected'],
                counted: line['counted'],
              ),
          ],
        ),
    ];
  }
}
