<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:template match="/">
    <html>
      <head>
        <title>Extralaboration 4</title>
      </head>
      <body>
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>


  
  <xsl:template match="h1">
    <xsl:copy-of select="."/>
    <xsl:apply-templates select="times"/>
    <xsl:apply-templates select="fact"/>
    <xsl:apply-templates select="fib"/>
  </xsl:template>

  <xsl:template match="times">
    <xsl:variable name="times1" select="p1"/>
    <xsl:variable name="times2" select="p2"/>
    <xsl:value-of select="$times1 * $times2"/>
  </xsl:template>

  <xsl:template match="fact">
    <xsl:call-template name="factorial">
      <xsl:with-param name="n" select="." />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="factorial">
    <xsl:param name="n"/>
    <xsl:variable name="factsum">
      <xsl:if test="$n = 1">
        <xsl:value-of select="$n"/>
      </xsl:if>
      <xsl:if test="$n &gt; 1">
        <xsl:call-template name="factorial">
          <xsl:with-param name="n" select="$n - 1" />
        </xsl:call-template>
      </xsl:if>
    </xsl:variable>
    <xsl:value-of select="$factsum * $n"/>
  </xsl:template>

    <xsl:template match="fib">
    <xsl:variable name="fib1">
      <xsl:call-template name="fibonacci">
        <xsl:with-param name="n" select="." />
      </xsl:call-template>
    </xsl:variable>
    <!--<xsl:variable name="fib2">
      <xsl:call-template name="fibonacci">
        <xsl:with-param name="n" select=".-1" />
      </xsl:call-template>
    </xsl:variable>-->
    <xsl:value-of select="$fib1"/>
  </xsl:template>

  <xsl:template name="fibonacci">
    <xsl:param name="n"/>
    <!--Our two fibvalues, Fib(n) = Fib(n-1) + Fib(n-2)-->
    <xsl:param name="fib2" select="1" /><!--Fib(n-2)-->
    <xsl:param name="fib1" select="1" /><!--Fib(n-1)-->
    <!--<xsl:value-of select="$n"/>
    <xsl:variable name="fibsum">-->
    <xsl:choose>
      <xsl:when test="$n &lt;= 1">
        <xsl:value-of select="$fib2"/>
      </xsl:when>
      <!--<xsl:if test="$n = 1">
        <xsl:value-of select="$fib2"/>
      </xsl:if>-->
      <xsl:otherwise>
        <xsl:call-template name="fibonacci">
          <xsl:with-param name="n" select="$n - 1" />
          <!--Set Fib(n-2) = Fib(n-1) and Fib(n-1) = Fib(n-1)+Fib(n-2) -->
          <xsl:with-param name="fib2" select="$fib1" />
          <xsl:with-param name="fib1" select="$fib1 + $fib2" />
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
    <!--</xsl:variable>
    <xsl:value-of select="$fibsum + $n"/>-->
  </xsl:template>

</xsl:stylesheet>
