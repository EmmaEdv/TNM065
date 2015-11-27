 <?php  
    $servername = "188.226.180.103";
    $port = "3306";
    $username = "nuthack";
    $password = "hejsanphylyp";
    $mydb = "nuthack";

    $conn = mysqli_connect($servername, $username, $password, $mydb, $port)
       or die("Could not connect");

    $userId = 1;  
    
    $text = $_POST["text"];
    $place = $_POST["place"];
    $activityType = $_POST["activityType"];
    $date = $_POST["date"];
    
    $query = "INSERT INTO Activity (userId, date, text, place, activityType) VALUES ($userId, '$date', '$text', '$place', '$activityType')";
    
    $result = mysqli_query($conn, $query)
        or die("Query failed");
    
    $activityId = mysqli_insert_id($conn);
    
    if($activityType == "running") {
        $length = $_POST["length"];
        $time = $_POST["time"];

        $query2 = "INSERT INTO Running (activityId, length, time) VALUES ($activityId, $length, '$time')";

        $result = mysqli_query($conn, $query2)
            or die("Query failed");
    } 
    else if($activityType == "gym") {
        $exercise = $_POST["exercise"];
        $weight = $_POST["weight"];
        $reps = $_POST["reps"];

        $query2 = "INSERT INTO Gym (activityId, exercise, weight, repetitions) VALUES ($activityId, '$exercise', $weight, $reps)";

        $result = mysqli_query($conn, $query2)
            or die("Query failed");
    } 
    else if($activityType == "swimming") {
        $stroke = $_POST["stroke"];
        $length = $_POST["length"];
        $time = $_POST["time"];

        $query2 = "INSERT INTO Swimming (activityId, stroke, length, time) VALUES ($activityId, '$stroke', $length, '$time')";

        $result = mysqli_query($conn, $query2)
            or die("Query failed");
    } 

    $conn->close();
?>
