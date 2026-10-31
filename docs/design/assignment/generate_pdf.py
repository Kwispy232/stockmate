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


def page(title, eyebrow, background=CREAM):
    C.setFillColor(background)
    C.rect(0, 0, WIDTH, HEIGHT, fill=True, stroke=False)
    label(eyebrow.upper(), MARGIN, 493)
    paragraph(title, MARGIN, 465, 848, size=35, leading=42, bold=True)


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
C.showPage()

# 2
page("Cieľ a rozsah", "Zámer projektu")
paragraph("Vytvor aplikáciu, v ktorej pracovník predajne spočíta skutočné množstvá produktov a odovzdá overiteľný inventúrny záznam.", MARGIN, 392, 814, size=23, leading=32)
paragraph("Pracovné prostredie", MARGIN, 280, 380, size=21, bold=True)
paragraph("Aspoň dve ukážkové predajne s katalógom produktov. Každý produkt má názov, interný kód, čiarový kód a evidované množstvo.", MARGIN, 242, 384, size=18, leading=26)
paragraph("Dva spôsoby vyskúšania", 507, 280, 397, size=21, bold=True)
paragraph("Lokálne demo bez účtu a pripojenia. Prihlásený pracovný priestor s reálnym uložením odoslaných inventúr a súkromím používateľa.", 507, 242, 397, size=18, leading=26)
C.showPage()

# 3
page("Hlavný používateľský tok", "Funkčné zadanie", background=WHITE)
numbered_row(1, "Vstup do aplikácie", "Umožni vyskúšať demo alebo sa zaregistrovať a prihlásiť do vlastného pracovného priestoru.", 391)
numbered_row(2, "Nová inventúra", "Používateľ vyberie predajňu a zadá názov. Inventúra si uchová východiskový stav katalógu.", 326)
numbered_row(3, "Počítanie produktov", "Produkt nájde skenerom, vyhľadávaním alebo ručným kódom. Zadá celé nezáporné množstvo; prázdne pole sa odlišuje od nuly.", 261, height=78)
numbered_row(4, "Kontrola a odovzdanie", "Zobraz rozdiely a nedopočítané položky. Odovzdaj len kompletnú inventúru a zachovaj jej konečný záznam bez ďalších úprav.", 182, height=78)
C.showPage()

# 4
page("Rozhranie a prístup k údajom", "Použiteľnosť")
paragraph("Rozhranie pre človeka", MARGIN, 391, 393, size=22, bold=True)
paragraph("Rešpektuj zvyklosti iOS a Androidu. Zachovaj prehľadnú navigáciu, čitateľnú typografiu a ovládanie pri väčšom texte.", MARGIN, 347, 393, size=18, leading=26)
paragraph("Priprav slovenčinu a angličtinu, svetlý aj tmavý vzhľad. Rieš načítanie, prázdny obsah, chyby a zamietnutý prístup ku kamere.", MARGIN, 241, 393, size=18, leading=26)
C.setStrokeColor(RULE)
C.line(476, 389, 476, 150)
paragraph("Oddelené pracovné priestory", 507, 391, 397, size=22, bold=True)
paragraph("Demo údaje a účty sa nesmú miešať. Používateľ môže čítať len dostupné predajne a vlastné odoslané inventúry.", 507, 347, 397, size=18, leading=26)
paragraph("Prístupové pravidlá overuj aj mimo obrazoviek. Čakajúce a odoslané záznamy zostávajú uzamknuté.", 507, 241, 397, size=18, leading=26)
C.showPage()

# 5
page("Čo overiť", "Kvalita riešenia", background=WHITE)
top = 391
for text in [
    "Over, že aplikácia rozlišuje prázdnu hodnotu od nuly, odmieta neplatné množstvá a správne vypočíta rozdiely aj úplnosť inventúry. Uložené počítanie a čakajúce odoslanie sa musia obnoviť po novom spustení aplikácie.",
    "Vyskúšaj výpadok spojenia aj stratenú odpoveď pri odosielaní. Nesmú viesť k strate údajov ani k duplicitnému záznamu. Over tiež, že cudzí účet nemá prístup k súkromným inventúram a konečný záznam nemožno prepísať.",
    "Na zariadení prejdi celý tok od vytvorenia inventúry cez skenovanie a kontrolu až po odoslanie. Skontroluj ovládanie na iOS aj Androide, oba jazyky a ručné zadanie kódu bez kamery.",
]:
    top = paragraph(text, MARGIN, top, 848, size=19, leading=28) - 22
C.showPage()

# 6
page("Čo odovzdať", "Výsledný výstup")
numbered_row(1, "Verejný repozitár", "Dodaj čistý zdrojový kód s postupnou históriou zmien a návodom na spustenie, overenie a vyskúšanie hlavného toku.", 389, height=80)
numbered_row(2, "Spustiteľnú ukážku", "Priprav demo s ukážkovými údajmi aj prihlásený režim. Prilož zostavenia na vyskúšanie a jasne pomenuj hranice rozsahu.", 307, height=80)
numbered_row(3, "Opakovateľné overenie", "Zmeny musia prejsť automatickými kontrolami a zostavením. Výstupy musia byť priraditeľné ku konkrétnej verzii kódu.", 225, height=80)
proof("Schopnosť odovzdať riešenie, ktoré vie ďalší človek spustiť, overiť a posúdiť.")
C.showPage()

# 7
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
C.showPage()
C.save()
print(OUTPUT)
