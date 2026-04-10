<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <!-- Configuración de salida -->
  <xsl:output method="html" indent="yes"/>
  <!-- Define la configuración del formato, por lo que primero, en el método establece el archivo de salida
  html, y aplica la indentación del documento por medio del yes. -->
  
  
  <!-- XSL:Template principal // Define las plantillas definidas por el match, que en este caso enlaza con el elemento raiz "/"
    Esto quiere decir, que iniciará con la estructura del XML desde el inicio, primer nodo, pasteleria,
    e irá aplicando desde ahí.-->
  <xsl:template match="/">
    
    
    <html>
      <head>
        <title>Pastelería</title>
        <style>
          body { font-family: Arial; background-color: #fdf6f0; }
          h1 { color: #d35400; }
          table { border-collapse: collapse; width: 80%; }
          th { background-color: #f4a261; }
          th, td { padding: 10px; text-align: center; }

          <!--En este apartado definimos los estilos de las clases que posteriormente
              asignaremos según el valor numérico de la valoración -->
          .alto { color: green; font-weight: bold; }
          .medio { color: orange; }
          .bajo { color: red; }
        </style>
      </head>
      
      <body>
        
        <h1>Catálogo de Productos</h1>
        
        <!-- FUNCIONES XPath -->
        <p>Total de productos:
          <xsl:value-of select="count(pasteleria/producto)"/>
        </p>
        
        <p>Stock total disponible:
          <xsl:value-of select="sum(pasteleria/producto/stock)"/>
        </p>
        
        <table border="1">
          <tr>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Valoración</th>
          </tr>
          
          <!-- XSL: APPLY-TEMPLATES // Funciona como las agrupaciones. Siguiendo el enrutamiento
              se aplica a los productos, y al ser específico, por cómo funciona la herencia, tiene prioridad.
              Posteriormente en el fichero, cuando un template haga match con productos, se desarrollará el estilo-->
          
          <xsl:apply-templates select="pasteleria/producto">
            
            <!--XSL: SORT // El sort se emplea para ordenar resultados-->
            <xsl:sort select="precio" data-type="number" order="ascending"/>
          </xsl:apply-templates>
          
        </table>
        
      </body>
    </html>
    
  </xsl:template>
  
  <!-- XSL:Template // Hace llamamiento de estilo para cada producto -->
  <xsl:template match="producto">
    
    <!-- XSL:IF // Este if hace que los productos cuyo stock sea mayor 0 en el xml se muestren y los que no se omitan en la página.-->
    <xsl:if test="stock &gt; 0">
      <!-- La entidad &gt es es equivalente a mayor que -->
      
      <tr>
        
        <!-- XSL: FOR-EACH // Recorre el conjunto de nodos seleccionados y a cada uno se la aplica el estilo correspondiente. -->
        <xsl:for-each select="nombre | categoria | precio | stock">
          
          <td>
            <!--XSL:VALUE-OF // Extrae y muestra el contenido del nodo o el valor de un atributo del XML 
              select="." copia el contenido del nodo en el que se encuentra el procesador -->
            <xsl:value-of select="."/>
            <!-- Añadir símbolo € solo en precio -->
            <xsl:if test="name() = 'precio'">
              <xsl:text> €</xsl:text>
            </xsl:if>
          </td>
          
        </xsl:for-each>
        
        <!-- Valoración con estilos -->
        <td>
          <xsl:element name="span">
            
            <xsl:attribute name="class">
              <xsl:choose>
                <xsl:when test="valoracion &gt;= 4.5">alto</xsl:when>
                <xsl:when test="valoracion &gt;= 4">medio</xsl:when>
                <xsl:otherwise>bajo</xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
            
            <xsl:value-of select="valoracion"/>
            
          </xsl:element>
        </td>
        
      </tr>
      
    </xsl:if>
    
  </xsl:template>
  
</xsl:stylesheet>
