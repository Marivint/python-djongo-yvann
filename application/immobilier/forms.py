from django import forms

class ContactForm(forms.Form):
    sujet = forms.CharField(max_length=100)
    email = forms.EmailField(label="Votre adresse e-mail")
    message = forms.CharField(widget=forms.Textarea)
    renvoi = forms.BooleanField(help_text="Cochez si vous souhaitez obtenir une copie du mail envoyé.", required=False)
    sujet.widget.attrs.update({'class' : 'form-control'})
    email.widget.attrs.update({'class' : 'form-control'})
    message.widget.attrs.update({'class' : 'form-control'})

class InscriptionForm(forms.Form):
	login = forms.CharField(max_length=100)
	nom = forms.CharField(max_length=100)
	prenom = forms.CharField(max_length=100)
	email = forms.EmailField(label="Votre adresse e-mail")
	mdp = forms.CharField(max_length=100)

class ConnexionForm(forms.Form):
    login = forms.CharField(label="Nom d'utilisateur", max_length=30)
    mdp = forms.CharField(label="Mot de passe", widget=forms.PasswordInput)
    # <!-- <input type="text" class="form-control"" id="prenom" required="" data-validation-required-message="Veuillez saisir votre prénom."> -->
    login.widget.attrs.update({'class' : 'form-control', 'placeholder' : 'Login'})
    mdp.widget.attrs.update({'class' : 'form-control', 'placeholder' : 'Mot de passe'})

class RdvForm(forms.Form):
    nom = forms.CharField(max_length=100)
    prenom = forms.CharField(max_length=100)
    email = forms.EmailField(label="Votre adresse e-mail")
    message = forms.CharField(widget=forms.Textarea)
    renvoi = forms.BooleanField(help_text="Cochez si vous souhaitez obtenir une copie du mail envoyé.", required=False)