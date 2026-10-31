#!/usr/bin/env python3
"""Generate the Slovak project brief as a 16:9 PDF."""
from pathlib import Path

from reportlab.lib import colors
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.pdfgen import canvas
from reportlab.platypus import Paragraph


ROOT = Path(__file__).resolve().parents[3]
OUTPUT = ROOT / "output/pdf/stockmate-zadanie.pdf"
WIDTH, HEIGHT = 960, 540
MARGIN = 56
INK = colors.HexColor("#153F3A")
TEAL = colors.HexColor("#147D75")
LIME = colors.HexColor("#DEFFA2")
CREAM = colors.HexColor("#F5F6F0")
MUTED = colors.HexColor("#51645F")
RULE = colors.HexColor("#CDD9D2")
WHITE = colors.white


def register_fonts():
    families = [
        (Path("/System/Library/Fonts/Supplemental/Arial.ttf"), Path("/System/Library/Fonts/Supplemental/Arial Bold.ttf")),
        (Path("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"), Path("/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf")),
    ]
    regular, bold = next((pair for pair in families if all(p.exists() for p in pair)), (None, None))
    if regular is None:
        raise RuntimeError("Install Arial or DejaVu Sans to regenerate this PDF.")
    pdfmetrics.registerFont(TTFont("Brief", str(regular)))
    pdfmetrics.registerFont(TTFont("BriefBold", str(bold)))
    pdfmetrics.registerFontFamily("Brief", normal="Brief", bold="BriefBold")


def paragraph(text, x, top, width, size=18, leading=None, color=INK, bold=False):
    style = ParagraphStyle(
        "text", fontName="BriefBold" if bold else "Brief", fontSize=size,
        leading=leading or size * 1.38, textColor=color, alignment=TA_LEFT,
        splitLongWords=False, spaceAfter=0,
    )
    p = Paragraph(text, style)
    _, height = p.wrap(width, HEIGHT)
    if top - height < 42:
        raise ValueError(f"Text exceeds the page: {text[:70]}")
    p.drawOn(C, x, top - height)
    return top - height


def label(text, x, y, color=TEAL, size=10.5):
    C.saveState()
    C.setFillColor(color)
    obj = C.beginText(x, y)
    obj.setFont("BriefBold", size)
    obj.setCharSpace(1.3)
    obj.textOut(text)
    C.drawText(obj)
    C.restoreState()


def footer(number, dark=False):
    color = colors.HexColor("#ACCAC1") if dark else MUTED
    C.setStrokeColor(colors.HexColor("#41665D") if dark else RULE)
    C.setLineWidth(0.6)
    C.line(MARGIN, 39, WIDTH - MARGIN, 39)
    C.setFillColor(color)
    C.setFont("Brief", 9)
    C.drawString(MARGIN, 22, "StockMate / Zadanie portfóliového projektu")
    C.drawRightString(WIDTH - MARGIN, 22, f"{number:02d} / 08")


def page(number, title, eyebrow, background=CREAM):
    C.setFillColor(background)
    C.rect(0, 0, WIDTH, HEIGHT, fill=True, stroke=False)
    label(eyebrow.upper(), MARGIN, 493)
    paragraph(title, MARGIN, 465, 848, size=35, leading=42, bold=True)
    footer(number)


def proof(text):
    C.setFillColor(INK)
    C.rect(MARGIN, 60, WIDTH - 2 * MARGIN, 63, fill=True, stroke=False)
    label("ČO SA MÁ UKÁZAŤ", MARGIN + 20, 105, color=LIME, size=9)
    paragraph(text, MARGIN + 20, 94, 808, size=15.5, leading=20, color=WHITE)


def numbered_row(number, title, body, top, height=64):
    label(f"{number:02d}", MARGIN, top - 17, color=TEAL, size=12)
    paragraph(title, MARGIN + 49, top, 275, size=19, leading=24, bold=True)
    paragraph(body, 389, top, 515, size=17, leading=23)
    C.setStrokeColor(RULE)
    C.setLineWidth(0.6)
    C.line(MARGIN + 49, top - height + 11, 904, top - height + 11)


register_fonts()
OUTPUT.parent.mkdir(parents=True, exist_ok=True)
C = canvas.Canvas(str(OUTPUT), pagesize=(WIDTH, HEIGHT), pageCompression=1)
C.setTitle("StockMate - Zadanie portfóliového projektu")
C.setAuthor("StockMate")
C.setSubject("Zadanie mobilnej aplikácie a schopnosti, ktoré má projekt preukázať")
C.setCreator("StockMate project brief")

# 1
C.setFillColor(INK)
C.rect(0, 0, WIDTH, HEIGHT, fill=True, stroke=False)
label("FLUTTER / DART", MARGIN, 489, color=LIME, size=12)
C.setFillColor(LIME)
C.rect(MARGIN, 442, 76, 5, fill=True, stroke=False)
paragraph("StockMate", MARGIN - 3, 414, 848, size=78, leading=89, color=WHITE, bold=True)
paragraph("Zadanie portfóliového projektu", MARGIN, 301, 848, size=31, leading=39, color=WHITE)
paragraph("Mobilná aplikácia na inventúry", MARGIN, 238, 800, size=24, leading=31, color=LIME)
paragraph("Vytvor zrozumiteľný pracovný proces, ktorý spoľahlivo uchová počítanie aj pri výpadku pripojenia.", MARGIN, 167, 720, size=20, leading=29, color=colors.HexColor("#D4E2DC"))
footer(1, dark=True)
C.showPage()

# 2
page(2, "Cieľ a rozsah", "Zámer projektu")
paragraph("Vytvor aplikáciu, v ktorej pracovník predajne spočíta skutočné množstvá produktov a odovzdá overiteľný inventúrny záznam.", MARGIN, 392, 814, size=23, leading=32)
paragraph("Pracovné prostredie", MARGIN, 280, 380, size=21, bold=True)
paragraph("Aspoň dve ukážkové predajne s katalógom produktov. Každý produkt má názov, interný kód, čiarový kód a evidované množstvo.", MARGIN, 242, 384, size=18, leading=26)
paragraph("Dva spôsoby vyskúšania", 507, 280, 397, size=21, bold=True)
paragraph("Lokálne demo bez účtu a pripojenia. Prihlásený pracovný priestor s reálnym uložením odoslaných inventúr a súkromím používateľa.", 507, 242, 397, size=18, leading=26)
paragraph("Hranica zadania: inventúra zaznamená rozdiely. Automatické prepísanie skladových zásob, správa pohybov a publikovanie do obchodov nie sú súčasťou jadra.", MARGIN, 111, 848, size=14.5, leading=20, color=MUTED)
C.showPage()

# 3
page(3, "Hlavný používateľský tok", "Funkčné zadanie", background=WHITE)
numbered_row(1, "Vstup do aplikácie", "Umožni vyskúšať demo alebo sa zaregistrovať a prihlásiť do vlastného pracovného priestoru.", 391)
numbered_row(2, "Nová inventúra", "Používateľ vyberie predajňu a zadá názov. Inventúra si uchová východiskový stav katalógu.", 326)
numbered_row(3, "Počítanie produktov", "Produkt nájde skenerom, vyhľadávaním alebo ručným kódom. Zadá celé nezáporné množstvo; prázdne pole sa odlišuje od nuly.", 261, height=78)
numbered_row(4, "Kontrola a odovzdanie", "Zobraz rozdiely a nedopočítané položky. Odovzdaj len kompletnú inventúru a zachovaj jej konečný záznam bez ďalších úprav.", 182, height=78)
C.showPage()

# 4
page(4, "Práca bez pripojenia", "Spoľahlivosť údajov")
numbered_row(1, "Uchovanie práce", "Rozpracovaná inventúra a už potvrdené množstvá musia prežiť ukončenie aj opätovné otvorenie aplikácie.", 389, height=78)
numbered_row(2, "Čakajúce odoslanie", "Pri výpadku spojenia uchovaj kompletnú inventúru vo fronte a jasne odlíš čakanie od úspešného odoslania.", 309, height=78)
numbered_row(3, "Bezpečné opakovanie", "Po návrate pripojenia umožni opakovanie. Aj pri stratenej odpovedi musí vzniknúť iba jeden odoslaný záznam.", 229, height=78)
proof("Premyslené správanie pri zlyhaní, trvalé uloženie práce a konzistentné odoslanie.")
C.showPage()

# 5
page(5, "Rozhranie a prístup k údajom", "Použiteľnosť")
paragraph("Rozhranie pre človeka", MARGIN, 391, 393, size=22, bold=True)
paragraph("Rešpektuj zvyklosti iOS a Androidu. Zachovaj prehľadnú navigáciu, čitateľnú typografiu a ovládanie pri väčšom texte.", MARGIN, 347, 393, size=18, leading=26)
paragraph("Priprav slovenčinu a angličtinu, svetlý aj tmavý vzhľad. Rieš načítanie, prázdny obsah, chyby a zamietnutý prístup ku kamere.", MARGIN, 241, 393, size=18, leading=26)
C.setStrokeColor(RULE)
C.line(476, 389, 476, 150)
paragraph("Oddelené pracovné priestory", 507, 391, 397, size=22, bold=True)
paragraph("Demo údaje a účty sa nesmú miešať. Používateľ môže čítať len dostupné predajne a vlastné odoslané inventúry.", 507, 347, 397, size=18, leading=26)
paragraph("Prístupové pravidlá overuj aj mimo obrazoviek. Čakajúce a odoslané záznamy zostávajú uzamknuté.", 507, 241, 397, size=18, leading=26)
proof("Cit pre používanie aplikácie a dôsledné hranice prístupu k údajom.")
C.showPage()

# 6
page(6, "Čo overiť", "Kvalita riešenia", background=WHITE)
numbered_row(1, "Pravidlá počítania", "Prázdna hodnota verzus nula, neplatné množstvá, správne rozdiely a úplnosť inventúry.", 391, height=57)
numbered_row(2, "Obnova po ukončení", "Uložené počítanie aj čakajúce odoslanie sa obnovia po novom spustení aplikácie.", 333, height=57)
numbered_row(3, "Opakované odoslanie", "Výpadok spojenia alebo stratená odpoveď nespôsobia stratu údajov ani duplicitný záznam.", 275, height=57)
numbered_row(4, "Hranice prístupu", "Cudzí účet sa nedostane k súkromným inventúram a konečný záznam nemožno prepísať.", 217, height=57)
numbered_row(5, "Celý tok na zariadení", "Prejdi vytvorenie, skenovanie, kontrolu a odoslanie. Over oba štýly ovládania, jazyky a ručný vstup bez kamery.", 159, height=70)
C.showPage()

# 7
page(7, "Čo odovzdať", "Výsledný výstup")
numbered_row(1, "Verejný repozitár", "Dodaj čistý zdrojový kód s postupnou históriou zmien a návodom na spustenie, overenie a vyskúšanie hlavného toku.", 389, height=80)
numbered_row(2, "Spustiteľnú ukážku", "Priprav demo s ukážkovými údajmi aj prihlásený režim. Prilož zostavenia na vyskúšanie a jasne pomenuj hranice rozsahu.", 307, height=80)
numbered_row(3, "Opakovateľné overenie", "Zmeny musia prejsť automatickými kontrolami a zostavením. Výstupy musia byť priraditeľné ku konkrétnej verzii kódu.", 225, height=80)
proof("Schopnosť odovzdať riešenie, ktoré vie ďalší človek spustiť, overiť a posúdiť.")
C.showPage()

# 8
C.setFillColor(INK)
C.rect(0, 0, WIDTH, HEIGHT, fill=True, stroke=False)
label("ZMYSEL ZADANIA", MARGIN, 493, color=LIME)
paragraph("Čo má projekt ukázať", MARGIN, 465, 848, size=35, leading=42, color=WHITE, bold=True)
capabilities = [
    ("Samostatné dodanie", "Vieš premeniť zadanie na použiteľnú aplikáciu a pripraviť ju na odovzdanie.", 56, 370),
    ("Rozumný návrh", "Vieš oddeliť zodpovednosti a udržať Flutter a Dart kód stručný, čitateľný a overiteľný.", 507, 370),
    ("Spoľahlivosť procesu", "Počítaš s výpadkami, obnovou práce, opakovaním požiadaviek a ochranou údajov.", 56, 218),
    ("Používateľský cit", "Navrhneš jasný pracovný tok aj zrozumiteľnú reakciu aplikácie, keď niečo nejde podľa plánu.", 507, 218),
]
for title, body, x, top in capabilities:
    paragraph(title, x, top, 397, size=23, leading=30, color=LIME, bold=True)
    paragraph(body, x, top - 47, 397, size=19, leading=27, color=WHITE)
footer(8, dark=True)
C.showPage()
C.save()
print(OUTPUT)
