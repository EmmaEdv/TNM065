<?php include 'fix/prefix_mypage.php';?>
<apa>
    <?php  
        $servername = "188.226.180.103";
        $port = "3306";
        $username = "nuthack";
        $password = "hejsanphylyp";
        $mydb = "nuthack";

        $link = mysqli_connect($servername, $username, $password, $mydb, $port)
           or die("Could not connect");


        $returnstring_about ="<wlog><name>WLOG</name>";
        $currentDate=date("c");

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