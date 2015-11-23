<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
                xmlns:rss="http://purl.org/rss/1.0/"
                xmlns:dc="http://purl.org/dc/elements/1.1/"
                xmlns:syn="http://purl.org/rss/1.0/modules/syndication/"
                xmlns="http://www.w3.org/1999/xhtml"
                version="1.0">
<xsl:output indent="yes"/>
<xsl:template match="channel">
	<html>
		<head>
		   <title>Lab 3 feed</title>
		</head>
		<body>       
			<xsl:for-each select="item">
				<h2>
					<xsl:element name="a">
     					<xsl:attribute name="href">
     						<xsl:value-of select="link"/>
     					</xsl:attribute>
     					<xsl:value-of select="title"/>
     				</xsl:element>
				</h2>
				<xsl:value-of select="description"/>
			</xsl:for-each> 
		</body>
	</html>
</xsl:template>

</xsl:stylesheet>

