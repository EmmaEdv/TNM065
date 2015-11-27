<?php
    $query2 = "SELECT  *
        FROM Gym
        WHERE activityId = $activityId";

    // utför själva frågan. Om du har fel syntax får du felmeddelandet query failed
    $result2 = mysqli_query($link, $query2)
    or die("Query failed");

    while ($line2 = mysqli_fetch_object($result2)) {
        // lagra innehållet i en tabellrad i variabler
        $exercise = $line2->exercise; 
        $weight = $line2->weight;
        $repetitions = $line2->repetitions;
    }
?>