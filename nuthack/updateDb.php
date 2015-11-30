 <?php  
    $servername = "188.226.180.103";
    $port = "3306";
    $username = "nuthack";
    $password = "hejsanphylyp";
    $mydb = "nuthack";

    $conn = mysqli_connect($servername, $username, $password, $mydb, $port)
       or die("Could not connect");
    
    $activityId = $_POST["activityId"];
    $text = $_POST["text"];
    $place = $_POST["place"];
    $activityType = $_POST["activityType"];
    $date = $_POST["date"];
    
    $query = "UPDATE Activity SET date='$date', text = '$text', place = '$place', activityType = '$activityType' WHERE activityId = $activityId";
    
    $result = mysqli_query($conn, $query)
        or die("First query failed");
    echo $activityType;
    if($activityType == "Running") {
        //$runningId = $_POST["runningId"];
        $length = $_POST["length"];
        $time = $_POST["time"];

        $query2 = "UPDATE Running SET length = '$length', time = '$time' WHERE activityId = $activityId"; //&& runningId = $runningId";
        
        $result = mysqli_query($conn, $query2)
            or die("Running query failed");
    } 
    else if($activityType == "Gym") {
        //$gymId = $_POST["gymId"];
        $exercise = $_POST["exercise"];
        $weight = $_POST["weight"];
        $repetitions = $_POST["repetitions"];

        $query2 = "UPDATE Gym SET exercise = '$exercise', weight = $weight, repetitions = $repetitions WHERE activityId = $activityId"; // && gymId = $gymId

        $result = mysqli_query($conn, $query2)
            or die("Gym query failed");
    } 
    else if($activityType == "Swimming") {
        //$swimmingId = $_POST["swimmingId"];
        $stroke = $_POST["stroke"];
        $length = $_POST["length"];
        $time = $_POST["time"];

        $query2 = "UPDATE Swimming SET stroke = '$stroke', length = $length, time = '$time' WHERE activityId = $activityId";//&& swimmingId = $swimmingId

        $result = mysqli_query($conn, $query2)
            or die("Swimming query failed");
    } 

    $conn->close();
?>
