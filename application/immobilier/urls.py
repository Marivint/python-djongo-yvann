from django.urls import path, include
from . import views

urlpatterns = [
	path('accueil', views.home, name="accueil"),
	path('contact', views.contact, name="formulaire_contact"),
	path('inscription', views.inscription, name="inscription"),
	path('connexion', views.connexion, name='connexion'),
	path('logement', views.logement, name="logement"),
]