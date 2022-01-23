<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>InfoCiné</title>       
        <meta name="viewport"  content="width=device-width,initial-scale=1">
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" >
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link href="http://fonts.googleapis.com/css?family=Lato&subset=latin,latin-ext" rel="stylesheet" type="text/css">   
        <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"/>
        <link rel="stylesheet" type="text/css" media="screen" href="css/SignUpIN.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/main.css" />
      	<link rel="stylesheet" type="text/css" media="screen" href="css/moncompte.css" />

      
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/stars.js" ></script>
        <script src="js/carrousel.js"></script>
    </head>
    <body>
	  <nav class="navbar navbar-expand-lg navbar-light bg-black">
		  <button class="navbar-toggler "  type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
			<img style="width:30px;height:30px;"src='images/toggle.png'>
		  </button>
		  <a class="navbar-brand" href="#"> <div class="logo">
					  <img src="images/logo.png">
					  </div></a>
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo01">   
		  <div class="col-lg-6 col-md-6 col-sm-12 ">
						<div id="left">                   
						  <ul class="navbar-nav ">                               
							<li class="nav-item">
							  <a class="nav-link text-light" href="acceuil.php">acceuil</a>
							</li>
						  
						  
						  </ul>
						</div>
					  </div>
			<div class="col-lg-6 col-md-6 col-sm-12"   >
						<div id="right">
						  <?php 
							  if(!empty($_SESSION['user'])):?>
								<ul class="navbar-nav "> 
								<li > <a class="nav-link text-light" href="moncompte.php"> mon compte</a></li >
								<li >  <a class="nav-link text-light" href="deconnexion.php"> déconnexion</a></li >
										  </ul>
						  <?php else:?>
						  <ul class="navbar-nav ">                                           
							<li ><a class="nav-link text-light" href="signUp.php"> Sign up </a></li>
							<li ><a class="nav-link text-light" href="signIn.php"> Sign In</a></li>                          
						  <?php endif;?>              
						  </ul>
						</div>
					</div>
					</div>   
		  </div>
		</nav>
		  <div class="container-fluid" id="moncompte">
  <div >
    <div id='transp'>
 
        <div >
           <form action="" method="post" enctype="multipart/form-data">
              <div class="container-fluid">
                                         <div class="row">
                                                      <div class=" col-lg-8  col-md-8 col-sm-8  col-xs-12 col-8">                                                            <div class=" input1">
                                                                <h4><label for="nom">Nom<span id="etoile"> *</span></label></h4>
                                                                <div class="input">
                                                                <input style="width:100%;"type="text"  name="nom" class="form-control " id="nom" placeholder="votre nom">
                                                                </div>
                                                        </div>
                                                        <div class=" input1">
                                                                <h4><label for="Prenom">Prenom<span id="etoile"> *</span></label></h4>
                                                                <div class="input">
                                                                <input style="width:100%;"type="text"  name="Prenom" class="form-control " id="nom" placeholder="votre prénom">
                                                                </div>
                                                        </div>
                                                       
                                                  </div> 
                                              <div style="padding:20px" class=" col-lg-4  col-md-4 col-xs-4 col-xs-4 col-5"> 
                                                    <div class="container-fluid">
                                                      <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8">
                                                      <?php if(!empty($_SESSION['photo'])) {?>
                                                             <img   id="Photo"src="<?php echo $_SESSION['photo']?>" alt="Avatar" class="avatar"> 
                                                             <?php ;}else{ ?> 
                                                        <img   id="Photo"src="images/avatar7.jpg" alt="Avatar" class="avatar">  
                                                        <?php } ?> 

                                                      </div>
                                                      <div class="col-lg-8 col-md-8 col-xs-8 col-sm-8"> 
                                                        <input  onchange="displayImage(this)" type="file"   name="photo"  classe="from-control button" ></input>
                                                      </div>
                                              </div>   
                                            </div> 
                                               </div>
                                            <div class="row">
                                             <div style="padding-top:10px"class="container ">
                                                    <div class=" col-8 input1">
                                                            <div class="continuer rightcontinuer">
                                                            <button type="submit" style="width:100%;"class="btn btn-outline-light continuer">enregistrer</button> 
                                                            </div>
                                                    </div>        

                                                    <div class=" col-8 input1">
                                                              <div class='rightsupprmier'>
                                                                  <a class="btn btn-outline-light delet" style="width:100%;"  onclick="return confirm('confirmez la suppression de votre compte ?')" href="delet.php">supprimer votre compte ?</a>
                                                              </div>
                                                    </div>        
                                                    <div class=" col-8 input1">
                                                              <div class='rightsupprmier'>
                                                                  <a href="password.php" style="width:100%;"class= "btn btn btn-outline-light delet" >modifier mon mot de passe ?</a>
                                                              </div> 
                                                    </div>        
                                                    <div class="col-8 input1">
                                                                <div class='rightsupprmier'>
                                                                    <a href="forgot.php"style="width:100%;" class= "btn btn btn-outline-light delet" >réinitialiser mon mot de passe ?</a>
                                                                </div> 
                                                        </div>      
                                             </div>
                                            </div>
                   </form>
        </div>
      </div>
      </div>
      </div>
    </body>
</html>