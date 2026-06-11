# Dev Handoff — Metro Sunnies Homepage

> **This bundle = the dev handoff.** The `index.html` in this folder is a single HTML file with
> **all *local* images inlined as base64** (hero, category cards, deal banner) — no `img/` folder,
> no build step, no server. Open it directly in a browser.
>
> **Two external dependencies remain (both CDN, both intentional):** Google Fonts (one `<link>`) and
> the **Unsplash placeholder photos** used in *Trending Now* and *Loved by the Loop* (see §7). These
> load over the network and are flagged for replacement with licensed/real assets.
>
> **Source of truth (un-inlined):** `projects/2026-06-11-metro-sunnies/` — `index.html` referencing an
> `img/` folder, plus `direction.md` / `redesign-direction.md` (full revision log). Re-inline any time
> with `dev-handoff/_build_metro_handoff.py`.

**Generated:** 2026-06-11 · grounded in the actual CSS/JS, not a mockup.

---

## 1. Overview

Single flagship homepage for **Metro Sunnies**, a Gen-Z, mobile-first **e-commerce eyewear** brand
("Live the Loop"). Model is **true commerce**: browse → **Quick-Bag** → mini-cart → **checkout**
(client-side stub). Calm, photo-led, optical-credible — a "light blue + light brown" (Sky-led) palette
with an elegant serif display face.

Sections, top→bottom: marquee ribbon → **glass** sticky header → full-bleed hero (`v-bleed`) →
trust/service strip → **shop hub "Find your frames"** (4 category cards) → **deal banner**
(full-bleed promo) → **Trending Now** (best-seller carousel + Quick-Bag) → **By the numbers**
(count-up stat band) → **Loved by the Loop** (UGC bento + verified reviews) → **Join the Loop**
(newsletter) → footer. Plus a **mobile sticky Quick-Bag bar** and a **mobile drawer**.

## 2. Tech & delivery

| Aspect | Spec |
|--------|------|
| Stack | Plain HTML + inlined CSS + vanilla JS. **No build step, no framework, no dependencies.** Open the file directly. |
| External deps | (1) Google Fonts `<link>` (`DM Serif Display` + `DM Sans`) — system fallbacks if blocked. (2) Unsplash placeholder photos via CDN (Trending + UGC) — see §7. |
| JS | One IIFE at the bottom: reveal observer, count-up (2 bands), marquee pause, glass sticky header, mobile drawer, trending carousel, Quick-Bag → mini-cart → checkout, newsletter stub. No external scripts. |
| Backend | **None.** Checkout and newsletter are client-side stubs (see §8). Wire to real endpoints for production. |
| Browser support | Modern evergreen. Uses `backdrop-filter` (glass), `aspect-ratio`, CSS grid, `IntersectionObserver`, and an inline **SVG `feTurbulence`/`feDisplacementMap`** filter (the hand-drawn underline) — all gated/fallback-safe. |

## 3. Design tokens (`:root`)

Reference token names, not raw values — they're CSS custom properties. Palette = locked direction
**E "Sky-led"** (light blue + light brown).

| Token | Value | Usage |
|-------|-------|-------|
| `--paper` | `#F1F4F4` | Powder-blue-tinted base background |
| `--ink` | `#1F2E37` | Deep slate — body/heading text + primary CTA (never `#000`) |
| `--accent` | `#4E7C9B` | Dusty blue — eyebrows, links, active state, brand voice |
| `--accent-deep` | `#3C657F` | Accent hover/active |
| `--sky` / `--sky-2` | `#DCE8EE` / `#C7DAE3` | Light blue — hero block, soft panels |
| `--camel` | `#C7A982` | Light brown — warm accent, underline, deal CTA |
| `--camel-deep` | `#A9854F` | Camel hover/active |
| `--latte` | `#E7DECF` | Pale brown — warm surfaces |
| `--surface` | `#FFFFFF` | Cards |
| `--body` | `#4E5C63` | Body copy |
| `--muted` | `#8A99A0` | Secondary text / labels |
| `--line` / `--line-2` | `rgba(31,46,55,.13)` / `.07` | Hairline borders |
| `--grad-sky` / `--grad-camel` | sky / camel linear gradients | Soft panels, accents |
| `--r-chip` / `--r-card` / `--r-panel` / `--r-pill` | `10 / 20 / 28 / 9999px` | Radii scale |
| `--shadow-rest` / `--shadow-card` / `--shadow-hover` / `--shadow-pop` | slate-tinted, never `#000` | Elevation |
| `--ease` | `cubic-bezier(.16,.7,.3,1)` | Signature settle (reveals, hovers) |
| `--t-fast` | `.2s ease-out` | Hover transitions |
| `--glass` | `blur(20px) saturate(180%)` | Frosted header + mobile bar |
| `--wrap` | `1200px` | Max content width |
| `--disp` | `"DM Serif Display"`, Georgia fallback | Display headings, wordmark, stat numbers (ships **weight 400 only** — `font-synthesis:none` prevents faux-bold) |
| `--sans` | `"DM Sans"`, system fallback | Body, UI, eyebrows, labels |

**Type scale (fluid `clamp`):** hero H1 `clamp(46px,8vw,88px)` serif; section H2 `clamp(30px,5.4vw,62px)`;
body 16px/1.6; eyebrow 12px uppercase `letter-spacing:.18em`.

## 4. Sections (top → bottom)

1. **Marquee ribbon** — auto-scrolling promo strip (`Sunnies · Optical · Readers — Live the Loop`, free shipping, student 15%), pausable, reduced-motion safe.
2. **Glass sticky header** — translucent frosted bar (`--glass`); wordmark `MetroSunnies`; nav `Shop · New Drop · Community`; search / account / cart icons with live count. Firms up on scroll (`.is-stuck`).
3. **Hero** — full-bleed image (`v-bleed`) + left scrim; "Live the **Loop**" (serif, sky accent, hand-drawn camel **pencil underline**); two CTAs; star-rating + count-up social proof.
4. **Trust / service strip** — 4-up icon row (free 5-frame try-on, store/locker pickup, easy 30-day returns, loyalty points).
5. **Shop hub — "Find your frames"** — 4 category cards (Sunnies / Optical / Blue-light / Readers), full-bleed image fills each card + scrim + overlay text.
6. **Deal banner** — full-bleed promo ("Buy one, gift one"), left light-scrim (top-weighted on mobile).
7. **Trending Now** — best-seller carousel (scroll-snap swipe + prev/next arrows), per-card **Quick-Bag**.
8. **By the numbers** — count-up stat band (`120,000+` / `500+` / `30-day` / `15%`), serif numerals + raised accent suffixes.
9. **Loved by the Loop** — UGC bento (6 tiles, packed 4×2) + verified photo-review cards.
10. **Join the Loop** — newsletter incentive (15% off first order) — client-side stub.
11. **Footer** — brand, socials, shop links, listen-in, store hours, legal.
12. **Mobile** — sticky Quick-Bag bar + slide-in drawer (≤860px).

## 5. Layout & motion

- **Hero archetype:** #2 Full-bleed + scrim (`v-bleed`). The hero photo *is* the promise.
- **Underline accent:** the "Loop" underline is an inline-SVG hand-drawn **colored-pencil stroke** (tapered curved swipe, `feTurbulence`+`feDisplacementMap` grain, camel `#C7A982`).
- **Reveals:** `IntersectionObserver` adds `.in-view` (staggered fade/rise), `--ease` settle.
- **Count-up:** two independent bands fire on scroll — hero proof (`#statsBand`) and the stat band (`#proofStats`). Generalized observer over `["statsBand","proofStats"]`.

## 6. Commerce flow (client-side)

- **Quick-Bag** (trending cards) → increments header + mobile-bar counts (bump anim) → **mini-cart drawer** (qty steppers, remove, live subtotal, free-shipping progress bar).
- **Checkout** — in-drawer contact/shipping/payment form → client-side validation → success view → clears cart. **No backend** — wire to a real cart/checkout service.

## 7. Imagery

**Inlined locally in this handoff (base64 — production-ready to swap for final art):**
- `hero.png` — hero (warm laughing-in-pink-sunglasses portrait).
- `cat-sunnies.png` / `cat-optical.png` / `cat-bluelight.png` / `cat-readers.png` — the 4 category cards.
- `deal-bogo.jpg` — deal banner (sourced from the Spectacles project bundle).

**External Unsplash placeholders (CDN hotlinks — NOT inlined; replace with licensed/real assets):**
- **Trending Now** — 8 product photos, built in JS via `frameImg(id)` (base `images.unsplash.com/` + photo id).
- **Loved by the Loop** — 6 UGC tile photos (static `src`).

All imagery is held to the brand's warm, Gen-Z, young-models-in-eyewear direction.

## 8. Known flags / TODO before production

- **Café copy leftovers:** café was removed as a business pillar, but two copy strings still mention it — a review quote (*"Picked up at the café and got a free matcha"*) and the newsletter (*"free café perks"*). Remove/replace for consistency.
- **Placeholder image duplication:** 3 of the 6 *Loved by the Loop* UGC photos reuse *Trending Now* product photo IDs (verified young-in-eyewear images were preferred over unverified ones). Replace with unique real UGC.
- **`@thecrew` UGC tile** is a young group but not everyone is wearing eyewear.
- **Stubs:** checkout + newsletter are client-side only — wire to real endpoints.
- **Placeholders:** prices, stats (`120,000+` etc.), review names, social handles, store hours are representative.

## 9. Mobile (primary — verified)

Mobile-first per brief. Verified: **no horizontal overflow at 375px or 360px**; hamburger **drawer**
(`Shop · New Drop · Community · Join the Loop`); **sticky Quick-Bag bar** pinned; trending carousel
**swipe-native**; all sections stack (hero CTAs full-width, category cards 1-col, stat band 2-col,
UGC bento 2-col, footer 2→1-col, deal banner top-weighted scrim). **Touch targets** raised to mobile
guidance: Quick-Bag 44px, footer links 40px, legal links 33px, marquee pause 36px. All motion gated
behind `prefers-reduced-motion`.
