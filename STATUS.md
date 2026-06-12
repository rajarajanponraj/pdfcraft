# PDFCraft Monorepo Status & Roadmap

This document tracks the release status and roadmap for the entire PDFCraft ecosystem.

## Package Status Tracker

| Package | Status | Current Version | Target Week | Notes |
|---------|--------|-----------------|-------------|-------|
| `pdfcraft_core` | ✅ Ready to Publish | `v0.1.0` | Week 1 | Core schemas, models, and plugin contracts completed. Pub.dev assets generated. |
| `pdfcraft_generator` | ✅ Ready to Publish | `v0.1.0` | Week 3 | PDF export engine, Text/Image renderers, custom font support completed. Pub.dev assets generated. |
| `pdfcraft_designer` | 🚧 In Progress | `v0.1.0` | Week 8-11 | Visual drag-and-drop builder, canvas, selection, zoom, history stack. |
| `pdfcraft_form` | ⏳ Pending | - | Week 12-15 | Form engine, dynamic forms, text fields, checkboxes, validation, expression engine. |
| `pdfcraft_table` | ⏳ Pending | - | Week 16-17 | Dynamic rows, merged cells, auto height, repeating headers. |
| `pdfcraft_barcode` | ⏳ Pending | - | Week 21 | Code128, EAN13, UPC support. |
| `pdfcraft_qrcode` | ⏳ Pending | - | Week 22 | Static & Dynamic QR support. |
| `pdfcraft_svg` | ⏳ Pending | - | Week 27 | SVG import and rendering. |
| `pdfcraft_richtext` | ⏳ Pending | - | Week 28 | Styled text and HTML import. |
| `pdfcraft_signature` | ⏳ Pending | - | Week 29-30| Digital signature capture and rendering. |

---

## Detailed Milestone Roadmap

### Phase 1: Core Foundation (Completed)
- [x] Workspace setup (Melos, `very_good_analysis`)
- [x] `pdfcraft_core` initial schema models (`Template`, `Page`, `Field`, `Style`)
- [x] Plugin contracts and registry
- [x] Unit tests & deep JSON serialization

### Phase 2: PDF Generation Engine (Completed)
- [x] `pdfcraft_generator` package creation
- [x] Engine to parse `Template` to `pw.Widget`
- [x] `FieldRenderer` abstractions
- [x] `FontManager` for TTF/OTF external fonts

### Phase 3: Template Management & Shapes (Completed)
- [x] **Week 5**: Template Loading & Saving utilities, Field Registry improvements.
- [x] **Week 7**: Advanced Shapes Plugins (Line, Rectangle, Circle).

### Phase 4: Designer Scaffold
- [x] **Week 8-9**: Canvas UI, Selection, Movement, Deletion.
- [x] **Week 10-11**: Resizing, Grid snapping, Guidelines, Inspector Panel.

### Phase 5: Forms & Data Binding
- [x] **Week 12-13**: Text Fields, Checkboxes, Dropdowns.
- [x] **Week 14-15**: Expression Engine (`petitparser`), Data Binding (`{{data}}`), Conditional Logic.

### Phase 6: Tables & Stable Release
- [x] **Week 16-17**: Pagination, Page Splitting, Repeating Rows.
- [x] **Week 18-20**: `v1.0.0` Stable Release across Core, Generator, Designer, Forms, and Tables!
