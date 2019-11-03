from django.urls import path, include
from . import views

urlpatterns = [
	path('', views.home, name='accueil'),
	path('accueil', views.home, name="accueil"),
	path('contact', views.contact, name="formulaire_contact"),
	path('inscription', views.inscription, name="inscription"),
	path('connexion', views.connexion, name='connexion'),
	path('deconnexion', views.deconnexion, name='deconnexion'),
	path('logement', views.logement, name="logement"),
]