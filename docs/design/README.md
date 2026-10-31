# StockMate design handoff

Open `StockMate.fig` in OpenPencil. The document is an editable design based on the v0.1.0 app, including changes from design review.

## Pages

| Page | Contents |
| --- | --- |
| 00 · Sprievodca | Navigation and editing guide |
| 01 · iOS | 13 viewport compositions and 3 full scroll references, 420 × 912 baseline |
| 02 · Android | Matching compositions, 412 × 924 baseline |
| 03 · Stavy a dialógy | 14 supporting states and 8 platform-specific confirmation dialogs |
| 04 · Navigačné flowy | Workspace entry, counting/review, and offline submission maps |
| 05 · Komponenty a témy | 8 linked button masters, 34 semantic color variables, controls and 4 dark-mode compositions |

Text, shapes, vector icons, cards, and layouts are editable. Button instances expose a `Label` property. Change master buttons on page 05; colors are in the Light and Dark variable collections. Mobile content uses auto-layout, with explicit positioning for system chrome, overlays and flow connectors.

The diagrams are visual navigation maps, not a clickable prototype. System bars, keyboard and camera preview are editable schematic representations. iOS uses the available Helvetica Neue Regular, Medium and Bold faces instead of the app's system SF Pro. Android uses Roboto. The optional stock-administration workflow discussed in chat is outside this reconstruction.

`source/*.jsx` contains inspected snapshots exported from the final editor document. The `.fig` file is the canonical editable source: JSX exports flatten component instances and do not reproduce the whole component-property graph. `tokens.json` is the editor's design-token export.

## Reviewed design changes

The welcome screen now contains a centered logo and the demo/sign-in actions. Authentication includes a password-visibility control and removes the explanatory account text. Inventory lists remove their introductory copy and refresh button, with pull-to-refresh states shown for both platforms. The count editor's backdrop and keyboard alignment are corrected. Full-content references, offline and dark variants, and interaction notes follow these changes.

The Flutter app implements the simplified welcome screen, password visibility, and native pull-to-refresh on both platforms. The canvas states and flow notes describe the corresponding interactions.

## Sharing

[Open the live OpenPencil room](https://app.openpencil.dev/share/1rw1hpysg2m5nm7tsg3onc2oznc57tcz) or [download the editable file](https://github.com/Kwispy232/stockmate/raw/refs/heads/codex/design-handoff/docs/design/StockMate.fig).

The live room was verified from a second browser. Anyone with its link can join and edit, while at least one participant with a copy is online. The download works independently of the room. Browser clients may substitute the local Helvetica Neue faces used by iOS frames; the desktop file was checked with those fonts installed. OpenPencil documents its peer-to-peer room behavior in the [collaboration guide](https://openpencil.dev/programmable/collaboration).

## Checks

The file was saved and reopened independently. Component labels, all 8 masters and 34 variables survived the round trip; a representative screen rendered identically. Every content page was checked for font availability and design lint. The final document has no missing/substituted fonts, errors or warnings. Informational suggestions remain for intentional choices such as absolute positioning of system elements, native-control radii, and non-grid spacing.

Some editor versions expose Figma's empty `Internal Only Canvas` when importing a `.fig`; it is a technical page without design content.

## Assignment PDF

The separate assignment is at `output/pdf/stockmate-zadanie.pdf`. Its 7 pages use a 16:9 format. Editable PDF generation sources and regeneration instructions are in `assignment/`.
