<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml">
<xsl:output indent="yes"/>
<xsl:template match="apa/wlog">
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="css/style_mobile.css" />
            <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
        </head>
            
        <body>
            <div id="header">
                <h1><xsl:value-of select="name"/> - mobile</h1>
                <button type="button"><a href="mypage.php">log in</a></button>
                <button type="button"><a href="download_xml.php">XML</a></button>
            </div>
            <div id="contents">
                <xsl:for-each select="wlogpost">
                    <div class="item">
                        <div class="toprow" >
                            <xsl:choose>
                                <xsl:when test="activityType = 'Gym'">
                                    <img src="img/weight.png" alt="wieght" height="42" width="42"/>
                                    <h3><xsl:value-of select="activityType"/></h3>
                                </xsl:when>
                                <xsl:when test="activityType = 'Running'">
                                    <img src="img/running.png" alt="wieght" height="42" width="42"/>
                                    <h3><xsl:value-of select="activityType"/></h3>
                                </xsl:when>
                                <xsl:otherwise>
                                    <img src="img/swimming.png" alt="wieght" height="42" width="42"/>
                                    <h3><xsl:value-of select="activityType"/></h3>
                                </xsl:otherwise>
                            </xsl:choose>
                            <h4><xsl:value-of select="date"/></h4>
                            <h5><xsl:value-of select="place"/></h5>
                        </div>
                        
                        <xsl:choose>
                            <xsl:when test="activityType = 'Swimming'">
                                <h5>Race:</h5>
                                <ul>
                                    <li><xsl:value-of select="stroke"/>.<xsl:value-of select="length"/> 
                                        in <xsl:value-of select="time"/></li>
                                </ul>
                            </xsl:when>
                            <xsl:when test="activityType = 'Running'">
                                <h5>Race:</h5>
                                <ul>
                                    <li><xsl:value-of select="length"/>m in <xsl:value-of select="time"/></li>
                                </ul>
                            </xsl:when>
                            <xsl:when test="activityType = 'Gym'">
                                <h5>Exercise:</h5>
                                <ul>
                                    <li><xsl:value-of select="repetitions"/> reps <xsl:value-of select="exercise"/> 
                                        at <xsl:value-of select="weight"/>kg</li>
                                </ul>
                            </xsl:when>
                            <xsl:otherwise>
                            </xsl:otherwise>
                        </xsl:choose>
                        <h5>Text:</h5>
                        <p>
                            <xsl:value-of select="text"/>
                        </p>
                    </div>
                </xsl:for-each>
            </div>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>