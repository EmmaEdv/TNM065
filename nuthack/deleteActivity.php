<?php  
    $servername = "188.226.180.103";
    $port = "3306";
    $username = "nuthack";
    $password = "hejsanphylyp";
    $mydb = "nuthack";

    $conn = mysqli_connect($servername, $username, $password, $mydb, $port)
       or die("Could not connect");
    
    $activityId = $_POST["activityId"];
    $activityType = $_POST["activityType"];
    

    if($activityType == "Running") {

        $query = "DELETE FROM Running WHERE activityId = $activityId";
        
        $result = mysqli_query($conn, $query)
            or die("Running query failed");
    } 
    else if($activityType == "Gym") {
        
        $query = "DELETE FROM Gym WHERE activityId = $activityId";

        $result = mysqli_query($conn, $query)
            or die("Gym query failed");
    } 
    else if($activityType == "Swimming") {

        $query = "DELETE FROM  Swimming WHERE  activityId = $activityId";

        $result = mysqli_query($conn, $query)
            or die("Swimming query failed");
    } 


    $query2 = "DELETE FROM Activity WHERE activityId = $activityId";
    
    $result = mysqli_query($conn, $query2)
        or die("First query failed");
    
    header("Location: mypage.php");

    $conn->close();
?>