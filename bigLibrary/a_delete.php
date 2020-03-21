<?php 

require_once 'db_connect.php';

if($_POST){
    $id = $_POST['media_id'];

    $sql = "DELETE FROM media WHERE media_id = $id";

    if(mysqli_query($conn, $sql)){
        header("Location: index.php");
    }else{
        echo $sql;
    }
}






?>