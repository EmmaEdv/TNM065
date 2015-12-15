<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="report">
  <html>
    <h1><xsl:value-of select="head/title"/></h1>
    <p>Authors: 
	    <xsl:for-each select="head/authors/author">
	    	<xsl:value-of select="."/>
	    	<xsl:if test="position() &lt; last()">, </xsl:if>
	    </xsl:for-each> 
  	</p>
    <p>Keywords: 
	    <xsl:for-each select="head/keywords/keyword">
	    	<xsl:value-of select="."/>
	    	<xsl:if test="position() &lt; last()">, </xsl:if>
	  	</xsl:for-each>
	  </p>

		<xsl:for-each select="body/h1">
    	<xsl:number value="position()" format="1. "/>
    	<a href="#{generate-id(@title)}">
    		<xsl:value-of select="@title"/>
    	</a>
    	<br></br>
	    	<xsl:for-each select="child::h2">
	    		<xsl:value-of select="count(../preceding-sibling::h1) + 1"/>
	    		<xsl:number value="position()" format=".1. "/>
	    		<a href="#{generate-id(@title)}">
	    			<xsl:value-of select="@title"/>
	    		</a>
	    		<br></br>

	    		<xsl:for-each select="child::h3">
		    		<xsl:value-of select="count(../../preceding-sibling::h1) + 1"/>.<xsl:value-of select="count(../preceding-sibling::h2) + 1"/>
		    		<xsl:number value="position()" format=".1. "/>
		    			<a href="#{generate-id(@title)}">
		    				<xsl:value-of select="@title"/>
		    			</a>
		    		<br></br>
		  		</xsl:for-each>
	  		</xsl:for-each>
    </xsl:for-each>

    <xsl:for-each select="body/h1">
    	<h2><xsl:number value="position()" format="1. "/>
    	<a name="{generate-id(@title)}">
    		<xsl:value-of select="@title"/>
    	</a></h2>
    	<xsl:for-each select="p">
				<p><xsl:value-of select="."/></p>
  		</xsl:for-each>

  		<xsl:for-each select="child::h2">
	    		<h3><xsl:value-of select="count(../preceding-sibling::h1) + 1"/>
	    		<xsl:number value="position()" format=".1. "/>
	    		<a name="{generate-id(@title)}">
	    			<xsl:value-of select="@title"/>
	    		</a></h3>
	    		<xsl:for-each select="p">
						<p><xsl:value-of select="."/></p>
		  		</xsl:for-each>

	    		<xsl:for-each select="child::h3">
		    		<h4><xsl:value-of select="count(../../preceding-sibling::h1) + 1"/>.<xsl:value-of select="count(../preceding-sibling::h2) + 1"/>
		    		<xsl:number value="position()" format=".1. "/>
    				<a name="{generate-id(@title)}">
    					<xsl:value-of select="@title"/>
    				</a></h4>
    				<xsl:for-each select="p">
							<p><xsl:value-of select="."/></p>
			  		</xsl:for-each>
		  		</xsl:for-each>
	  		</xsl:for-each>
    </xsl:for-each>
  </html>
</xsl:template>
</xsl:stylesheet>