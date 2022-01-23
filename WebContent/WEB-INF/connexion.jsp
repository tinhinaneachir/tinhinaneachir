<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
  	<head>
    	<title></title>
    	<meta charset="utf-8">
    	<link rel="stylesheet" href="resources/css/flaticon.css">
    	<link rel="stylesheet" href="resources/css/icomoon.css">
    	<link rel="stylesheet" href="resources/css/style.css">
	
		<style type="text/css">
			.ligneForm{
			    display: flex;
			    justify-content: space-between;
			    width: 80%;
			    margin: .5rem;
			}
			table {
				margin-top:10px; 
	  			border-collapse : collapse;
	  			border-width: : 1px;
	  			border-style:solid;
	  			border-color:;
	  			width:28%;
	 		}
			td {
				border: 1px solid #ddd;
	  			padding: 5px;
	  			width: 163px;
	  			border: 2px solid white;	
			}
			 .block-form {
			 	width:500px; 
			 	border-style: solid; 
			 	border-width: 1px; 
			 	padding: 10px 10px 10px 10px; 
			 	background-color: #008080;
			 }
			 
			 .button {
				    background: #fd5f00;
					border: 1px solid #fd5f00;
					color: #fff;
				}
				
			.bg-form {
			    background: #0d1128;
			}
			
			.txt-xsmall {
			   font-size: x-small;
			   color: #fff;
			}
			
			.txt-small {
			   font-size: small;
			   color: #fff;
			}
			
			.label-wight {
				color: #fff;
			}
			
			.p-red {
				color: #f00;
			}
	</style>
	</head>
	<body>
	
		<div class="navbar-light">
	    	<div class="container">
	    		<div class="row no-gutters d-flex align-items-center align-items-stretch">
	    			<div class="col-md-4 d-flex align-items-center py-4">
	    				<a class="navbar-brand" href="index.html">Videos <span>Streaming</span></a>
	    			</div>
			    </div>
			  </div>
	    </div>
		
		<section class="container">
		<br />
		<div class="container">
			<form method="post"  name="login">
				
			
				<div id="login" class="block-form bg-form" >
				
					<% String errorMessage = (String) request.getAttribute("errorMessage");%>
					<c:if test="${not empty errorMessage}">
					   <p class="p-red"><c:out value="${errorMessage}"/></p>
					</c:if>

					<div>
						<label></label> 
						<br>
					</div>
				  	<div class="ligneForm">
				       	<label class="label-wight" for="nom">Identifiant   </label>
				       	<input id="identifiant"  type="text" name="identifiant"  value="" />
				  	</div>
				  	<div class="ligneForm">
						<label class="label-wight" for="motDePasse">Mot de passe</label>
						<input id="motDePasse"  type="password" name="motDePasse"  value="" />
					</div>
							  	
					<div style="text-align:right; margin-top:50px;"> 
							<input class="button txt-xsmall" name="Annuler" type="submit" value="Annuler">
							<input class="button txt-small" name="SeConnecter" type="submit" value="Se connecter">
				    </div>
				    <div class="ligneForm"> 
							<p class="txt-xsmall"> <a class="txt-xsmall" href="#"> mot de passe oublié ? </a> / <a class="txt-xsmall" href="#"> pas encore inscrit ? </a> </p> 
			
				    </div>			
				    
				</div>	
			</form>
	
		</div>
		</section>
	</body>
</html>