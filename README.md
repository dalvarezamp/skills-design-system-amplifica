# Amplifica Design System — Claude Code Skill

Skill de [Claude Code](https://claude.com/claude-code) con el design system de **Amplifica**.
Cuando está instalado, Claude aplica automáticamente los colores, tipografía, espaciado y
componentes correctos (botones, tablas, formularios, modales, badges, charts, etc.) al
generar o revisar UI de la plataforma Amplifica.

No tienes que recordarle nada: la skill se activa sola cuando pides crear o modificar
componentes de UI, mencionas tokens como `primary-500` / `neutral-900`, o generas código
React/Tailwind para Amplifica.

---

## Instalación

La skill funciona en cualquier máquina con Claude Code instalado. Elige **una** de las dos formas.

### Opción A — Skill personal (recomendada)

Disponible en **todos** tus proyectos. Clona el repo directamente dentro de tu carpeta de skills:

```bash
git clone https://github.com/dalvarezamp/skills-design-system-amplifica.git \
  ~/.claude/skills/amplifica-design-system
```

### Opción B — Skill del proyecto

Solo disponible dentro de un repo concreto (se comparte con quien clone ese repo).
Desde la raíz del proyecto donde quieras usarla:

```bash
git clone https://github.com/dalvarezamp/skills-design-system-amplifica.git \
  .claude/skills/amplifica-design-system
```

### Opción C — Script de instalación

Si prefieres no escribir la ruta a mano:

```bash
git clone https://github.com/dalvarezamp/skills-design-system-amplifica.git
cd skills-design-system-amplifica
./install.sh            # instala como skill personal (~/.claude/skills)
./install.sh --project  # instala en el proyecto actual (./.claude/skills)
```

---

## Verificar que quedó instalada

1. Abre (o reinicia) Claude Code.
2. Ejecuta `/help` o empieza a escribir `/` — debería aparecer `amplifica-design-system`
   en la lista de skills disponibles.
3. O simplemente pide algo como *"créame un botón primario y una tabla de órdenes para
   Amplifica"* y verifica que use los tokens (`primary-500`, `rounded-2xl`, etc.).

---

## Actualizar a la última versión

```bash
cd ~/.claude/skills/amplifica-design-system   # o .claude/skills/... si fue por proyecto
git pull
```

---

## Qué incluye

| Archivo | Contenido |
|---------|-----------|
| `SKILL.md` | Guía principal: colores, tipografía, spacing, botones, formularios, tabs, badges, modales, drawer, charts y reglas globales. |
| `references/components.md` | Tablas, progress bars, cards y layout con código completo. |
| `references/charts.md` | Todos los tipos de chart (Recharts) con código. |
| `references/tokens.md` | Variables CSS y config de Tailwind listas para copiar. |
| `references/misc.md` | StepIndicator, logo y animaciones CSS. |

---

## Requisitos

- [Claude Code](https://docs.claude.com/en/docs/claude-code) instalado.
- Git.

> Las skills son una funcionalidad nativa de Claude Code: cualquier carpeta dentro de
> `~/.claude/skills/` o `.claude/skills/` que contenga un `SKILL.md` se carga automáticamente.
