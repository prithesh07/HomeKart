<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="log.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<meta charset="ISO-8859-1">
<title>Sign-up Worker</title>
</head>
<body>
<div class="sidenav">
         <div class="login-main-text">
            <h1><br>HomeKart</h1>
            <p>One place to book your service professional</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-5">
            <div class="login-form">
               <form action="signup4.jsp">
                <div class="form-group">
                           <h3>Fill in to get started!</h3>  
                  </div>
                  <div class="form-group">
                     <label >Name</label>
                     <input type="text" name="name" class="form-control" placeholder="User Name" required>
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="pw" class="form-control" placeholder="Password"  required>
                  </div>
                  <div class="form-group">
                     <label>Mobile</label>
                     <input type="text" name="mb" class="form-control" placeholder="Mobile No"  required>
                  </div>
                  <div class="form-group">
                     <label>Address</label>
                     <input type="text" name="add" class="form-control" placeholder="Address"  required>
                  </div>
                 
                     <label>Area</label>
                     <input type="text" name="area" class="form-control" placeholder="Area"  required>
                  
                 
                     <label>Gender</label><br>
                     <input type="radio" id="1" name="gen" value="M" required>
					<label for="1"> Male</label><br>

						<input type="radio" id="2" name="gen" value="F" required>
						<label for="2">Female </label><br>
						
						<input type="radio" id="3" name="gen" value="na" required>
						<label for="3">Others </label><br>

                  
               
                  <div class="form-group">
                     <button type="submit" class="btn btn-black">Sign Up!</button>                     
                  </div>
                  
                 
				
               </form>
               
            </div>
         </div>
      </div>



</body>
</html>