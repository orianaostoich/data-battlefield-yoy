[README.md](https://github.com/user-attachments/files/29967839/README.md)
# Pipeline del proyecto de YoY y análisis de indicadores comerciales

## Descripción 
La idea de este proyecto es automatizar la limpieza, estandarización y unificación de los reportes semestrales de ventas 2025/2026 extraídos del CRM que utiliza la empresa. El objetivo es estructurar una base de datos histórica solida para la toma de decisiones estratégicas.


## Librerias utilizadas
- **R (v4.x+)**
- **Tidyverse** (Manipulación de datos y pipelines)
- **Lubridate** (Normalización polimórfica de fechas mixtas)
- **Stringi** (Tratamiento robusto de encoding interplataforma)

## Estructura del Repositorio
- `data/crudos/`: Datos originales del CRM (omitidos en GitHub por privacidad).
- `data/procesados/`: Base unificada y lista para ser usada en post de la toma de decisiones estratégicas. 
- `scripts/01_limpieza_unificacion_yoy.R`: Pipeline dinámico de limpieza de datos.

## Desafíos Técnicos Superados
1. Estandarización Dinámica (`rename_with`): tuve que evitar el mapeo manual de columnas.

2. Errores de Encoding: se intento de varias formas, la que resulto fue mediante `stri_trans_general()`, eliminando los caracteres especiales de forma nativa. 

3. Inconsistencia de Fechas (`parse_date_time`): Unificación de formatos de fechas sin perder informacion.

## ACLARACION IMPORTANTE este proyecto fue subido de manera parcial, el uso de los datos limpios, su tratamiento y análisis serán subidos a la brevedad 
