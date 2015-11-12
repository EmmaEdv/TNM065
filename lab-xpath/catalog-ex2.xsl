<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/> 
    <xsl:template match="//book[price/@value&lt;30]">
        <p><xsl:value-of select="@title"/></p>
    </xsl:template>     
</xsl:stylesheet>