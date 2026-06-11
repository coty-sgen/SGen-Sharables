# Speculator — Build Direction

**Built:** 2026-06-11 · Single self-contained `index.html` (SGEN V2 engine, reskinned).
**Brief:** `~/Workspace-V2/briefs/Speculator.md` · **Engine base:** `projects/2026-06-10-spectacles/index.html`.

## What this is

Ultra-premium **sculptural eyewear** homepage — **true ecom with checkout** (terminal
action = **Acquire** → mini-cart → 3-step checkout indicator). NOT browse-to-book like
Spectacles. A curated white-cube gallery, cold/architectural/museum-grade, with obsidian
anchor rooms. One self-contained file: one `<style>`, one JS IIFE, vanilla JS, no
frameworks/build. Only external dep = one Google Fonts `<link>` (system fallbacks).

## Section sequence (12 + mobile bag bar) — class/id used

| # | Section | Selector |
|---|---------|----------|
| 1 | Ultra-thin utility bar ("Enter the Studio →") | `.utility` |
| 2 | Invisible glass sticky header (centered wordmark, bag/search icons, cobalt Acquire) | `.site-header` (`#siteHeader`) |
| 3 | Hero — full-bleed cinematic film, grotesque headline LEFT, single cobalt CTA | `.hero` |
| 4 | Manifesto break ("Sculpting Sight. Defining Form.") obsidian room | `.manifesto` |
| 5 | The Gallery Exhibition — staggered masonry, hover "Exhibit Details" → price | `#exhibit` / `.exhibit` |
| 6 | Design Philosophy — asymmetric editorial, hinge mechanics, spec list | `#philosophy` / `.philo` |
| 7 | The Curation — horizontal single-product scroll, 3 flagship frames | `#curation` / `.curio` |
| 8 | Brand Universe film — full-bleed obsidian media break | `.universe` |
| 9 | Acquire — sticky-ish compact filter + product grid → cart → 3-step checkout | `#acquire` / `.products` / `.checkout` |
| 10 | Collector proof — one editorial pull-quote | `.room-dark` / `.proof` |
| 11 | Newsletter — minimal single-line editorial sign-up | `.news` |
| 12 | Footer — obsidian, geometric columns, studio locations, email line | `.footer` (`#footer`) |
| + | Mobile sticky bag bar | `.bagbar` |
| + | Mini-cart drawer / mobile nav drawer | `.cart` / `.drawer` |

**Hero archetype (rule 08):** Full-bleed film (`v-bleed` idiom), copy floating LEFT over
dark refracted-light space — chosen over Split because for this brand the *atmosphere* is the
message and the brief explicitly says "NOT a split hero."

## Token block (`:root`) — SGEN 5-token reskin

| Token | Value | Role |
|-------|-------|------|
| `--ink` | `#0B0C0E` | matte obsidian — text, dark rooms, chrome |
| `--paper` | `#ECEDEF` | alabaster — gallery base |
| `--surface` | `#FFFFFF` | card / plinth float |
| `--accent` | `#2E4BFF` | electric cobalt — the ONLY accent |
| `--muted` | `#8A8F98` | titanium gray — secondary, dividers |
| `--body` | `#3A3D42` | body copy |
| `--line` | `rgba(11,12,14,.10)` | hairline structure |

Radii: `--r-chip:4px / --r-card:6px / --r-panel:8px` — **square-ish architectural**, NOT pills.
Buttons fill↔outline, mono uppercase labels. Ease: `cubic-bezier(.16,.7,.2,1)` settle (silent).

**Type:** Display `Archivo` (800/700, tight tracking) → Helvetica Neue/Arial. Body `Inter`.
Specs/eyebrows/labels `IBM Plex Mono` (brand-justified — edition numbers, materials, specs).

## Engine reused from Spectacles (verbatim machinery, reskinned)

Reveal IntersectionObserver (settle-ease stagger), sticky-header shadow, mobile drawer,
product-grid live filter, toast. **Filter both-rows fix carried over** — the mobile filter
toggle opens BOTH the shape AND material rows (Spectacles' one-row bug does NOT recur;
verified). **New for Speculator:** mini-cart drawer (add/remove, count badge, subtotal),
3-step checkout indicator that advances Bag→Details on "Proceed," horizontal curation
scroller, universe play stub.

## Working interactions (vanilla JS, verified in preview)

- Mobile nav drawer open/close (+ Escape, backdrop) · mini-cart drawer open/close
- Product live filter (shape × material), no-results state + reset — round+gold → 1 (Halo)
- Add-to-Acquire → cart line item + count badge + subtotal ($1,280 for Halo, correct)
- Hover price-reveal on gallery plinths (rest opacity 0 → reveal on hover)
- Horizontal curation scroll (prev/next, scroll-snap)
- Newsletter submit stub (preventDefault) · universe play stub (toast)

## Verified by construction

- Single file: 0 external `<script src>`, exactly 1 stylesheet `<link>` (fonts), 1 `<style>`, 1 IIFE.
- **Zero horizontal overflow at 375px AND 360px** (`scrollWidth - clientWidth = 0`).
  Fixed one bug during build: `.philo__visual` overflowed mobile (aspect-ratio + min-height
  derived width) — removed `min-height`, added `width:100%;max-width:100%`.
- Reflow: products 4→3→2→1 col; exhibit masonry 3→2→1 col; philosophy 2→1 col; checkout 3→1 col.
- Reduced-motion: `@media (prefers-reduced-motion:reduce)` kills animation/transition + forces
  `.reveal` visible + stops hero/universe ambient loops.
- A11y: semantic landmarks (`header`/`section`/`footer`/`aside`/`nav`/`figure`), real
  `<button>`s, 23 aria-labels on icon buttons, focus-visible cobalt ring, decorative SVG
  panels `aria-hidden`.

## PLACEHOLDERS — swap before production (rule 06)

ALL imagery is zero-dependency CSS/SVG — none are real photography. A full manifest is in the
HTML comment block at the top of `index.html`. Summary:

1. **Hero film** (`.hero__stage`) — radial cobalt-light + conic refraction + hard scrim +
   SVG twin-lens line-art. → real cinematic loop: light through sculpted lenses.
2. **Manifesto / Universe rooms** — concrete-gradient + cobalt glow + scanning line pattern.
   → obsidian gallery-room footage / soundless architectural loop.
3. **Gallery plinths, curation frames, product tiles** — inline SVG frame silhouettes
   (`frameSVG()` factory: round / square / rectangle / aviator, tinted per material). → real
   product photography (subject-truth: real SKUs for the shop grid).
4. **Philosophy visual** — SVG hinge-mechanics macro line-art. → real titanium-hinge/acetate macro.

Also placeholder: all **copy, prices ($680–$1,340), edition numbers, studio locations**
(NYC/MIL/TYO), the pull-quote attribution, and `studio@speculator.example`.

## Flagged assumptions (from brief, carried into build)

- Brand kit (logo wordmark, exact hex, fonts) is **proposed**, not final — swap real assets.
- **Full online checkout assumed** (high-ticket true ecom) — confirm vs. any concierge /
  made-to-order flow. Checkout here is a 3-step *indicator* stub, not a payment integration.
- Mono (IBM Plex Mono) for specs/labels is a **deliberate brand choice**, not a default.
- Reference sites (Gentle Monster, Jacques Marie Mage, MYKITA, Kuboraum, Apple) were
  brief-stage, not live-verified at build — palette/voice can be corrected if needed.

---

## ⟢ Palette revision — "E · Graphite × Ice-Steel" (replaces obsidian + electric cobalt)

User reviewed 5 options (`palette-options.html`) and chose **E**. New `:root` reskin:

| Token | Value | Role |
|-------|-------|------|
| `--ink` | `#161A20` | graphite — text, dark rooms, chrome |
| `--paper` | `#EFF1F3` | cool white — gallery base |
| `--accent` | `#5C7C92` | ice-steel — fills, hairlines, hero accent |
| `--accent-2` | `#44616F` | deep steel — solid buttons/badge + small accent text on light (AA-safe) |
| `--muted` | `#8A929C` | cool titanium grey |
| `--body` | `#353B43` | body copy |

All cobalt removed (SVG strokes/fills, light tint `#7e90ff`→`#9FB6C6`, glow rgba). Anchored to V1 `palette-08-charcoal-bronze` (steeled) / `12-steel-slate`.

**A11y:** pure `#5C7C92` is a mid-tone (white 4.45 / dark 4.30 — both just miss AA 4.5 for small text). Solid fills + small accent text on light use the deeper `--accent-2 #44616F` → 5.8–6.6:1, AA pass. Verified via computed-style contrast eval; 0 horizontal overflow @1280 + @375.

**Open (pre-existing, not from this reskin):** ~30px header overflow at mid widths (~800–960px) — `.hright` nav cluster before the mobile breakpoint. Needs a responsive tweak.

---

## ⟢ Imagery + structure pass (real photos + lc-us-inspired restructure)

**Imagery** (stock placeholders, eye-verified rule 06, cool/architectural set): hero.jpg (B&W chiaroscuro, round glasses, dark-left for headline) · silh-1..4 (Forms tiles) · frame-01..08 (product grid + curation + cart) · flagship-1 (Philosophy visual) · universe.jpg (brutalist concrete). All HTTP 200, verified.

**Structure (merge + borrow 2, zero redundancy)** — borrowed from lenscrafters.com/lc-us (fetched live, not memory):
- Removed the redundant masonry grid; **#acquire is now the SINGLE shoppable gallery**, retitled "The Exhibition — The collection, staged as sculpture."
- Repurposed the old Gallery-Exhibition slot → **"Explore the Forms"** silhouette navigator (4 cinematic tiles → scroll to shop). NOT per-shape filtering: placeholder catalog is round/square only.
- Added a **benefits/trust strip** (Numbered Editions · Hand-finished Acetate · Worldwide Express · Lifetime Service).
- Nav deduped: Forms · Philosophy · Curation · Exhibition (4 distinct targets).

**Truthful filter reconciliation:** catalog trimmed 12→8, ALL acetate, shapes square(5)/round(3). Filter = All/Round/Square only; **Rectangle, Aviator, and the entire Material facet removed** (no such product photography on free stock).

**Verified (this turn, live):** all images 200; filter 5/3/8; silhouettes → #acquire; cart add shows real frame image; 0 horizontal overflow @1280 AND @375 (forms 2-col, grid 1-col mobile); console clean; palette E tokens unchanged. Fixed `.pcard__tag` white-on-#5C7C92 (4.42:1) → `--accent-2` (6.6:1, AA).

**Flagged placeholders:** frame-04..08 are crops of frame-01/02/03; silh-4 is a bare-eye study; craft.jpg/flagship-2/flagship-3 unused; product tiles mix black & neutral grounds; all stock pending license. Real catalog → restore missing shapes (cat-eye/rectangle/aviator/metal) + per-shape silhouette deep-links + a true hinge macro.

---

## ⟢ Hero "Request a private viewing" panel (reference-inspired, restructured)

User shared the Spectacles hero trust-strip + booking-card unit and asked for "something like it, structured different." Built a **hero-attached asymmetric frosted-glass panel** — distinct from the Spectacles stacked strip-on-card:
- **Left:** the action card — "By appointment / Request a private viewing" + a date input + Reserve (client-side stub: validates → toast → reset). Replaces the booking flow (Speculator is ecom, not eye-exam booking) per user pick "Private viewing."
- **Right:** the 4 benefit cells (Numbered Editions · Hand-finished Acetate · Worldwide Express · Lifetime Service) in a 2×2 grid, hairline divider between.
- Graphite frosted glass (`--glass`), ice-steel accents, square architectural corners — palette E intact.
- In-flow flex-column hero (`margin-top:auto`) so copy + panel never overlap (35px gap); mobile stacks (card over 2×2 benefits, date+Reserve stacked).
- **Removed the redundant mid-page trust strip** (its cells now live in this panel) + the decorative hero edition/scroll-cue.

**Verified live:** desktop asymmetric split + mobile stacked; 0 horizontal overflow @1280 & @375; Reserve stub (empty→"Choose a date", filled→"requested"+reset); console clean; tokens unchanged.

---

## ⟢ Typeface revision — display → Bodoni Moda (option B)

User reviewed 5 rendered pairings (`type-options.html`) and chose **B**. Headline face swapped Archivo → **Bodoni Moda** (high-contrast Didone); body stays Inter, captions stay IBM Plex Mono.
- Google Fonts link → `Bodoni Moda` (opsz 6..96, wght 400–700); `--disp:"Bodoni Moda",Didot,"Times New Roman",Georgia,serif`.
- **Retuned all display rules for the serif** (a token swap alone would crush it): weights 800/700 → 500–600, letter-spacing −.02…−.04em → 0/−.005em, line-heights eased — via one override block so the grotesque-tuned values don't fight Bodoni. Affects hero h1, wordmark, manifesto/universe/news h2, viewing title, curio/pcard/citem/form-tile names, proof quote.
- **Verified live:** `--disp` + hero h1 render Bodoni Moda, weight 600, font loaded; 0 horizontal overflow @1280 & @375; console clean; palette E + Inter body + mono captions unchanged.

---

## ⟢ "Explore the Forms" composition → D · Horizontal strips

User reviewed 5 rendered comps (`forms-options.html`) and chose **D**. Converted the four-up grid → full-width editorial strips (one per row, ~3.2:1 desktop / 3:2 mobile), label left over a left scrim, mono index (01–04) right, hover = subtle zoom + ice-steel duotone shift.
- **Mitigated the portrait-crop issue** (my flag on D): per-image `object-position` tuned so each band frames the glasses/eyes (Aviator 30% · Rectangle 42% · Sculptural 26% · Gaze 46%), and mobile uses a taller 3:2 band so faces aren't sliced.
- **Verified live:** forms = 1-col, 4 strips, indices 01–04; per-image crops keep glasses/eyes in frame (desktop + mobile screenshots); 0 horizontal overflow @1280 & @375; console clean; still links to #acquire.

---

## ⟢ "Explore the Forms" images → Spectacles-style frame-shape close-ups

Per user: the silhouette tiles should show glasses like the Spectacles shop-by-shape, with each title matching the shape shown. Reused the 4 client B&W shape close-ups from the Spectacles project (shape-round/square/cat-eye/rectangle.jpg, 1000×400) → copied into images/, retitled the strip tiles **Round · Square · Cat-eye · Rectangle**. Reset per-image crop to a uniform object-position (center 42%) since the new images are landscape glasses-centered.
- **Verified live:** 4 strips show round/square/cat-eye/rectangle frames; titles match images; all loaded; 0 horizontal overflow @1280 & @375; console clean (desktop + mobile screenshots).
- Note: images are the Spectacles client placeholders (Eye.zip set), reused for this iteration. Old silh-1..4 left unreferenced in images/.

---

## ⟢ Fix — Collector Proof (review) was invisible

"Show review" surfaced a dark-on-dark bug: `.proof blockquote` and `.proof figcaption b` used `color:var(--ink)` on the `.room-dark` (`--ink`) section → quote + reviewer name invisible (1.0:1 contrast). Fixed both to `#fff` (17.46:1). Verified live (contrast eval + screenshot).

---

## ⟢ Typeface revision — display → Fraunces (page-wide)

User picked Fraunces from the type-specimen. Swapped display face Bodoni Moda → **Fraunces** (contemporary serif) site-wide: Google Fonts link (opsz 9..144), `--disp:"Fraunces",Georgia,serif`, + provenance/tuning comments. Body stays Inter, captions IBM Plex Mono. Serif display-tuning override (weight ~600, relaxed tracking) carried over.
- Verified live: --disp + hero h1 + wordmark render Fraunces (wght 600), font loaded; 0 horizontal overflow @1280 & @375; console clean; desktop + mobile.

---

## ⟢ Grid images — repick + AI attempt + fallback

- Repicked grid images via stock (background agent): unified to a consistent dark monochrome set, but free stock yielded only ~2 distinct products, all SQUARE (no round-on-dark exists in free stock).
- AI generation attempted (Gemini Nano Banana via design skill): generator written (`_ai_gen_frames.py`, round/square-per-card prompts on dark concrete). BLOCKED — the provided key's free tier returns 429 `generate_content_free_tier_requests, limit: 0` for the image models (image gen requires a billing-enabled project). Ready to run the moment billing is enabled.
- FALLBACK applied (user choice): relabeled Lumen/Obelisk/Aperture round→square (now match the square stock images), dropped the empty Round filter chip. Filter = All/Square. Verified: 0 round-labeled cards, filter works, 0 overflow, console clean. Truthful + consistent interim until AI round/square set is generated.

---

## ⟢ Grid images — variation pass (Pexels + Unsplash), Round restored

Variety-first repick (background agent): 8 GENUINELY DISTINCT B&W eyewear frames from Pexels/Unsplash (vs ~2 before), unified by a cool grayscale grade (grounds still vary — variety prioritized per user). Shape mix = 3 round (frame-02/04/06) + 5 square.
- Reconciled catalog (shapes eye-verified by me): Monolith/Halo/Obelisk → round; restored the Round filter chip (All/Round/Square).
- Verified live: Round→3, Square→5, All→8 (all return results); shapes match images; 0 overflow @1280 & @375; console clean.
- Flags: B&W unifies but grounds differ (black/grey/white); frame-05/08 keep faint desk/notebook context (frame still the subject); no cat-eye/aviator survived free-stock verification; all placeholders pending licensing. (AI generator _ai_gen_frames.py still ready for a billing-enabled key.)
