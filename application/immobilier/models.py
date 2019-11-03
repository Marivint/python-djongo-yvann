from django.db import models
from django.utils import timezone

class Logement(models.Model):
    id = models.AutoField(primary_key=True)
    intitule = models.CharField(max_length=255)
    adresse = models.CharField(max_length=255)
    ville = models.CharField(max_length=255)
    cp = models.IntegerField()
    tel = models.IntegerField()
    type = models.TextField()
    chambres = models.IntegerField()
    position = models.CharField(max_length=255)
    src_image = models.CharField(max_length=255)
    equipements = models.CharField(max_length=255)
    description = models.CharField(max_length=255)
    prix = models.IntegerField()

    class Meta:
        verbose_name = "logement"
        ordering = ['id']
    
    def __str__(self):
        """ 
        Cette méthode que nous définirons dans tous les modèles
        nous permettra de reconnaître facilement les différents objets que 
        nous traiterons plus tard dans l'administration
        """
        return self.intitule

class Message(models.Model):
    id = models.AutoField(primary_key=True)
    titre = models.CharField(max_length=255)
    message = models.TextField()
    id_utilisateur = models.IntegerField()
    id_logement = models.IntegerField()

    class Meta:
        verbose_name = "message"
        ordering = ['id']
    
    def __str__(self):
        """ 
        Cette méthode que nous définirons dans tous les modèles
        nous permettra de reconnaître facilement les différents objets que 
        nous traiterons plus tard dans l'administration
        """
        return self.titre