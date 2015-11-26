<?php include 'prefix.php';?>

 <?php  
    // koppla upp mot databasen med med användarnamn "rsslab", utan lösenord
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "nuthack";

    $userId = 1;  
    
    $text = $_POST["text"];
    $place = $_POST["place"];
    $activityType = $_POST["activityType"];
    $date = $_POST["date"];

    //Se till att det kodas som utf8 så vi inte får tokiga tecken.
   /* $search = array('å', 'ä', 'ö', '&');
    $replace = array('&aring;', '&auml;', '&ouml;', '&amp;');
    $text = str_replace($search, $replace, $text);
    $place = str_replace($search, $replace, $place);*/
    //$activityType = $_POST["activityType"];
    //$text = $_POST["text"];

    
    $sql = "INSERT INTO Activity (userId, date, text, place, activityType) VALUES ($userId, '$date', '$text', '$place', '$activityType')";
    

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 

    if ($conn->query($sql) === TRUE) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }


    //If running:
    


    //If gym:


    //If swimming: 


    $conn->close();
/*
    $link = mysql_connect($servername, $username, $password)
        or die("Could not connect");
    // välj databasen rsslab
    mysql_select_db("nuthack")
        or die("Could not select database");
    

    // Lägger in aktivitet med användarid, plats och aktivitetstyp
    $query = "INSERT INTO Activity (userId, place, activityType) VALUES ($userId,  $place, $activityType)";

    // utför själva frågan. Om du har fel syntax får du felmeddelandet query failed
    $result = mysql_query($query)
        or die("Query failed");
<?php include 'postfix.php';?>        */
?>
