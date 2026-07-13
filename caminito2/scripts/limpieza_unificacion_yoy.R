> #bueno la idea de este proyecto es hacer un yoy del primer semestre de 2025 y el primer semestre de 2025. 
  > #vamos a cargar las librerias que vamos a usar
  > library(tidyverse)
── Attaching core tidyverse packages ────────── tidyverse 2.0.0 ──
✔ dplyr     1.2.1     ✔ readr     2.2.0
✔ forcats   1.0.1     ✔ stringr   1.6.0
✔ ggplot2   4.0.3     ✔ tibble    3.3.1
✔ lubridate 1.9.5     ✔ tidyr     1.3.2
✔ purrr     1.2.2     
── Conflicts ──────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
> library(lubridate)
> #cargamos los datos a usar
  > periodo2025 <- readxl::read_xlsx(file.choose())
New names:
  • `OBJETIVO` -> `OBJETIVO...25`
• `OBJETIVO` -> `OBJETIVO...26`
> #ahi me dice que le cambio los nombres a dos columnas que tenian uno parecido
  > #vamos a limpiar los datos 
  > periodo2025_clean <- periodo2025 %>% 
  + rename_with(~ .x %>% 
                  +                 tolower() %>%                 
                  +                 iconv(to = "ASCII//TRANSLIT") %>% 
                  +                 str_replace_all("[^a-z0-9_]", "_
+                 str_replace_all("_+", "_") %>% 
Error: unexpected input in:
"                str_replace_all("[^a-z0-9_]", "_
                str_replace_all("_"

> periodo2025_clean <- periodo2025 %>% 
+ rename_with(~ .x %>% 
+                 tolower() %>%                  # Todo a minúsculas
+                 iconv(to = "ASCII//TRANSLIT") %>% # Quita tildes, ñ y caracteres raros
+                 str_replace_all("[^a-z0-9_]", "_") %>% # Reemplaza espacios/símbolos por guion bajo
+                 str_replace_all("_+", "_") %>% # Evita guiones bajos duplicados
+                 str_remove_all("^_+|_+$")      # Quita guiones bajos al inicio o final
+ )
> head(periodo2025_clean, 3)
# A tibble: 3 × 29
  cliente        documento telefonos emails fecha_ultima_asisten…¹
  <chr>          <chr>     <chr>     <chr>  <chr>                 
1 ABRAHAM, MELI… DNI 2598… 35187356… MELIS… 24/6/2026 19:25       
2 ABRATE, MALENA DNI 4676… 35123242… HEROG… 23/4/2026 08:48       
3 AGUERO, EMANU… DNI 4645… 35171464… AGUER… 25/6/2026 09:32       
# ℹ abbreviated name: ¹​fecha_ultima_asistencia
# ℹ 24 more variables: actividad_ultima_asistencia <chr>,
#   origen_ultima_asistencia <chr>,
#   sucursal_ultima_asistencia <chr>, deuda <dbl>,
#   activo_hoy <chr>, activo_entre_fechas <chr>,
#   entrenador <chr>, genero <chr>,
#   edad_actual_al_26_6_2026 <dbl>, …
> #listo el periodo 2025, vamos con el periodo 2026, esta vez sin explicaciones de mas jajaja 
> periodo2026 <- readxl::read_xlsx(file.choose())
New names:
• `OBJETIVO` -> `OBJETIVO...25`
• `OBJETIVO` -> `OBJETIVO...26`
> periodo2026_clean <- periodo2026 %>% 
+ rename_with(~ .x %>% )
Error: inesperado ')' in:
"periodo2026_clean <- periodo2026 %>% 
                                   rename_with(~ .x %>% )"

> #ups
> periodo2026_clean <- readxl::read_xlsx(file.choose())
Error en file.choose(): selección de archivo cancelada

> periodo2026_clean <- periodo2026 %>% 
+ rename_with(~ .x %>% 
+                 tolower() %>% 
+                 iconv(to ="ASCII/TRANSLIT") %>% 
+                 str_replace_all("[^a-z0-9_]", "_") %>% 
+                 str_replace_all("^_+|_+$")
+     
+ )
Error en iconv(., to = "ASCII/TRANSLIT"): 
  unsupported conversion from '' to 'ASCII/TRANSLIT' in codepage 65001

> #hmm, lo voy a correr de nuevo por las dudas
> periodo2026_clean <- periodo2026 %>% 
+     rename_with(~ .x %>% 
+                     tolower() %>% 
+                     iconv(to = "ASCII//TRANSLIT") %>% 
+                     str_replace_all("[^a-z0-9_]", "_") %>% 
+                     str_replace_all("_+", "_") %>% 
+                     str_remove_all("^_+|_+$")
+     )
> #si, me parecia jajajjaa 
> head(periodo2026_clean)
# A tibble: 6 × 29
  cliente        documento telefonos emails fecha_ultima_asisten…¹
  <chr>          <chr>     <chr>     <chr>  <chr>                 
1 ABRAHAM, MELI… DNI 2598… 35187356… MELIS… 24/6/2026 19:25       
2 ABRATE, MALENA DNI 4676… 35123242… HEROG… 23/4/2026 08:48       
3 AGUERO, EMANU… DNI 4645… 35171464… AGUER… 25/6/2026 09:32       
4 AGUERO, ISMAEL DNI 5099… 35175361… AGUER… 23/6/2026 15:56       
5 AGUERO, JORGE  DNI 2971… 35124099… JORGE… 19/3/2026 18:41       
6 AGUILAR, NORA  DNI 2068… +54 9 35… NOORA… 25/6/2026 18:47       
# ℹ abbreviated name: ¹​fecha_ultima_asistencia
# ℹ 24 more variables: actividad_ultima_asistencia <chr>,
#   origen_ultima_asistencia <chr>,
#   sucursal_ultima_asistencia <chr>, deuda <dbl>,
#   activo_hoy <chr>, activo_entre_fechas <chr>,
#   entrenador <chr>, genero <chr>,
#   edad_actual_al_26_6_2026 <dbl>, …
> #bueno parece que ya esta, tengo inconsistencias en los celulares pero la verdad es que no voy a usar esos datos asi que lo voy a dejar tal como esta
> #el siguiente paso es unificar los archivos, por lo tanto tengo que armar una columna mas que diga que anio estamos leyendo
> final2025 <- periodo2025_clean %>% 
+     mutate(
+         periodo_yoy = "2025-s1", 
+         fecha_ultima_asistencia = dmy(fecha_ultima_asistencia)
+         
+     )
Aviso:
There was 1 warning in `mutate()`.
ℹ In argument: `fecha_ultima_asistencia =
  dmy(fecha_ultima_asistencia)`.
Caused by warning:
! All formats failed to parse. No formats found. 

> #bueno, es un aviso nomas, parece que el archivo del anio pasado es distinto al de este, voy a cambiarlo con otra funcion
> final2025 <- periodo2025_clean %>% 
+     mutate(
+         periodo_yoy = "2025-S1",
+         fecha_ultima_asistencia = parse_date_time(fecha_ultima_asistencia, orders = formatos_fechas)
+     )
Error in `mutate()`:
ℹ In argument: `fecha_ultima_asistencia =
  parse_date_time(fecha_ultima_asistencia, orders =
  formatos_fechas)`.
Caused by error:
! objeto 'formatos_fechas' no encontrado
Run `rlang::last_trace()` to see where the error occurred.

> #kjjj bueno se olvido como es, voy de nuevo
> final2025 <- periodo2025_clean %>% 
+     mutate(
+         periodo_yoy = "2025-S1",
+         fecha_ultima_asistencia = parse_date_time(
+             fecha_ultima_asistencia, 
+             orders = c("dmy HM", "dmy HMS", "dmy", "ymd HMS", "ymd") 
+         )
+     )
> #ahi va
> #mismo codigo con el periodo 2026
> final_2026 <- periodo2026_clean %>% 
+     mutate(
+         periodo_yoy = "2026-S1",
+         fecha_ultima_asistencia = parse_date_time(
+             fecha_ultima_asistencia, 
+             orders = c("dmy HM", "dmy HMS", "dmy", "ymd HMS", "ymd")
+         )
+     )
> #ahora hay que unificarlos en un solo archivo, para eso voy a utilizar el bind de toda la vida a ver si no hay problemas
> reporte_yoy <- bind_rows(final2025, final_2026)
> table(reporte_yoy)
Error en table(reporte_yoy): 
  attempt to make a table with >= 2^31 elements

> table(reporte_yoy$periodo_yoy)

2025-S1 2026-S1 
    358     358 
> #vamos a exportarlo en formato compatible con power bi
> write_excel_csv(reporte_yoy, "reporte_ventas_yoy_final.csv")