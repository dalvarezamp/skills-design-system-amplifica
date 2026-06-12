# Otros componentes

StepIndicator, AmplificaLogo, Animaciones CSS y elementos reutilizables.

---

## StepIndicator

Indicador de pasos para flujos multi-step (wizards, onboarding).

```tsx
<StepIndicator current={2} maxReached={2} onStepClick={setStep} />
```

### Estados visuales

| Estado | Apariencia |
|--------|-----------|
| Completado | Círculo verde con checkmark `✓` |
| Activo | Círculo `primary-500` con número blanco, label en `primary-500` |
| Pendiente | Círculo `neutral-200`, número `neutral-400`, label `neutral-400` |

### Conector entre pasos

- Completado → completado: línea verde sólida
- Activo → pendiente: línea `neutral-200` (dashed o tenue)

---

## AmplificaLogo

```tsx
<AmplificaLogo />           // Logo completo (texto + ícono)
<AmplificaLogo collapsed /> // Solo el ícono (sidebar colapsado)
```

- Fondo: `neutral-950` (casi negro)
- Ícono: amarillo/dorado
- Texto: blanco
- `border-radius: rounded-xl`

---

## Animaciones CSS

Usar vía clase `animation` en Tailwind o en `globals.css`.

| Nombre | Duración | Easing | Uso |
|--------|----------|--------|-----|
| `scanPulse` | 0.5s | ease-out | Scanner / barcode |
| `imgBounceIn` | 0.4s | ease-out | Aparición de imagen |
| `headShake` | 0.5s | ease-in-out | Error / rechazo |
| `floatPlusOne` | 0.8s | ease-out | Confirmación / +1 |

```css
/* Uso */
animation: scanPulse   0.5s ease-out;
animation: imgBounceIn 0.4s ease-out;
animation: headShake   0.5s ease-in-out;
animation: floatPlusOne 0.8s ease-out;
```

> Estas animaciones deben estar definidas en `globals.css` con `@keyframes`.
> No usar `animate-bounce` o `animate-ping` de Tailwind para estos casos — usar los keyframes propios de Amplifica.
