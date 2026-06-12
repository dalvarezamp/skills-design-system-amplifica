# Tokens — CSS Variables

Copia directamente en `globals.css` o en tu `tailwind.config.ts`.

## CSS Custom Properties

```css
:root {
  /* Primary (Brand) */
  --color-primary-25:  #EBF1FF;
  --color-primary-50:  #D6E2FF;
  --color-primary-100: #B6CBFF;
  --color-primary-200: #8CA9FF;
  --color-primary-300: #637BFF;
  --color-primary-400: #4548FF;
  --color-primary-500: #2F30FF;
  --color-primary-600: #1F1DDE;
  --color-primary-700: #1B1CAD;
  --color-primary-800: #1D2084;
  --color-primary-900: #141449;

  /* Neutral */
  --color-neutral-50:  #FAFAFA;
  --color-neutral-100: #F4F4F5;
  --color-neutral-200: #E5E5E6;
  --color-neutral-300: #D5D5D7;
  --color-neutral-400: #A3A3A8;
  --color-neutral-500: #737378;
  --color-neutral-600: #545459;
  --color-neutral-700: #414144;
  --color-neutral-800: #282829;
  --color-neutral-900: #1D1D1F;
  --color-neutral-950: #09090B;

  /* Charts */
  --color-chart-blue-violet: #5B5BFF;
  --color-chart-pink:        #E84393;
  --color-chart-yellow:      #FEDE00;
  --color-chart-green-mint:  #3DDB85;
  --color-chart-gray:        #D1D5DB;

  /* Border Radius */
  --radius: 0.625rem; /* 10px */

  /* Button heights */
  --btn-h-sm: 32px;
  --btn-h-md: 40px;
  --btn-h-lg: 44px;
  --btn-h-xl: 48px;
}
```

## Tailwind config (extend)

```ts
// tailwind.config.ts
export default {
  theme: {
    extend: {
      colors: {
        primary: {
          25:  "#EBF1FF",
          50:  "#D6E2FF",
          100: "#B6CBFF",
          200: "#8CA9FF",
          300: "#637BFF",
          400: "#4548FF",
          500: "#2F30FF",
          600: "#1F1DDE",
          700: "#1B1CAD",
          800: "#1D2084",
          900: "#141449",
        },
        neutral: {
          50:  "#FAFAFA",
          100: "#F4F4F5",
          200: "#E5E5E6",
          300: "#D5D5D7",
          400: "#A3A3A8",
          500: "#737378",
          600: "#545459",
          700: "#414144",
          800: "#282829",
          900: "#1D1D1F",
          950: "#09090B",
        },
      },
      borderRadius: {
        sm:   "6px",
        md:   "8px",
        lg:   "10px",
        xl:   "14px",
        "2xl":"18px",
        "3xl":"22px",
        "4xl":"26px",
      },
    },
  },
};
```

## Tipografía — escala de texto

```css
/* text-2xl */ font-size: 24px;
/* text-xl  */ font-size: 20px;
/* text-lg  */ font-size: 18px;
/* text-base */ font-size: clamp(14px, ..., 18px);
/* text-sm  */ font-size: clamp(13px, ..., 16px);
/* text-xs  */ font-size: clamp(12px, ..., 14px);
```
