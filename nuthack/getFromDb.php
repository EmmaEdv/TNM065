<?php header("Content-type:text/xml;charset=utf-8");?>
   
 <?php  
    // koppla upp mot databasen med med användarnamn "rsslab", utan lösenord
    $servername = "localhost";
    $username = "root";
    $password = "root";

    $link = mysql_connect($servername, $username, $password)
        or die("Could not connect");
    // välj databasen rsslab
    mysql_select_db("nuthack")
        or die("Could not select database");
    $returnstring_about ="<wlog><name>WLOG</name>";
    $currentDate=date("c");
    // en sql-fråga som väljer ut alla rader sorterade fallande på år och vecka
    $query = "SELECT  *
            FROM Activity
            ORDER BY userId DESC";

    // utför själva frågan. Om du har fel syntax får du felmeddelandet query failed
    $result = mysql_query($query)
        or die("Query failed");
        
    // loopa över alla resultatrader och skriv ut en motsvarande tabellrad
    while ($line = mysql_fetch_object($result)) {
        // lagra innehållet i en tabellrad i variabler
        $userId = $line->userId; 
        $date = $line->date;
        $text = $line->text;
        $place = $line->place;
        $activityId = $line->activityId;
        $activityType = $line->activityType;
        $text = preg_replace("/&/","&amp;", $text);
        $place = preg_replace("/&/","&amp;", $place);

        $publish_date = date("c",strtotime($line->publish_date));
        // bygg upp en sträng innehållande det resultat vi vill ha
        // slå ihop två strängar med ".".   
        $returnstring_about = $returnstring_about . "<wlogpost><userId>$userId</userId><date>$date</date><text>$text</text><place>$place</place><activityId>$activityId</activityId><activityType>$activityType</activityType></wlogpost>"; 
    }
    // koda för säkerhets skull om till utf-8 innan resultatet
    // skrivs ut.
    $returnstring_about = $returnstring_about . "</wlog>";
    print utf8_encode($returnstring_about); 
?>