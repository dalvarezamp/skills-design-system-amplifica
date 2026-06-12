# Componentes — Referencia detallada

## Tabla de contenidos
- [Tablas](#tablas)
- [Tabs](#tabs)
- [Progress Bars](#progress-bars)
- [Cards & Layout](#cards--layout)
- [Badges de módulo](#badges-de-módulo)
- [Pagination](#pagination)
- [Drawer](#drawer)
- [Tooltip](#tooltip)
- [MiniStepper](#ministepper)
- [CopyableId](#copyableid)
- [EmptyState](#emptystate)
- [Carga masiva CSV](#carga-masiva-csv)
- [Ubicaciones](#ubicaciones)
- [Dashboard KPI & Alertas](#dashboard-kpi--alertas)

---

## Tablas

### Helpers obligatorios (declarar en cada archivo)

```tsx
const NW: React.CSSProperties = { whiteSpace: "nowrap" };
const stickyRight: React.CSSProperties = {
  position: "sticky",
  right: 0,
  boxShadow: "-4px 0 8px -2px rgba(0,0,0,0.07)",
};
```

### Estructura base

```tsx
<div className="hidden sm:flex flex-col flex-1 min-h-0 bg-white border border-neutral-200 rounded-2xl overflow-hidden relative">
  <div className="overflow-x-auto overflow-y-auto flex-1 min-h-0 w-full table-scroll scroll-fade-right">
    <table className="w-full table-fixed text-sm border-collapse font-sans tracking-normal">

      <thead className="sticky top-0 z-10">
        <tr className="border-b border-neutral-100 bg-neutral-50">
          <th className="w-[44px] py-2 px-2">{/* checkbox */}</th>
          <th className="text-left py-2 px-2 text-xs font-semibold text-neutral-700 cursor-pointer select-none"
              style={NW} onClick={() => toggleSort("id")}>
            ID <SortIcon field="id" />
          </th>
          <th className="w-[80px] py-2 px-2 text-left text-xs font-semibold text-neutral-700 bg-neutral-50"
              style={{ ...NW, ...stickyRight }}>
            Acciones
          </th>
        </tr>
      </thead>

      <tbody className="divide-y divide-neutral-50">
        {isLoading ? <SkeletonRows /> : data.length === 0 ? <EmptyRow /> : (
          data.map(row => (
            <tr key={row.id} className="hover:bg-neutral-50/60 transition-colors">
              <td className="py-2 px-2" style={NW}>{/* data */}</td>
              <td className="py-2 px-2 bg-white" style={{ ...NW, ...stickyRight }}>
                {/* acciones */}
              </td>
            </tr>
          ))
        )}
      </tbody>

    </table>
  </div>

  {/* Paginación SIEMPRE dentro del container */}
  <div className="flex-shrink-0 flex items-center justify-between px-3 py-3 bg-white border-t border-neutral-100">
    <label className="flex items-center gap-1.5 bg-neutral-100 rounded-lg px-3 h-9 text-sm text-neutral-700">
      <span className="text-neutral-500">Mostrar</span>
      <select className="bg-transparent font-medium">
        <option>20</option><option>50</option><option>100</option>
      </select>
    </label>
    <span className="text-sm text-neutral-500 tabular-nums">1–20 de 70</span>
    <div className="flex items-center gap-1">
      <button className="w-9 h-9 rounded-lg"><ChevronsLeft /></button>
      <button className="w-9 h-9 rounded-lg"><ChevronLeft /></button>
      <button className="w-9 h-9 rounded-lg bg-primary-25 text-primary-900">1</button>
      <button className="w-9 h-9 rounded-lg text-neutral-600">2</button>
      <span className="text-neutral-400">...</span>
      <button className="w-9 h-9 rounded-lg"><ChevronRight /></button>
      <button className="w-9 h-9 rounded-lg"><ChevronsRight /></button>
    </div>
  </div>
</div>
```

### Column sorting

```tsx
// Ícono inactivo: neutral-400 | activo: primary-500
<th onClick={() => toggleSort("fecha")} className="cursor-pointer select-none ...">
  Fecha
  {sortCol === "fecha"
    ? sortDir === "asc"
      ? <ArrowUp className="w-3 h-3 text-primary-500" />
      : <ArrowDown className="w-3 h-3 text-primary-500" />
    : <ArrowUpDown className="w-3 h-3 text-neutral-400" />
  }
</th>
```

### Empty state (dentro de tbody)

```tsx
<tr>
  <td colSpan={N} className="text-center py-16 text-neutral-400 text-sm">
    <Package className="w-10 h-10 text-neutral-300 mx-auto mb-3" />
    <p className="text-sm font-semibold text-neutral-700 mb-1">No se encontraron registros</p>
    <p className="text-xs text-neutral-500 mb-4">Intenta con otros filtros o crea uno nuevo</p>
    <Button variant="primary">Crear</Button>
  </td>
</tr>
```

### Loading skeleton

```tsx
{Array.from({ length: 5 }).map((_, i) => (
  <tr key={i} className="animate-pulse">
    <td className="px-2 py-3"><div className="w-3.5 h-3.5 bg-neutral-200 rounded" /></td>
    <td className="px-2 py-3"><div className="w-16 h-4 bg-neutral-100 rounded" /></td>
    <td className="px-2 py-3"><div className="w-20 h-4 bg-neutral-100 rounded" /></td>
    <td className="px-2 py-3"><div className="w-24 h-4 bg-neutral-100 rounded" /></td>
  </tr>
))}
```

### Checklist de features obligatorias

- [ ] Checkbox bulk selection (`w-[44px]` touch target, `w-3.5 h-3.5`, checked: `bg-primary-500 border-primary-500`)
- [ ] Sticky header (`thead sticky top-0 z-10`)
- [ ] Sticky actions column (`sticky right-0` + sombra)
- [ ] Column sorting (fecha + columnas clave con `toggleSort()`)
- [ ] Paginación numerada (select 20/50/100 + page numbers)
- [ ] Empty state (ícono + mensaje + CTA)
- [ ] Loading skeleton (`animate-pulse`)
- [ ] Search con debounce (≥300ms)
- [ ] Status tabs (pills para filtrar por estado)
- [ ] Scroll fade right (`scroll-fade-right`)

### Anti-patterns

| ❌ Nunca | ✅ Siempre |
|----------|-----------|
| Paginación fuera del container | Dentro del `rounded-2xl` wrapper |
| `border-t`/`border-b` en rows | `divide-y divide-neutral-50` en `<tbody>` |
| `style={{ height: 40 }}` en rows | El alto lo define el padding de celdas |
| `uppercase tracking-wide` en headers | `text-xs font-semibold text-neutral-700` |
| Padding distinto entre módulos | Siempre `py-2 px-2` en headers y celdas |
| Sin `table-fixed` o `border-collapse` | Obligatorios en `<table>` |

---

## Tabs

### Pill (toolbar de filtros)

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
      {t.count !== undefined && (
        <span className={`text-[11px] tabular-nums px-1.5 py-0.5 rounded-full font-medium leading-none ${
          active === t.value ? "bg-primary-500 text-white" : "bg-neutral-200/70 text-neutral-500"
        }`}>{t.count}</span>
      )}
    </button>
  ))}
</div>
```

### Underline (navegación interna)

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

## Progress Bars

### Base

```tsx
<div className="h-2 bg-neutral-100 rounded-full overflow-hidden">
  <div className="h-full bg-primary-500 rounded-full" style={{ width: `${pct}%` }} />
</div>
```

### Tamaños

| Clase | Uso |
|-------|-----|
| `h-1` | Extra slim — inline en tablas |
| `h-1.5` | Slim — progreso de conteo |
| `h-2` | Default |
| `h-3` | Large — dashboards |

### Colores por contexto

| Contexto | Clase |
|----------|-------|
| Límite/Plan | `bg-primary-500` |
| Avance de conteo | `bg-green-400` |
| Almacenamiento | `bg-amber-400` |
| Capacidad excedida | `bg-red-500` |

### Con label interno

```tsx
<div className="h-5 bg-neutral-100 rounded-full overflow-hidden relative">
  <div className="h-full bg-primary-500 rounded-full" style={{ width: `${pct}%` }} />
  <span className="absolute inset-0 flex items-center justify-center text-[10px] font-semibold">
    {pct}%
  </span>
</div>
```

### Segmented / Stacked

```tsx
<div className="h-3 bg-neutral-100 rounded-full overflow-hidden flex">
  <div className="bg-primary-500" style={{ width: "45%" }} />  {/* Contados */}
  <div className="bg-green-400"   style={{ width: "30%" }} />  {/* Aprobados */}
  <div className="bg-amber-400"   style={{ width: "15%" }} />  {/* Pendientes */}
</div>
```

### Enforcement

```
< 80%  → normal  → bg-primary-500
≥ 80%  → warning → bg-amber-400  + banner amarillo
≥ 100% → danger  → bg-red-500    + banner rojo
```

---

## Cards & Layout

### Card base

```tsx
<div className="bg-white border border-neutral-200 rounded-2xl p-4">
  {content}
</div>
```

### Grid de cards

```tsx
<div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
  {items.map(i => <Card key={i.id} {...i} />)}
</div>
```

### ScrollArea — Vertical

```tsx
<ScrollArea maxHeight={160} className="space-y-2">
  {items}
</ScrollArea>
```

### ScrollArea — Horizontal

```tsx
<ScrollArea direction="horizontal">
  {content}
</ScrollArea>
```

---

## Badges de módulo

Todos siguen el patrón pill: fondo pastel + texto dark + ícono Lucide opcional.

```tsx
// Recepciones / Órdenes
<StatusBadge status="Creado|Programado|Recepción en bodega|En proceso de conteo|Pendiente de aprobación|Completada|Cancelada" />

// Retiros
<EstadoBadge estado="Validado|En preparación|Listo para retiro|Empacado|Finalizado|Enviado|Retirado|Entregado|Cancelado" />
<MetodoBadge metodo="retiro_presencial|envio_courier" />

// Redistribuciones
<RedistribucionEstadoBadge estado="Borrador|Aprobado|En preparación|En tránsito|Recibido|Rechazado|Rechazado en picking|Vencido" />
<RedistribucionTipoBadge   tipo="proactiva|inversa_libera|inversa_rescate|reactiva" />

// Ubicaciones
<UbicacionStatusBadge estado="Vacía|Ocupada|En levantamiento|Levantada|Inactiva" size="sm|md" />
```

---

## Pagination

```tsx
<Pagination
  page={page}
  pageSize={pageSize}
  total={total}
  onPageChange={setPage}
  onPageSizeChange={setPageSize}
  pageSizeOptions={[20, 50, 100]}
  meta={<span>· Actualizado 14:30</span>}
/>
```

Muestra `from–to de total`, selector con opciones default `[20, 50, 100]`, botones primera/anterior/siguiente/última y elipsis automática. Reset a página 1 al cambiar `pageSize`.

---

## Drawer

```tsx
<Drawer
  open={open}
  onClose={() => setOpen(false)}
  title="Detalle de orden"
  description="RO-2026-0099"
  size="sm|md|lg"   // sm=360px · md=420px · lg=480px
  backdrop            // opcional, oscurece fondo
  ariaLabel="Detalle de orden"
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

- **A11y:** `role="dialog"` · `aria-modal` · focus trap · Esc cierra
- **Animación:** slide-in desde derecha · 220ms · bottom-sheet en mobile

---

## Tooltip

```tsx
<Tooltip content="Ver detalle" side="top|right|bottom|left">
  <button aria-label="Ver detalle">
    <FileText className="w-4 h-4" />
  </button>
</Tooltip>
```

Porta a `<body>`. Activa con hover/focus. Usar para botones icon-only o etiquetas contextuales.

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

Badge monospace con copy-to-clipboard. Feedback visual 2s. **Usar siempre** para identificadores visibles (RO, RS, LPN, QR…).

```tsx
<CopyableId value="RO-2026-0099" />
<CopyableId value="RS-2026-QR-0014" />
<CopyableId value="LPN-BR-0042" />
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

| Prop | Uso |
|------|-----|
| `size="sm"` | Drawers, secciones pequeñas |
| `size="md"` | Default — tablas y listas |
| `size="lg"` | Pantalla completa, sin borde |
| `bordered={false}` | Quita el borde contenedor |

---

## Carga masiva CSV

```tsx
// Dropzone vacío
<BulkUploadDropzone onFile={handleFile} onClear={() => setCurrent(null)} />

// Con archivo cargado
<BulkUploadDropzone currentFile="ubicaciones-batch.csv" onClear={handleClear} />

// Reporte de errores (rechazo total del lote)
<BulkUploadErrorReport grouped={errors} totalRows={120} />
```

- Drag-over: highlight `primary-50`
- Formatos: `.csv` (UTF-8) · `.xlsx` · `.xls`
- Rechazo total: ningún registro se crea si hay errores
- Errores agrupados por campo, lista de filas afectadas (trunca a 10 con "y N más")

---

## Ubicaciones

### TipoUbicacionPicker

```tsx
<TipoUbicacionPicker value={tipo} onChange={setTipo} />
// role="radiogroup" + aria-checked
// Grid 2-col mobile → 4-col desktop
// 11 tipos: EST PAL RCK COF REF REC PCK JAU CAR BIN PLM
```

### CodigoPreview

```tsx
<CodigoPreview tipo={tipo} zona="A" rack="1" posicion="1" isUnique={true} />
// Estados: ring azul (completando) · verde (disponible) · rojo (ya existe) · gris dashed (incompleto)
// Código generado con buildCodigo(): TIPO-ZONA-RACK-POS
```

### UbicacionAuditTimeline

```tsx
<UbicacionAuditTimeline entries={audit} />
// Timeline vertical: ícono por tipo de acción, diff antes→después, actor, timestamp
// Tipos de acción: creación · edición · activar levantamiento · escaneo barrido
```

---

## Dashboard KPI & Alertas

### DashboardKpiSet

```tsx
<DashboardKpiSet kpis={[
  { title: "Borradores pendientes", value: 14, delta: "+75%", sub: "vs 8 ayer", icon: FileText },
  { title: "En tránsito", value: 6, delta: "on track", sub: "ETA < 24h", icon: Truck },
]} />
// Fondo oscuro #111759
// Divisores verticales entre KPIs
// Delta chip semántico: green (positivo) / red (negativo) / amber (warning)
// Scroll horizontal en mobile
```

### AlertaCard

```tsx
<AlertaCard alerta={alerta} compact />
```

| Nivel | Color | Uso |
|-------|-------|-----|
| `crítico` | Rojo | Quiebre crítico, stock 0 |
| `urgente` | Naranja | Quiebre redistribuible |
| `atención` | Amber | Capacidad alta |
| `info` | Azul | Sin configuración / aviso |

Contrast ratios WCAG AA 4.5+ verificados.
