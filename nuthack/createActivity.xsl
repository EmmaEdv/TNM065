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
                <h1>Skapa aktivitet</h1>
            </div>
            <div id="contents">
                <form method="post" action="postToDb.php">
                    Aktivitet:
                    <br/>
                    <select name="activityType">
                      <option value="running">Löpning</option>
                      <option value="gym">Gym</option>
                      <option value="swimming">Simning</option>
                    </select>
                    <br/>
                    Fritext:
                    <br/>
                    <input type="text" name="text"/>
                    <br/>
                    Plats:
                    <br/>
                    <input type="text" name="place"/>
                    <br/>
                    Date:
                    <br/>

                    <!--TODO: HÄMTA DAGENS DATUM AUTOMAGISKT PLEASE-->

                    <input type="date" name="date" value="2015-11-26"/>
                    <br/>

                    <!-- If option selected == running -->
                    Längd:
                    <br/>
                    <input type="text" name="length"/>
                    <br/>
                    Tid:
                    <br/>
                    <input type="text" name="time"/>
                    <br/>

                    <input type="submit" id="btn_sub" name="btn_sub" value="Submit" />
                </form>

            </div>
        </body>
    </html>
</xsl:template>

</xsl:stylesheet>