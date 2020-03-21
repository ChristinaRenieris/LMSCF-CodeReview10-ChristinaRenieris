<?php 

    require_once 'db_connect.php';

    if($_POST){
        $title = $_POST['title'];
        $image = $_POST['image'];
        $ISBN = $_POST['ISBN'];
        $description = $_POST['description'];
        $type = $_POST['type'];
        

        //echoing to check connection
        // echo $title;

        //echo the $sql to check if it works, AFTER creating a new user in create.php
        $sql = "INSERT INTO `media`(`title`, `image`, `ISBN`, `description`, `type`) VALUES ('$title','$image', '$ISBN', '$description', '$type')";

        if(mysqli_query($conn, $sql)) {
           header("Location: index.php");
        }else{
            echo "error";
        }
    }
?>