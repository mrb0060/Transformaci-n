# 🍰 Pastelería XSCake

Proyecto web que muestra el catálogo de productos de una pastelería utilizando **XML + XSLT**, renderizado dentro de una página HTML.

---

## 📁 Estructura del proyecto

```
📦 pasteleria-xs-cake
 ┣ 📄 index.html
 ┣ 📄 pasteleria.xml
 ┣ 📄 pasteleria.xsl
 ┗ 🖼️ pastelito-fresa.png
```

---

## 📄 Descripción de los archivos

### 🔹 `index.html`

Archivo principal de la web.

* Contiene la estructura HTML y estilos CSS.
* Incluye un encabezado y un banner visual.
* Muestra el catálogo cargando el XML dentro de un `<iframe>`. 

---

### 🔹 `pasteleria.xml`

Base de datos del catálogo en formato XML.

* Define los productos de la pastelería.
* Incluye atributos como:

  * `id`
  * `disponible`
* Contiene información como:

  * nombre
  * categoría
  * precio
  * stock
  * valoración 

---

### 🔹 `pasteleria.xsl`

Transformación XSLT del XML a HTML.

* Convierte los datos XML en una tabla HTML.
* Aplica lógica y presentación:

  * Ordena productos por precio (ascendente).
  * Filtra productos sin stock.
  * Calcula:

    * total de productos
    * stock total
* Aplica estilos según valoración:

  * 🟢 Alto (≥ 4.5)
  * 🟠 Medio (≥ 4)
  * 🔴 Bajo (< 4) 

---

## ⚙️ Funcionamiento

1. El archivo `index.html` carga el XML en un iframe.
2. El XML está vinculado al XSL mediante:

   ```xml
   <?xml-stylesheet type="text/xsl" href="pasteleria.xsl"?>
   ```
3. El navegador aplica la transformación XSLT automáticamente.
4. Se genera una tabla HTML dinámica con los productos.

---

## ✨ Características principales

* ✔ Uso de **XML como fuente de datos**
* ✔ Transformación con **XSLT**
* ✔ Uso de **XPath**:

  * `count()`
  * `sum()`
* ✔ Ordenación de datos (`xsl:sort`)
* ✔ Condicionales (`xsl:if`, `xsl:choose`)

---

## 🚀 Cómo usar

1. Clona o descarga el repositorio.
2. Asegúrate de que todos los archivos estén en la misma carpeta.
3. Abre `index.html` en tu navegador.

> ⚠️ Recomendación: usar navegadores como Chrome o Edge. Algunos navegadores pueden restringir XSLT en archivos locales.

---

## 🧠 Tecnologías utilizadas

* HTML5
* CSS3
* XML
* XSLT 1.0
* XPath

---

## 📌 Ejemplo de datos

Ejemplo de producto en XML:

```xml
<producto id="P01" disponible="si">
    <nombre>Tarta de Chocolate</nombre>
    <categoria>Tartas</categoria>
    <precio moneda="EUR">18.50</precio>
    <stock>5</stock>
    <valoracion>4.8</valoracion>
</producto>
```


