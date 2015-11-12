<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/> 
    <xsl:template match="/">
        <p><xsl:value-of select="sum(//book[type/@genre='Computer']/price/@value)"/></p>
    </xsl:template>     
</xsl:stylesheet>