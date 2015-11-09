<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="catalog"> 
<html>
  
  <body>
      <h1>Books</h1>
    	<xsl:for-each select="books/book">
     	<ul>
     		<li>
     			<a href=""> <xsl:value-of select="title"/> </a>
     			<strong><xsl:value-of select="year"/>, </strong>
     			<xsl:value-of select="description"/>
     		</li>
     	</ul>
     	</xsl:for-each>
  </body>
  
  </html>
</xsl:template> 


  
</xsl:stylesheet>

