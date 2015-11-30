<?php include 'fix/prefix_mypage.php';?>
<apa>
    <?php  
        // koppla upp mot databasen med med användarnamn "rsslab", utan lösenord
        $servername = "188.226.180.103";
        $port = "3306";
        $username = "nuthack";
        $password = "hejsanphylyp";
        $mydb = "nuthack";

        //$link = mysql_connect($servername, $username, $password)
          //  or die("Could not connect");

        $link = mysqli_connect($servername, $username, $password, $mydb, $port)
           or die("Could not connect");
        // välj databasen rsslab
        /*mysql_select_db("nuthack")
            or die("Could not select database");*/
        $returnstring_about ="<wlog><name>WLOG</name>";
        $currentDate=date("c");
        // en sql-fråga som väljer ut alla rader sorterade fallande på år och vecka
        $query = "SELECT  *
                FROM Activity
                ORDER BY userId DESC";

        // utför själva frågan. Om du har fel syntax får du felmeddelandet query failed
        $result = mysqli_query($link, $query)
            or die("Query failed");
            
        // loopa över alla resultatrader och skriv ut en motsvarande tabellrad
        while ($line = mysqli_fetch_object($result)) {
            // lagra innehållet i en tabellrad i variabler
            $userId = $line->userId; 
            $date = $line->date;
            $text = $line->text;
            $place = $line->place;
            $activityId = $line->activityId;
            $activityType = $line->activityType;
            $text = preg_replace("/&/","&amp;", $text);
            $place = preg_replace("/&/","&amp;", $place);
            //$place = preg_replace("/ö/","&ouml;", $place);
            $place = preg_replace("/[å]/", "a", $place);  
            $place = preg_replace("/[Å]/", "A", $place);  
            $place = preg_replace("/[ä]/", "a", $place);  
            $place = preg_replace("/[Ä]/", "A", $place);  
            $place = preg_replace("/[ö]/", "o", $place);  
            $place = preg_replace("/[Ö]/", "O", $place); 

            // bygg upp en sträng innehållande det resultat vi vill ha
            // slå ihop två strängar med ".".   
            $returnstring_about = $returnstring_about . "<wlogpost><userId>$userId</userId><date>$date</date>
                <text>$text</text><place>$place</place><activityId>$activityId</activityId>
                <activityType>$activityType</activityType>"; 
            // query second db
            if($activityType == "Swimming") {
                include 'dbquery/swimming.php';
                // bygg upp en sträng innehållande det resultat vi vill ha
                $returnstring_about = $returnstring_about . "<stroke>$stroke</stroke><length>$length</length>
                    <time>$time</time>"; 
            }else if($activityType == "Running") {
                include 'dbquery/running.php';
                // bygg upp en sträng innehållande det resultat vi vill ha
                $returnstring_about = $returnstring_about . "<length>$length</length><time>$time</time>"; 
            }else if($activityType == "Gym") {
                include 'dbquery/gym.php';
                // bygg upp en sträng innehållande det resultat vi vill ha
                $returnstring_about = $returnstring_about . "<exercise>$exercise</exercise><weight>$weight</weight>
                    <repetitions>$repetitions</repetitions>"; 
            } else {
                 $returnstring_about = $returnstring_about;
            }
            $returnstring_about = $returnstring_about . "</wlogpost>";
        }
        


        // koda för säkerhets skull om till utf-8 innan resultatet
        // skrivs ut.
        $returnstring_about = $returnstring_about . "</wlog>";
        print utf8_encode($returnstring_about); 
    ?>
</apa>
<?php include 'fix/postfix_mypage.php';?>