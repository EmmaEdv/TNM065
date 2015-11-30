<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml">
<xsl:output indent="yes"/>
<xsl:template match="apa/activity">
    <html>
        <head>
            <link rel="stylesheet" type="text/css" href="css/style_main.css"> </link>
        </head>
            
        <body>
            <div id="header">
                <h1>Create activity</h1>
            </div>
            <div id="contents">
                <form method="post" action="updateDb.php">
                    Activity:
                    <br></br>
                    <select disabled="true">
                        <option name="activityType">
                            <xsl:value-of select="activityType"/>    
                        </option>
                    </select>
                    <br></br>
                    Text:
                    <br></br>
                    <input type="text" name="text">
                        <xsl:attribute name="value">
                            <xsl:value-of select="text"/>
                        </xsl:attribute>
                    </input>
                    <br></br>
                    Place:
                    <br></br>
                    <input type="text" name="place">
                        <xsl:attribute name="value">
                            <xsl:value-of select="place"/>
                        </xsl:attribute>
                    </input>
                    <br></br>
                    Date:
                    <br></br>

                    <input type="date" name="date">
                        <xsl:attribute name="value">
                            <xsl:value-of select="date"/>
                        </xsl:attribute>
                    </input>
                    <br></br>
                    <!--Löpning som default-->
                    <xsl:choose>
                        <xsl:when test="activityType = 'Running'">
                            <div id="specificInput">
                                Length: <br></br> 
                                <input type='text' name='length'> 
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="length"/>
                                    </xsl:attribute>
                                </input>
                                m <br></br>
                                Time: <br></br>
                                <input type='time' name='time' step='1'>
                                    <xsl:attribute name="value">
                                        <xsl:value-of select="time"/>
                                    </xsl:attribute>
                                </input><br></br>
                            </div>
                        </xsl:when>

                        <xsl:when test="activityType = 'Gym'">
                            Exercise: <br></br>
                            <input type='text' name='exercise'>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="exercise"/>
                                </xsl:attribute>
                            </input> <br></br> 
                            Weight: <br></br>
                            <input type='text' name='weight'>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="weight"/>
                                </xsl:attribute>
                            </input> kg <br></br> 
                            Reps: <br></br> 
                            <input type='text' name='repetitions'>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="repetitions"/>
                                </xsl:attribute>
                            </input> <br></br> 
                        </xsl:when>

                        <xsl:when test="activityType = 'Swimming'">
                            Stroke: <br></br> 
                            <input type='text' name='stroke'>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="stroke"/>
                                </xsl:attribute>
                            </input> <br></br>
                            Length: <br></br>
                            <input type='text' name='length'>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="length"/>
                                </xsl:attribute>
                            </input> m <br></br>
                            Time: <br></br>
                            <input type='time' name='time' step='1'>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="time"/>
                                </xsl:attribute>
                            </input> <br></br>
                        </xsl:when>
                        <xsl:otherwise>
                        </xsl:otherwise>
                    </xsl:choose>
                    
                    <!-- HIDDEN VALUES-->
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
                    <input type="submit" name="btn_sub" value="Submit"></input>
                </form>
            </div>
        </body>
    </html>

</xsl:template>
</xsl:stylesheet>