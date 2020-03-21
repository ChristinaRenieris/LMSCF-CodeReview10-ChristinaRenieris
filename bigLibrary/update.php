<?php

require_once 'db_connect.php';
if($_GET['id']){
    $id = $_GET['id'];

    $sql = "SELECT * FROM `media` WHERE media_id= $id";
    $result = mysqli_query($conn, $sql);

    $row = $result->fetch_assoc();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="createStyle.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Crud | Update Media</title>
</head>
<body>
<div class="container d-flex justify-content-center mt-5">

        <div class="text-center text-white p-5 bg-info w-50">

            <div class="h2 p-2 text-dark">Submit Media Here</div>

            <form action="a_update.php" method="post">

                <input type="hidden" name="id" value="<?= $row['media_id']?>">

                <label>Title :</label> <br>
                <input class="form-control" type="text" name="title" value="<?= $row['title'] ?>"> <br>

                <label>Image Link :</label> <br>
                <input class="form-control" type="text" name="image" value="<?= $row['image'] ?>"> <br>

                <label>ISBN :</label> <br>
                <input class="form-control" type="text" name="ISBN" value="<?= $row['ISBN'] ?>"> <br>

                <label>Description :</label> <br>
                <input class="form-control" type="text" name="description" value="<?= $row['description'] ?>"> <br>

                <label for="type">Choose a type:</label>
                    <select name="type">
                        <option value="Book">Book</option>
                        <option value="CD">CD</option>
                        <option value="DVD">DVD</option>
                        <option value="Comic">Comic</option>
                        <option value="Manga">Manga</option>
                    </select> <br>

                
                <br><br>
                <button type="submit" class="btn btn-secondary" name="submit">Update Media</button>
            
            </form>
        </div>
    </div>
</body>
</html>