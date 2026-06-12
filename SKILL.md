---
name: amplifica-design-system
description: >
  Design system de Amplifica. Usar SIEMPRE que el agente vaya a crear, modificar
  o revisar cualquier componente de UI en la plataforma Amplifica: botones, tablas,
  formularios, modales, badges, progress bars, cards, colores, tipografía, spacing
  o border-radius. Usar también cuando el usuario mencione tokens de color como
  `primary-*` o `neutral-*`, cuando pregunte "¿cómo se hace X en Amplifica?",
  o cuando genere código React/Tailwind para la plataforma. Si hay duda sobre si
  aplica, APLICAR — es mejor consultarlo de más que de menos.
---

# Amplifica Design System

Guía de referencia completa para construir UI consistente en la plataforma Amplifica.
Todas las variables CSS están definidas en `globals.css`.

> **Para el agente**: Lee esta sección completa antes de escribir cualquier componente.
> Para detalle de tablas, progress bars, cards y más: `references/components.md`.
> Para tokens CSS completos: `references/tokens.md`.
> Para todos los charts con código: `references/charts.md`.

---

## Colores

### Primary (Brand)

| Token | Hex |
|-------|-----|
| `primary-25` | `#EBF1FF` |
| `primary-50` | `#D6E2FF` |
| `primary-100` | `#B6CBFF` |
| `primary-200` | `#8CA9FF` |
| `primary-300` | `#637BFF` |
| `primary-400` | `#4548FF` |
| `primary-500` | `#2F30FF` ← **acción principal** |
| `primary-600` | `#1F1DDE` |
| `primary-700` | `#1B1CAD` |
| `primary-800` | `#1D2084` |
| `primary-900` | `#141449` |

### Neutral

| Token | Hex |
|-------|-----|
| `neutral-50` | `#FAFAFA` |
| `neutral-100` | `#F4F4F5` |
| `neutral-200` | `#E5E5E6` |
| `neutral-300` | `#D5D5D7` |
| `neutral-400` | `#A3A3A8` |
| `neutral-500` | `#737378` |
| `neutral-600` | `#545459` |
| `neutral-700` | `#414144` |
| `neutral-800` | `#282829` |
| `neutral-900` | `#1D1D1F` |
| `neutral-950` | `#09090B` |

### Semánticos

| Uso | Token Tailwind |
|-----|---------------|
| Destructive / Error | `red-500` |
| Warning | `amber-400` |
| Success | `green-400` |
| Info | `blue-500` / `primary-500` |

### Charts

`#5B5BFF` · `#E84393` · `#FEDE00` · `#3DDB85` · `#D1D5DB`

---

## Tipografía

- **Sans principal**: `Inter`
- **Mono**: `Atkinson Hyperlegible`

| Token | Tamaño |
|-------|--------|
| `text-2xl` | 24px |
| `text-xl` | 20px |
| `text-lg` | 18px |
| `text-base` | var(14–18px) |
| `text-sm` | var(13–16px) |
| `text-xs` | var(12–14px) |

**Pesos:** `font-normal` (400) · `font-medium` (500) · `font-semibold` (600) · `font-bold` (700)

---

## Espaciado & Border Radius

```css
--radius: 0.625rem; /* 10px base */
```

| Token | Valor |
|-------|-------|
| `rounded-sm` | 6px |
| `rounded-md` | 8px |
| `rounded-lg` | 10px |
| `rounded-xl` | 14px |
| `rounded-2xl` | 18px |

**Alturas de botón:** `--btn-h-sm` 32px · `--btn-h-md` 40px · `--btn-h-lg` 44px · `--btn-h-xl` 48px

**Gap común:** `gap-1` (4px) · `gap-2` (8px) · `gap-3` (12px) · `gap-4` (16px) · `gap-6` (24px) · `gap-8` (32px)

---

## Botones

```tsx
<Button variant="primary"   size="sm|md|lg|xl">Texto</Button>
<Button variant="secondary" size="md">Texto</Button>
<Button variant="tertiary"  size="md">Texto</Button>

// Con íconos
<Button iconLeft={<Plus />}>Crear</Button>
<Button iconRight={<ArrowRight />}>Siguiente</Button>

// Estados
<Button disabled>Deshabilitado</Button>
<Button loading loadingText="Guardando...">Guardar</Button>
```

---

## Formularios

```tsx
<FormField label="Nombre"  as="input"    type="text" value={val} onChange={setVal} />
<FormField label="Email"   error="Campo obligatorio" />
<FormField label="País"    as="select"   options={[...]} />
<FormField label="Notas"   as="textarea" rows={3} />
```

### StepperInput

```tsx
<StepperInput value={qty} onChange={setQty} min={0} max={99} size="sm|md" />
```

---

## Tabs

### Variante pill (toolbar de filtros)

```tsx
<div className="flex items-center gap-1 bg-neutral-100 rounded-xl p-1">
  {tabs.map(t => (
    <button
      key={t.value}
      onClick={() => setActive(t.value)}
      className={`flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm whitespace-nowrap transition-all flex-shrink-0 ${
        active === t.value
          ? "bg-white text-neutral-900 font-medium shadow-sm"
          : "text-neutral-500 hover:text-neutral-700 hover:bg-neutral-50/60"
      }`}
    >
      {t.label}
      <span className={`text-[11px] tabular-nums px-1.5 py-0.5 rounded-full font-medium leading-none ${
        active === t.value ? "bg-primary-500 text-white" : "bg-neutral-200/70 text-neutral-500"
      }`}>{t.count}</span>
    </button>
  ))}
</div>
```

### Variante underline (navegación interna)

```tsx
<div className="border-b border-neutral-200">
  <div className="flex items-center gap-6">
    {tabs.map(t => (
      <button
        key={t.value}
        onClick={() => setActive(t.value)}
        className={`pb-2 -mb-px text-sm font-medium border-b-2 transition-colors ${
          active === t.value
            ? "text-neutral-900 border-primary-500"
            : "text-neutral-500 border-transparent hover:text-neutral-700 hover:border-neutral-300"
        }`}
      >
        {t.label}
      </button>
    ))}
  </div>
</div>
```

---

## Badges de estado

```tsx
// Órdenes / recepciones
<StatusBadge status="Creado" />
<StatusBadge status="Programado" />
<StatusBadge status="Completada" />
<StatusBadge status="Cancelada" />

// Retiros
<EstadoBadge estado="Validado" />
<MetodoBadge metodo="retiro_presencial" />

// Redistribuciones
<RedistribucionEstadoBadge estado="Aprobado" />
<RedistribucionTipoBadge   tipo="proactiva" />

// Ubicaciones
<UbicacionStatusBadge estado="Ocupada" size="sm|md" />
```

---

## Modales

```tsx
<AlertModal
  open={true}
  onClose={close}
  icon={CheckCircle2}
  variant="primary|danger|warning|info"
  title="Título"
  subtitle="Subtítulo"
  confirm={{ label: "Confirmar", onClick: fn }}
>
  Contenido del modal
</AlertModal>
```

---

## Drawer

Panel lateral derecho (desktop) / bottom-sheet (mobile). Focus trap, cierre con Esc o click fuera.

```tsx
<Drawer
  open={open}
  onClose={() => setOpen(false)}
  title="Detalle de orden"
  description="RO-2026-0099"
  size="sm|md|lg"   // sm=360px · md=420px · lg=480px
  footer={
    <div className="flex gap-2">
      <Button variant="secondary">Cancelar</Button>
      <Button variant="primary">Confirmar</Button>
    </div>
  }
>
  <p>Contenido scrolleable…</p>
</Drawer>
```

**A11y:** `role="dialog"` · `aria-modal` · focus trap · Esc cierra · slide 220ms desde derecha.

---

## Tooltip

```tsx
<Tooltip content="Ver detalle" side="top">
  <button aria-label="Ver detalle">
    <FileText className="w-4 h-4" />
  </button>
</Tooltip>
```

Porta a `<body>`. Activar con hover/focus.

---

## MiniStepper

```tsx
<MiniStepper
  steps={[
    { key: "Borrador",       label: "Borrador",    Icon: FileText },
    { key: "Aprobado",       label: "Aprobado",    Icon: CheckCircle2 },
    { key: "En preparación", label: "En prep.",    Icon: Boxes },
    { key: "En tránsito",    label: "En tránsito", Icon: Truck },
  ]}
  current="Borrador"
  doneVariant="green|primary"
/>
```

---

## CopyableId

Badge monospace con copy-to-clipboard. Usar **siempre** para IDs visibles (RO, RS, LPN, QR…).

```tsx
<CopyableId value="RO-2026-0099" />
<CopyableId value="RS-2026-QR-0014" />
```

---

## EmptyState

```tsx
<EmptyState
  icon={Inbox}
  title="No hay órdenes pendientes"
  description="Cuando lleguen nuevas órdenes aparecerán acá."
  cta={<Button variant="primary">Crear orden</Button>}
  size="sm|md|lg"
  bordered={true}
/>
```

---

## PageInfoModal

```tsx
<div className="flex items-center gap-2">
  <h1>Recepciones</h1>
  <PageInfoModal
    title="Órdenes de recepción"
    description="Flujo de entrada al warehouse..."
    features={["Agenda por slots", "Cuarentena integrada"]}
  />
</div>
```

Una sola instancia por pantalla. Ícono ⓘ al lado del título.

---

## Dashboard — DashboardKpiSet & AlertaCard

```tsx
<DashboardKpiSet kpis={[{ title, value, delta, sub, icon }]} />

// Fondo #111759, divisores verticales, delta semántico (green/red/amber)

<AlertaCard alerta={alerta} compact />
// Niveles: crítico (rojo) · urgente (naranja) · atención (amber) · info (azul)
```

---

## StepIndicator

```tsx
<StepIndicator current={2} maxReached={2} onStepClick={setStep} />
```

---

## Carga masiva CSV

```tsx
<BulkUploadDropzone onFile={handleFile} onClear={() => ...} />
// Con archivo:
<BulkUploadDropzone currentFile="ubicaciones-batch.csv" onClear={...} />

<BulkUploadErrorReport grouped={errors} totalRows={120} />
// Rechazo total del lote. Errores agrupados por campo con filas afectadas.
```

---

## Ubicaciones — Componentes especializados

```tsx
<TipoUbicacionPicker value={tipo} onChange={setTipo} />
// Grid 2-col mobile → 4-col desktop. 11 tipos: EST PAL RCK COF REF REC PCK JAU CAR BIN PLM

<CodigoPreview tipo={tipo} zona="A" rack="1" posicion="1" isUnique={true} />
// 3 estados: azul (completando) · verde (disponible) · rojo (ya existe) · gris (incompleto)

<UbicacionAuditTimeline entries={audit} />
// Timeline vertical con diff antes→después, actor y timestamp
```

---

## Charts (Recharts)

Wrapper: `ChartContainer` + `ChartCard`. Para código completo ver `references/charts.md`.

| Serie | Hex |
|-------|-----|
| Serie 1 | `#5B5BFF` |
| Serie 2 | `#E84393` |
| Serie 3 | `#FEDE00` |
| Serie 4 | `#3DDB85` |
| Otros   | `#D1D5DB` |

**Tipos:** Area · Line · Bar · Pie/Donut · Radar · Radial/Gauge

**Reglas:** `tickLine=false axisLine=false` · `CartesianGrid vertical=false` · `accessibilityLayer` obligatorio · valores con `fmtCLP` o `fmtShort`.

---

## Reglas globales (NUNCA romper)

1. **Nunca** `uppercase` ni `tracking-wider` en headers de tabla.
2. **Siempre** `py-2 px-2` en celdas y headers — sin excepciones entre módulos.
3. **Siempre** `table-fixed` y `border-collapse` en `<table>`.
4. **Nunca** `border-t`/`border-b` en rows individuales → usar `divide-y divide-neutral-50`.
5. **Nunca** `style={{ height: N }}` en rows → el alto lo define el padding.
6. La paginación va **dentro** del container `rounded-2xl`, nunca fuera.
7. **Siempre** `<CopyableId>` para identificadores visibles (RO, RS, LPN, QR…).
8. **Siempre** `<EmptyState>` en tablas/listas/drawers sin datos.
9. **Nunca** paginación fuera del `rounded-2xl` wrapper.
10. `<FormField as="select">` para selects — nunca `<select>` nativo sin wrapper.

---

## Referencias

- `references/components.md` — Tablas, Progress Bars, Cards & Layout (código completo)
- `references/charts.md`     — Todos los tipos de chart con código completo
- `references/tokens.md`     — CSS variables y config Tailwind listos para copiar
- `references/misc.md`       — StepIndicator, Logo y animaciones CSS
