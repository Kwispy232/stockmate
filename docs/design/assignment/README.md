# Project brief PDF

`generate_pdf.py` creates the Slovak assignment and assessment brief at
`output/pdf/stockmate-zadanie.pdf`.

```sh
python3 docs/design/assignment/generate_pdf.py
```

Requires ReportLab and either Arial (macOS) or DejaVu Sans (Linux). The output
has seven landscape pages at 960 x 540 points, matching the 16:9 presentation
ratio. Text stays selectable and fonts are embedded.

The brief describes the inventory app's scope, required behavior, verification,
delivery, and intended demonstration of skills. It leaves technology choices
open except for Flutter and Dart. It is a portfolio brief, not an official
employer assignment.
