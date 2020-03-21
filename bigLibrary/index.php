<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="createStyle.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>CRUD | All MEDIA</title>
</head>
<body>
    <div class="container-fluid d-flex justify-content-center">
        <a class="btn btn-success text-center  mt-5" href="create.php">Create Media</a>
    </div>
            <p class="text text-info p-5">

                <?php
                    include ("db_connect.php");

                    $sql = "SELECT `media_id`, `title`, `type`, `status` FROM `media`";
                    $result = mysqli_query($conn, $sql);

                    if($result ->num_rows == 0){
                        echo "No result";
                    }elseif($result->num_rows == 1){
                        $row = $result->fetch_assoc();
                        echo $row['title']. " " .$row['type']. " " .$row['status'];
                    }else{
                        $rows = $result->fetch_all(MYSQLI_ASSOC);
                        foreach ($rows as $key =>$value) {
                            echo $value['title']. " " .$value['type']. " " .$value['status']. " <a class='btn btn-primary' href='update.php?id=".$value["media_id"]."'>Update</a> <a class='btn btn-danger' href='delete.php?id=".$value["media_id"]."'>Delete</a><br>";  
                        }
                    }
                ?>   
            </p>
   
</body>
</html>
