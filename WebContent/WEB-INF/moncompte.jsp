<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="java.util.List" %>
<%@ page import="com.supdevinci.videostreaming.bean.VideoBean" %>
<%@ page import="com.supdevinci.videostreaming.bean.UserPreferenceBean" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Video Streaming</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="resources/css/flaticon.css">
    <link rel="stylesheet" href="resources/css/icomoon.css">
    <link rel="stylesheet" href="resources/css/style.css">
    
      <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	
	<style type="text/css">
		.
	</style>
  </head>
  <body>
	<div class="navbar-light">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-center align-items-stretch">
    			<div class="col-md-4 d-flex align-items-center py-4">
    				<a class="navbar-brand" href="index.html">Video  <span>Streaming en illimité</span></a>
    			</div>
	    		<div class="col-lg-8 d-block">
		    		<div class="row d-flex">
					    <div class="col-md topper d-flex align-items-center justify-content-end">
					    	<p class="mb-0">
					    		<a href="connexion?deconnexion" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
					    			<span>Se déconnecter</span>
					    		</a>
					    	</p>
					    </div>
				    </div>
			    </div>
		    </div>
		  </div>
    </div>
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container d-flex align-items-center px-4">
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span>
	      </button>
	      <form action="#" class="searchform order-lg-last">
	          <div class="form-group d-flex">
	            <input type="text" class="form-control pl-3" placeholder="Search">
	            <button type="submit" placeholder="" class="form-control search"><span class="ion-ios-search"></span></button>
	          </div>
	      </form>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav mr-auto">
	        	<li class="nav-item"><a href="index.html" class="nav-link" >Accueil</a></li>
	        	<li class="nav-item active"><a href="moncompte" class="nav-link pl-0" >Mon compte</a></li>
	          <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
	        </ul>
	      </div>
	    </div>
	</nav>
	
	<section class="container">
		<div class="row">
			<%
				UserPreferenceBean userPreference = (UserPreferenceBean)  request.getAttribute("userPreference");
	    	 %> 
			<h2> mes préférences 

			</h2>	
	    	<div style="margin-top: 40px">
				<p> Genre : <c:out value="${userPreference.getGenre()}"/>
					- Type video : <c:out value="${userPreference.getTypeVideo()}"/>
					  - Langue : <c:out value="${userPreference.getLangue()}"/>
					<button id="btn-modifier-preferences" style="float: right" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
		    			<span>modifier</span>
		    		</button>
	    		</p>
				<div id="dialog-u-prefrences" title="mes preferences - ${video.getTitre() }" >
			   		<form  method="post"> 
			   			<input type="hidden" name="action" value="modifier_user_preference" />
					  	Genre : <input type="text" name="genre" value="" /> <br>
						Type  : <input type="text" name="typeVideo" value="" /> <br>
						Langue : <input type="text" name="lngue" value="" />
						<button id="btn-enregistrer-preferences" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
			   				<span>Enregistrer</span>
			   			</button>
			   		</form>
				</div>
				<script type="text/javascript">
					$( "#dialog-u-prefrences" ).hide();
					$( "#btn-modifier-preferences" ).click(function() {
					    $( "#dialog-u-prefrences" ).dialog();
						});
				</script>
			</div>
		</div>
		
		<div class="row">
			<h2> mes videos visionnées</h2>		    
			<%
	    		List<VideoBean> videosVisionnees = (List<VideoBean>) request.getAttribute("videosVisionnees");
	    	%>
	    	<div>
			    <c:forEach items="${videosVisionnees}" var="video" >
			    	<div style="margin: 40px; float: right;">
					    <video controls width="250" title="${ video.getTitre() }">
						      <source src="${ video.getLien() }" type="video/mp4">
						      
						</video>
						<button id="btn-noter-${ video.getId() }" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
			    			<span><c:choose>
									<c:when test = "${ video.getNotation() != null}">Re-noter</c:when>
									<c:otherwise>Noter</c:otherwise>
								</c:choose>
							</span>
			    		</button>
			    		<div id="dialog-notation-${ video.getId() }" title="notation video - ${video.getTitre() }">
				    		<form  method="post"> 
							  	<input type="hidden" name="action" value="noter_video_visionnee" />
								<input type="hidden" name="idVideo" value="${video.getId()}" />
								<c:choose>
									<c:when test = "${ video.getNotation() != null}">
										<input type="hidden" name="idNotation" value="${video.getNotation().getId()}" />
										note (de 1 à 5) : <input type="text" name="note" value="${video.getNotation().getNote()}" />
										commentaire :<textarea  name="commentaire" rows="3" cols="33"> ${video.getNotation().getCommentaire()}</textarea>
									</c:when>
									<c:otherwise>
								    	note (de 1 à 5) : <input type="text" name="note" value="" />
										commentaire :<textarea  name="commentaire" rows="3" cols="33" value=""></textarea>
								  	</c:otherwise>
								</c:choose>
								<button type="submit" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
				    				<span>Enregistrer</span>
				    			</button>
				    		</form>
						</div>
						<script type="text/javascript">
						$( "#dialog-notation-${ video.getId() }" ).hide();
						$( "#btn-noter-${ video.getId() }" ).click(function() {
						    $( "#dialog-notation-${ video.getId() }" ).dialog();
							});
						</script>

					</div>
				</c:forEach>
			</div>
		</div>

		<div class="row">
			<h2> mes videos favorites</h2>		    
			<%
	    		List<VideoBean> videosFavorites = (List<VideoBean>) request.getAttribute("videosFavorites");
	    	%>
	    	<div>
			    <c:forEach items="${videosFavorites}" var="video" >
			    	<div style="margin: 40px; float: right;">
					    <video controls width="250" title="${ video.getTitre() }">
						      <source src="${ video.getLien() }" type="video/mp4">
						      
						</video>
						<button id="btn-supprimer-${ video.getId() }" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center" >
					    	<span>Supprimer</span>
					    </button>
						<div id="dialog-suppression-${ video.getId() }" title="suppression video - ${video.getTitre() }">
							<form  method="post"> 
								Voulez-vous vraimer supprimer cette video ? 
								<input type="hidden" name="action" value="supprimer_video_favorite" />
								<input type="hidden" name="idVideo" value="${video.getId() }" />
								<button type="submit" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
				    				<span>Oui</span>
				    			</button>
				    		</form>
			    		</div>
						<script type="text/javascript">
							$( "#dialog-suppression-${ video.getId() }" ).hide();
							$( "#btn-supprimer-${ video.getId() }" ).click(function() {
							    $( "#dialog-suppression-${ video.getId() }" ).dialog();
								});
						</script>
					</div>
				</c:forEach>
			</div>
		</div>			
		
		<div class="row">
			<h2>  videos suggérées </h2>		    
			<%
	    		List<VideoBean> videosSuggerees = (List<VideoBean>) request.getAttribute("videosSuggerees");
	    	%>
	    	<div>
			    <c:forEach items="${videosSuggerees}" var="video" >
			    	<div style="margin: 40px; float: right;">
					    <video controls width="250" title="${ video.getTitre() }">
						      <source src="${ video.getLien() }" type="video/mp4">
						</video>
					</div>
				</c:forEach>
			</div>
		</div>

	</section>
</body>
</html>