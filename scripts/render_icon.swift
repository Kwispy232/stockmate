import AppKit

func renderIcon(size: Int, path: String) throws {
let context = CGContext(
    data: nil, width: size, height: size, bitsPerComponent: 8, bytesPerRow: 0,
    space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.noneSkipLast.rawValue
)!
context.scaleBy(x: CGFloat(size) / 96, y: CGFloat(size) / 96)
context.translateBy(x: 0, y: 96)
context.scaleBy(x: 1, y: -1)
context.setFillColor(CGColor(red: 20/255, green: 125/255, blue: 115/255, alpha: 1))
context.fill(CGRect(x: 0, y: 0, width: 96, height: 96))
context.setStrokeColor(CGColor(gray: 1, alpha: 1))
context.setLineWidth(4)
context.setLineJoin(.round)
context.setLineCap(.round)

func line(_ points: [CGPoint], closed: Bool = false) {
    context.beginPath()
    context.move(to: points[0])
    for point in points.dropFirst() { context.addLine(to: point) }
    if closed { context.closePath() }
    context.strokePath()
}

line([CGPoint(x: 25, y: 33), CGPoint(x: 48, y: 21), CGPoint(x: 71, y: 33),
      CGPoint(x: 71, y: 63), CGPoint(x: 48, y: 76), CGPoint(x: 25, y: 63)], closed: true)
line([CGPoint(x: 25, y: 33), CGPoint(x: 48, y: 46), CGPoint(x: 71, y: 33)])
line([CGPoint(x: 48, y: 46), CGPoint(x: 48, y: 76)])
line([CGPoint(x: 37, y: 27), CGPoint(x: 60, y: 40)])
context.setFillColor(CGColor(red: 223/255, green: 1, blue: 171/255, alpha: 1))
context.fillEllipse(in: CGRect(x: 55, y: 54, width: 32, height: 32))
context.setStrokeColor(CGColor(red: 17/255, green: 86/255, blue: 79/255, alpha: 1))
line([CGPoint(x: 64, y: 70), CGPoint(x: 69, y: 75), CGPoint(x: 78, y: 65)])

let image = NSBitmapImageRep(cgImage: context.makeImage()!)
try image.representation(using: .png, properties: [:])!
    .write(to: URL(fileURLWithPath: path))
}

try renderIcon(size: 1024, path: "assets/brand/icon.png")
let catalogPath = "ios/Runner/Assets.xcassets/AppIcon.appiconset"
let catalog = try JSONSerialization.jsonObject(with: Data(contentsOf:
    URL(fileURLWithPath: "\(catalogPath)/Contents.json"))) as! [String: Any]
for image in catalog["images"] as! [[String: String]] {
    guard let file = image["filename"], let dimensions = image["size"], let scale = image["scale"] else { continue }
    let points = Double(dimensions.components(separatedBy: "x")[0])!
    let multiplier = Double(scale.replacingOccurrences(of: "x", with: ""))!
    try renderIcon(size: Int(points * multiplier), path: "\(catalogPath)/\(file)")
}
for (density, size) in [("mdpi", 48), ("hdpi", 72), ("xhdpi", 96), ("xxhdpi", 144), ("xxxhdpi", 192)] {
    try renderIcon(size: size, path: "android/app/src/main/res/mipmap-\(density)/ic_launcher.png")
}
