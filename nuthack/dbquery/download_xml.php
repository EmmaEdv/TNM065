<?php  
    // koppla upp mot databasen
    $servername = "188.226.180.103";
    $port = "3306";
    $username = "nuthack";
    $password = "hejsanphylyp";
    $mydb = "nuthack";

    $link = mysqli_connect($servername, $username, $password, $mydb, $port)
       or die("Could not connect");
    // skapa xml sträng
    $returnstring_about = '<?xml version="1.0"?>';
    $returnstring_about = $returnstring_about . '<!DOCTYPE wlog SYSTEM "http://emmaedv.github.io/TNM065/nuthack/wlog.dtd">';
    $returnstring_about = $returnstring_about . "<wlog><name>WLOG</name>";
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

        // bygg upp en sträng innehållande det resultat vi vill ha
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

    // skrivs ut.
    $returnstring_about = $returnstring_about . "</wlog>";
    header('Content-Disposition: attachment; filename="nuthack.xml"');
    echo $returnstring_about; 
?>
