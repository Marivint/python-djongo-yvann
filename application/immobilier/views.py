from django.http import HttpResponse
from django.shortcuts import render
from .forms import RdvForm
from django.contrib.auth import authenticate, login

from .forms import ContactForm
from .forms import ConnexionForm

from immobilier.models import Logement

def home(request):
    liste_logement = Logement.objects.all() # Nous sélectionnons tous nos articles
    return render(request, 'immobilier/index.html', locals())

def connexion(request):
    error = False

    if request.method == "POST":
        form = ConnexionForm(request.POST)
        if form.is_valid():
            login = form.cleaned_data["login"]
            mdp   = form.cleaned_data["mdp"]
            user  = authenticate(username=login, password=mdp)  # Nous vérifions si les données sont correctes
            if user:  # Si l'objet renvoyé n'est pas None
                login(request, user)  # nous connectons l'utilisateur
            else: # sinon une erreur sera affichée
                error = True
    else:
        form = ConnexionForm()

    return render(request, 'immobilier/connexion.html', locals())

def contact(request):
    # Construire le formulaire, soit avec les données postées,
    # soit vide si l'utilisateur accède pour la première fois
    # à la page.
    form = ContactForm(request.POST or None)
    # Nous vérifions que les données envoyées sont valides
    # Cette méthode renvoie False s'il n'y a pas de données 
    # dans le formulaire ou qu'il contient des erreurs.
    if form.is_valid(): 
        # Ici nous pouvons traiter les données du formulaire
        nom = form.cleaned_data['sujet']
        email = form.cleaned_data['email']
        message = form.cleaned_data['message']
        renvoi = form.cleaned_data['renvoi']

        # Nous pourrions ici envoyer l'e-mail grâce aux données 
        # que nous venons de récupérer
        envoi = True
    
    # Quoiqu'il arrive, on affiche la page du formulaire.
    return render(request, 'immobilier/contact.html', locals())


def clean_message(self):
    message = self.cleaned_data['message']
    if "pizza" in message:
        raise forms.ValidationError("On ne veut pas entendre parler de pizza !")

    return message  # Ne pas oublier de renvoyer le contenu du champ traité

def clean(self):
    cleaned_data = super(ContactForm, self).clean()
    sujet = cleaned_data.get('sujet')
    message = cleaned_data.get('message')

    if sujet and message:  # Est-ce que sujet et message sont valides ?
        if "pizza" in sujet and "pizza" in message:
            self.add_error("message", 
                "Vous parlez déjà de pizzas dans le sujet, "
                "n'en parlez plus dans le message !"
            )

    return cleaned_data


def inscription(request):
    # Construire le formulaire, soit avec les données postées,
    # soit vide si l'utilisateur accède pour la première fois
    # à la page.
    form = ContactForm(request.POST or None)
    # Nous vérifions que les données envoyées sont valides
    # Cette méthode renvoie False s'il n'y a pas de données 
    # dans le formulaire ou qu'il contient des erreurs.
    if form.is_valid(): 
        # Ici nous pouvons traiter les données du formulaire
        login = form.cleaned_data['login']
        nom = form.cleaned_data['nom']
        prenom = forms.cleaned_data['prenom']
        email = form.cleaned_data['email']
        mdp = form.cleaned_data['mdp']

        # Nous pourrions ici envoyer l'e-mail grâce aux données 
        # que nous venons de récupérer
        envoi = True
    
    # Quoiqu'il arrive, on affiche la page du formulaire.
    return render(request, 'immobilier/inscription.html', locals())

def logement(request):
    # Construire le formulaire, soit avec les données postées,
    # soit vide si l'utilisateur accède pour la première fois
    # à la page.
    form = ContactForm(request.POST or None)
    # Nous vérifions que les données envoyées sont valides
    # Cette méthode renvoie False s'il n'y a pas de données 
    # dans le formulaire ou qu'il contient des erreurs.
    if form.is_valid(): 
        # Ici nous pouvons traiter les données du formulaire
        nom = form.cleaned_data['nom']
        prenom = forms.cleaned_data['prenom']
        email = form.cleaned_data['email']
        message = form.cleaned_data['message']
        renvoi = form.cleaned_data['renvoi']

        # Nous pourrions ici envoyer l'e-mail grâce aux données 
        # que nous venons de récupérer
        envoi = True
    
    # Quoiqu'il arrive, on affiche la page du formulaire.
    return render(request, 'immobilier/logement.html', locals())