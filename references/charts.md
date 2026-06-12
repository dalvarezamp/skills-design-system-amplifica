# Charts — Referencia detallada

Charts basados en **Recharts**. Wrapper: `ChartContainer` + `ChartCard`.

## Tabla de contenidos
- [Fundamentos](#fundamentos)
- [Area Charts](#area-charts)
- [Line Charts](#line-charts)
- [Bar Charts](#bar-charts)
- [Pie / Donut Charts](#pie--donut-charts)
- [Radar Charts](#radar-charts)
- [Radial / Gauge Charts](#radial--gauge-charts)

---

## Fundamentos

### ChartCard (contenedor)

```tsx
<ChartCard title="Ventas por día" subtitle="Tendencia diaria por sucursal">
  {/* chart aquí */}
</ChartCard>
```

| Prop | Valor |
|------|-------|
| bg | white |
| border | `1px solid neutral-200` |
| radius | `rounded-2xl` (16px) |
| padding | 20px |
| title | `text-sm / font-semibold / neutral-800` |
| subtitle | `text-xs / font-normal / neutral-500` |

### Tooltip

```
bg-white · border neutral-200 · rounded-lg · shadow-xl
px-2.5 py-1.5 · text-xs · min-w-32
fontFamily: Inter  ← forzar vía style prop
```

Indicadores: `dot` · `line` · `dashed`

### Legend

```
flex center gap-4
Color square: h-2 w-2 rounded-[2px]
```

### Paleta de colores de series

| Serie | Hex |
|-------|-----|
| Serie 1 | `#5B5BFF` (Blue-Violet) |
| Serie 2 | `#E84393` (Pink) |
| Serie 3 | `#FEDE00` (Yellow) |
| Serie 4 | `#3DDB85` (Green-Mint) |
| Serie 5 | `#5B5BFF80` (Blue-Violet 50%) |
| Otros / Comparación | `#D1D5DB` (Gray) |

### Reglas generales

- Todos los gráficos dentro de `ChartCard`
- Usar `ChartContainer` + `ChartConfig` para colores vía CSS vars
- Ejes: siempre `tickLine=false axisLine=false`
- `CartesianGrid`: solo líneas horizontales (`vertical=false`), excepto barras horizontales
- Tooltips: forzar `fontFamily: Inter` vía style prop
- Sparklines: `isAnimationActive=false`
- Gradients: definir en `<defs>` con IDs únicos por serie
- `accessibilityLayer` obligatorio en todos los charts
- Tooltips: formatear valores con `fmtCLP` o `fmtShort` — **nunca números crudos**
- Empty state obligatorio: si no hay datos, mostrar mensaje centrado

---

## Area Charts

Variantes: **Natural · Step · Stacked · Comparación + Gradient**

### Default (natural)

```tsx
<AreaChart data={data}>
  <defs>
    <linearGradient id="grad1" x1="0" y1="0" x2="0" y2="1">
      <stop offset="5%"  stopColor="#3DDB85" stopOpacity={0.3} />
      <stop offset="95%" stopColor="#3DDB85" stopOpacity={0} />
    </linearGradient>
  </defs>
  <CartesianGrid vertical={false} />
  <XAxis tickLine={false} axisLine={false} />
  <YAxis tickLine={false} axisLine={false} />
  <Tooltip contentStyle={{ fontFamily: "Inter" }} />
  <Area type="natural" dataKey="value" stroke="#3DDB85" fill="url(#grad1)" />
</AreaChart>
```

### Step

```tsx
<Area type="step" dataKey="value" stroke="#5B5BFF" fill="url(#gradBlue)" />
```

### Stacked + Gradient

```tsx
// Múltiples <Area> con stackId="a"
<Area stackId="a" type="natural" dataKey="lo_barnechea" stroke="#5B5BFF" fill="url(#gradBlue)" />
<Area stackId="a" type="natural" dataKey="centro"       stroke="#E84393" fill="url(#gradPink)" />
<Area stackId="a" type="natural" dataKey="la_reina"     stroke="#FEDE00" fill="url(#gradYellow)" />
<Area stackId="a" type="natural" dataKey="quilicura"    stroke="#3DDB85" fill="url(#gradGreen)" />
```

### Comparación + Gradient (actual vs anterior)

```tsx
// Serie actual: color sólido | Serie anterior: dashed + gray
<Area dataKey="actual"   stroke="#5B5BFF" fill="url(#gradBlue)" />
<Area dataKey="anterior" stroke="#D1D5DB" fill="none" strokeDasharray="4 4" />
```

---

## Line Charts

Variantes: **Natural · Dots · Step · Comparación · Gradient fill**

### Multi-series (natural)

```tsx
<LineChart data={data}>
  <CartesianGrid vertical={false} />
  <XAxis tickLine={false} axisLine={false} />
  <YAxis tickLine={false} axisLine={false} />
  <Tooltip contentStyle={{ fontFamily: "Inter" }} />
  <Legend />
  <Line type="natural" dataKey="lo_barnechea" stroke="#5B5BFF" dot={false} />
  <Line type="natural" dataKey="centro"       stroke="#E84393" dot={false} />
  <Line type="natural" dataKey="la_reina"     stroke="#FEDE00" dot={false} />
  <Line type="natural" dataKey="quilicura"    stroke="#3DDB85" dot={false} />
</LineChart>
```

### Con dots

```tsx
<Line type="natural" dataKey="value" stroke="#3DDB85"
  dot={{ r: 4, fill: "#3DDB85" }}
  activeDot={{ r: 6 }}
/>
```

### Step

```tsx
<Line type="step" dataKey="value" stroke="#E84393" dot={false} />
```

### Comparación (actual vs anterior)

```tsx
<Line dataKey="actual"   stroke="#5B5BFF" strokeWidth={2} dot={false} />
<Line dataKey="anterior" stroke="#D1D5DB" strokeWidth={1.5} strokeDasharray="4 4" dot={false} />
```

### Line con gradient fill (área debajo)

```tsx
// Combinar LineChart con Area para el relleno
<AreaChart data={data}>
  <defs>
    <linearGradient id="gradBlue" x1="0" y1="0" x2="0" y2="1">
      <stop offset="5%"  stopColor="#5B5BFF" stopOpacity={0.2} />
      <stop offset="95%" stopColor="#5B5BFF" stopOpacity={0} />
    </linearGradient>
  </defs>
  <Area type="natural" dataKey="value" stroke="#5B5BFF" strokeWidth={2} fill="url(#gradBlue)" />
</AreaChart>
```

---

## Bar Charts

Variantes: **Vertical · Horizontal + Labels · Stacked**

### Default vertical

```tsx
<BarChart data={data}>
  <CartesianGrid vertical={false} />
  <XAxis tickLine={false} axisLine={false} />
  <YAxis tickLine={false} axisLine={false} />
  <Tooltip contentStyle={{ fontFamily: "Inter" }} />
  <Bar dataKey="value" fill="#5B5BFF" radius={[4, 4, 0, 0]} />
</BarChart>
```

### Horizontal + Labels externos

```tsx
<BarChart data={data} layout="vertical">
  <CartesianGrid horizontal={false} />  {/* ← horizontal=false para barras horizontales */}
  <XAxis type="number" tickLine={false} axisLine={false} />
  <YAxis type="category" dataKey="name" tickLine={false} axisLine={false} width={90} />
  <Tooltip contentStyle={{ fontFamily: "Inter" }} />
  <Bar dataKey="value" radius={[0, 4, 4, 0]}>
    {/* Color por serie */}
    {data.map((entry, i) => <Cell key={i} fill={COLORS[i]} />)}
    <LabelList dataKey="value" position="right" formatter={fmtShort} />
  </Bar>
</BarChart>
```

### Agrupado (multi-series)

```tsx
<BarChart data={data} barCategoryGap="20%" barGap={2}>
  <Bar dataKey="lo_barnechea" fill="#5B5BFF" radius={[2,2,0,0]} />
  <Bar dataKey="centro"       fill="#E84393" radius={[2,2,0,0]} />
  <Bar dataKey="la_reina"     fill="#FEDE00" radius={[2,2,0,0]} />
  <Bar dataKey="quilicura"    fill="#3DDB85" radius={[2,2,0,0]} />
</BarChart>
```

### Stacked

```tsx
<BarChart data={data}>
  <Bar stackId="a" dataKey="lo_barnechea" fill="#5B5BFF" />
  <Bar stackId="a" dataKey="centro"       fill="#E84393" />
  <Bar stackId="a" dataKey="la_reina"     fill="#FEDE00" />
  <Bar stackId="a" dataKey="quilicura"    fill="#3DDB85" radius={[4,4,0,0]} />
  {/* radius solo en la última barra del stack */}
</BarChart>
```

---

## Pie / Donut Charts

Variantes: **Simple · Donut · Donut + Text central**

### Simple

```tsx
<PieChart>
  <Pie data={data} dataKey="value" nameKey="name" cx="50%" cy="50%" outerRadius={80}>
    {data.map((_, i) => <Cell key={i} fill={CHART_COLORS[i]} />)}
  </Pie>
  <Tooltip contentStyle={{ fontFamily: "Inter" }} />
  <Legend />
</PieChart>
```

### Donut + Text central

```tsx
<PieChart>
  <Pie
    data={data}
    dataKey="value"
    cx="50%" cy="50%"
    innerRadius={60}
    outerRadius={90}
  >
    {data.map((_, i) => <Cell key={i} fill={CHART_COLORS[i]} />)}
  </Pie>
  {/* Label central custom */}
  <text x="50%" y="50%" textAnchor="middle" dominantBaseline="middle">
    <tspan className="text-2xl font-bold fill-neutral-900">3,4B</tspan>
    <tspan x="50%" dy="1.4em" className="text-xs fill-neutral-500">Total</tspan>
  </text>
  <Tooltip contentStyle={{ fontFamily: "Inter" }} />
  <Legend />
</PieChart>
```

---

## Radar Charts

Variantes: **Default polygon · Grid circle + dots**

### Default (polygon)

```tsx
<RadarChart data={data}>
  <PolarGrid />
  <PolarAngleAxis dataKey="subject" tick={{ fontSize: 12 }} />
  <Radar name="Lo Barnechea" dataKey="A" stroke="#5B5BFF" fill="#5B5BFF" fillOpacity={0.3} />
  <Radar name="Centro"       dataKey="B" stroke="#E84393" fill="#E84393" fillOpacity={0.2} />
  <Legend />
</RadarChart>
```

### Grid circle + dots

```tsx
<RadarChart data={data}>
  <PolarGrid gridType="circle" />
  <PolarAngleAxis dataKey="subject" />
  <Radar dataKey="A" stroke="#5B5BFF" fill="#5B5BFF" fillOpacity={0.3}
    dot={{ r: 4, fill: "#5B5BFF" }} />
  <Radar dataKey="B" stroke="#E84393" fill="#E84393" fillOpacity={0.2}
    dot={{ r: 4, fill: "#E84393" }} />
</RadarChart>
```

---

## Radial / Gauge Charts

Variante: **Gauge con label central**

```tsx
// Usando RadialBarChart como gauge semicircular
<RadialBarChart
  cx="50%" cy="60%"
  innerRadius="70%" outerRadius="90%"
  startAngle={180} endAngle={0}
  data={[{ value: 73, fill: "#5B5BFF" }]}
>
  <RadialBar dataKey="value" cornerRadius={8} />
  {/* Label central */}
  <text x="50%" y="58%" textAnchor="middle" dominantBaseline="middle">
    <tspan className="text-2xl font-bold fill-neutral-900">73%</tspan>
    <tspan x="50%" dy="1.4em" className="text-xs fill-neutral-500">Utilización</tspan>
  </text>
</RadialBarChart>
```
