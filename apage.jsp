<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <title>Admin</title>
</head>
<body>
    <div class="admintask">
    <h4 class="headderiver">To add destination, click on the link below...</h4>
    <!-- <button type="button" class="btn btn-primary"><a href="destinations.jsp"></a>Add Destination</button> -->
    <div class="btndriver">
        <button type="submit" class="btn btn-primary" onclick="window.location = 'destinations.jsp';">Add Destination</button>
    </div>
    <h4 class="headderiver">To view the enquiries, click on the link below...</h4>
    <div class="btndriver">
        <button type="submit" class="btn btn-primary" onclick="window.location = 'viewenq.jsp';">View Enquiries</button>
    </div>
    <h4 class="headderiver">To add details of driver, click on the link below...</h4>
    <div class="btndriver">
        <button type="submit" class="btn btn-primary" onclick="window.location = 'adddetail.jsp';">Add Driver Details</button>
    </div>
    </div>
</body>
</html>