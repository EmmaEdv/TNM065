<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml">
<xsl:output indent="yes"/>
<xsl:template match="apa/wlog">
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="style_main.css" />
        </head>
            
        <body>
            <div id="header">
                <h1><xsl:value-of select="name"/> - my page</h1>
                <button type="button"><a href="index_foo.php">log out</a></button>
                <button type="button"><a href="createActivity.html">Create activity</a></button>
            </div>
            <div id="contents">
                <xsl:for-each select="wlogpost">
                    <div class="item">
                        <form method="post" action="deleteActivity.php">
                            <input type="submit" name="delete_btn" value="Delete"> </input>
                            <input type="hidden" name="activityId">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="activityId"/>
                                </xsl:attribute>
                            </input>
                            <input type="hidden" name="activityType">
                                <xsl:attribute name="value">
                                    <xsl:value-of select="activityType"/>
                                </xsl:attribute>
                            </input>
                        </form>
                        <form method="post" action="updateActivity.php">
                            <input type="submit" name="edit_btn" value="Edit"> </input>
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
                                
                                <!-- HIDDEN FOR FORM-->
                                <input type="hidden" name="activityId">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="activityId"/>
                                    </xsl:attribute>
                                </input>
                                <input type="hidden" name="activityType">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="activityType"/>
                                    </xsl:attribute>
                                </input>
                                <input type="hidden" name="date">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="date"/>
                                    </xsl:attribute>
                                </input>
                                <input type="hidden" name="place">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="place"/>
                                    </xsl:attribute>
                                </input>
                                <input type="hidden" name="text">
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="text"/>
                                    </xsl:attribute>
                                </input>
                            </div>
                            
                            <xsl:choose>
                                <xsl:when test="activityType = 'Swimming'">
                                    <h5>Race:</h5>
                                    <ul>
                                        <li><xsl:value-of select="stroke"/>.<xsl:value-of select="length"/> 
                                            in <xsl:value-of select="time"/></li>
                                    </ul>
                                    <input type="hidden" name="length">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="length"/>
                                        </xsl:attribute>
                                    </input>
                                    <input type="hidden" name="time">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="time"/>
                                        </xsl:attribute>
                                    </input>
                                    <input type="hidden" name="stroke">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="stroke"/>
                                        </xsl:attribute>
                                    </input>
                                </xsl:when>
                                <xsl:when test="activityType = 'Running'">
                                    <h5>Race:</h5>
                                    <ul>
                                        <li><xsl:value-of select="length"/>m in <xsl:value-of select="time"/></li>
                                    </ul>
                                    <input type="hidden" name="length">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="length"/>
                                        </xsl:attribute>
                                    </input>
                                    <input type="hidden" name="time">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="time"/>
                                        </xsl:attribute>
                                    </input>

                                </xsl:when>
                                <xsl:when test="activityType = 'Gym'">
                                    <h5>Exercise:</h5>
                                    <ul>
                                        <li><xsl:value-of select="repetitions"/> reps <xsl:value-of select="exercise"/> 
                                            at <xsl:value-of select="weight"/>kg</li>
                                    </ul>
                                    <input type="hidden" name="repetitions">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="repetitions"/>
                                        </xsl:attribute>
                                    </input>
                                    <input type="hidden" name="exercise">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="exercise"/>
                                        </xsl:attribute>
                                    </input>
                                    <input type="hidden" name="weight">
                                        <xsl:attribute name="value">
                                            <xsl:value-of select="weight"/>
                                        </xsl:attribute>
                                    </input>
                                </xsl:when>
                                <xsl:otherwise>
                                </xsl:otherwise>
                            </xsl:choose>
                            <h5>Text:</h5>
                            <p>
                                <xsl:value-of select="text"/>
                            </p>
                        </form>
                    </div>
                </xsl:for-each>
            </div>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>