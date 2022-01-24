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
					<a href="preference" style="float: right" class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
		    			<span>modifier</span>
		    		</a>
	    		</p>
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
						<a href="notation"  class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center">
			    			<span>Noter</span>
			    		</a>
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
						<form  method="post"> 
							<input type="hidden" name="op" value="suppression" />
							<input type="hidden" name="idVideo" value="${video.getId() }" />
							<button  class="btn py-2 px-3 btn-primary d-flex align-items-center justify-content-center" type="submit">
				    			<span>Supprimer</span>
				    		</button>
			    		</form>
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