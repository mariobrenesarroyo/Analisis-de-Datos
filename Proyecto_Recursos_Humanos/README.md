# Proyecto de Dashboard de Recursos Humanos

Este proyecto tiene como objetivo desarrollar un **dashboard** interactivo y fácil de usar para la gestión de recursos humanos. El **dashboard** proporcionará una vista comprensiva de los datos de empleados, evaluaciones y sueldos, permitiendo a los administradores tomar decisiones informadas y mejorar la gestión del personal.

## Estructura del Proyecto

El proyecto está organizado de la siguiente manera:

- **data/**: Contiene los archivos CSV con los datos necesarios para el **dashboard**.
  - `Tabla Empleados.csv`: Información de los empleados, incluyendo sus identificadores únicos (ID Empleado).
  - `Tabla Evaluacion.csv`: Evaluaciones de desempeño de los empleados.
  - `Tabla Sueldo.csv`: Información sobre los sueldos de los empleados.
- **imgs/**: Contiene las imágenes utilizadas en el **dashboard**.
  - `relacion_de_tablas.png`: Diagrama de la relación entre las tablas.

## Relación de las Tablas

Las tablas están relacionadas mediante el campo `ID Empleado`, que actúa como clave primaria en la `Tabla Empleados` y clave foránea en las tablas de `Evaluación` y `Sueldo`.

![Relación de Tablas](./imgs/relacion_de_tablas.png)


## Visualización de hoja de total de empleados

Para esta hoja tendremos indicadores,Tarjetas,Tarjetas, Gráficos de barras apiladas,Mapa, Gráfico de columnas apiladas Y tablas que muestrenlos diferentes datos de nuestros empleados

![Hoja total empleados](./imgs/Hoja_total_empleados.png)

# Estructura de gráfico de barras apiladas
