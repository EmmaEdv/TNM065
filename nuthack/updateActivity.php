<?php include 'fix/prefix_update.php';?>
<data>
    <?php  
        $activityId = $_POST['activityId'];
        $activityType = $_POST['activityType'];
        $date = $_POST['date'];
        $text = $_POST['text'];
        $place = $_POST['place'];
        
        $returnstring = "<activity><activityId>$activityId</activityId> <activityType>$activityType</activityType> <date>$date</date> <text>$text</text> <place>$place</place>";
        
        if($activityType == 'Running'){
            $length = $_POST['length'];
            $time = $_POST['time'];
            $returnstring = $returnstring . "<length>$length</length> <time>$time</time>"; 
        }
        else if($activityType == 'Gym'){
            $exercise = $_POST['exercise'];
            $weight = $_POST['weight'];
            $repetitions = $_POST['repetitions'];
            $returnstring = $returnstring . "<exercise>$exercise</exercise> <weight>$weight</weight> <repetitions>$repetitions</repetitions>"; 
        }
        else if($activityType == 'Swimming'){
            $stroke = $_POST['stroke'];
            $length = $_POST['length'];
            $time = $_POST['time'];
            $returnstring = $returnstring . "<stroke>$stroke</stroke> <length>$length</length> <time>$time</time>"; 
        }
        $returnstring = $returnstring . "</activity>";

        print utf8_encode($returnstring); 
    ?>
</data>
<?php include 'fix/postfix_update.php';?>