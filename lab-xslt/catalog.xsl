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
     			<xsl:element name="strong">
     				<xsl:element name="a">
     					<xsl:attribute name="href">
     						<xsl:value-of select="link"/>
     					</xsl:attribute>
     					<xsl:value-of select="title"/>
     				</xsl:element> : <xsl:value-of select="publish_date/year"/>, 
     			</xsl:element> 
     			<xsl:value-of select="description"/>
     		</li>
     	</ul>
     	</xsl:for-each>

     	<h1>Articles</h1>
    	<xsl:for-each select="articles/article">
     	<ul>
     		<li>
     			<xsl:element name="strong">
     				<xsl:element name="a">
     					<xsl:attribute name="href">
     						<xsl:value-of select="link"/>
     					</xsl:attribute>
     					<xsl:value-of select="title"/>
     				</xsl:element>
	     			: 
	     			<xsl:for-each select="author">, 
	     				<xsl:value-of select="."/>
     				</xsl:for-each>
     			</xsl:element> 
     			<xsl:value-of select="year"/>
     		</li>
     	</ul>
     	</xsl:for-each>
  </body>
  
  </html>
</xsl:template> 


  
</xsl:stylesheet>

