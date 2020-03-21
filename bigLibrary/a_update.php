<?php

    require_once 'db_connect.php';

    if($_POST){
        $id= intval($_POST['id']);
        $title = $_POST['title'];
        $image = $_POST['image'];
        $ISBN = $_POST['ISBN'];
        $description = str_replace("'", "", $_POST['description']);
        $type = $_POST['type'];


      
            $sql = "UPDATE `media` SET `title`='$title' ,`image`='$image' ,`ISBN`='$ISBN' , `description`='$description' , `type`='$type'  WHERE `media_id`='$id' ";

        if($conn->query($sql)===TRUE) {
            header("Location: index.php");
        } else {
            
            var_dump($sql);
            echo "error..." . $conn->connect_error;
        }

    }
?>
