<div align="center">
  <img src="https://git.unistra.fr/princelle/wheeleat/-/wikis/uploads/be9985cbc52f593b81bfa938b00b2b4d/wheeleat.png" alt="WheelEat Logo" width="200px" />

# WheelEat

[![forthebadge](https://forthebadge.com/images/badges/powered-by-black-magic.svg)](https://forthebadge.com)

</div>

Application de recherche de restaurant.

Lien vers le Git : https://git.unistra.fr/princelle/wheeleat

**Membres du groupe :**

* BRUA Hugo (hbrua@etu.unistra.fr)
* LAFORÊT Nicolas (nicolas.laforet@etu.unistra.fr)
* PRINCELLE Maxime (princelle@etu.unistra.fr)

Cette application a été conçue avec Flutter. Elle est disponible sous iOS, Android et le web.

- App Web : https://wheeleat.princelle.org
- APK Android : https://s3.princelle.org/share/wheeleat.apk
- iOS : consultez la section '[Comment construire l'application en local ?](#comment-construire-lapplication-en-local-)'

Le projet utilise les API's de Google : 
- [Places API](https://developers.google.com/maps/documentation/places/web-service/overview?hl=fr)
  - [Place Search](https://developers.google.com/maps/documentation/places/web-service/search?hl=fr)
  - [Place Details](https://developers.google.com/maps/documentation/places/web-service/details?hl=fr)
- [Geocoding API](https://developers.google.com/maps/documentation/geocoding/overview?hl=fr)
  - [Geocoding](https://developers.google.com/maps/documentation/geocoding/requests-geocoding?hl=fr)
  - [Reverse Geocoding](https://developers.google.com/maps/documentation/geocoding/requests-reverse-geocoding?hl=fr)

# Comment construire l'application en local ?

## Dépendances

Installez Flutter et toutes ses dépendances. 

Pour cela suivez la documentation officielle : https://docs.flutter.dev/get-started/install

N'oubliez pas de lancer : `flutter doctor` pour vérifier que votre environnement est au point.

## Préparation de l'environnement

Pour préparer l'environnement, copiez le fichier .env.model en .env à la racine du projet et ajoutez votre clé API Google dans "GOOGLE_API_KEY". 

Votre clé doit accès aux services : [Places API](https://developers.google.com/maps/documentation/places/web-service/overview?hl=fr) et [Geocoding API](https://developers.google.com/maps/documentation/geocoding/overview?hl=fr).

## Librairies

Installez les librairies du projet : `flutter pub get`

## Build & lancement

Plusieurs options sont disponibles pour ce qui est de l'environnement de test.

Choisissez celui qui vous convient le mieux en lançant la commande :
- Android : `flutter run android`
- Web : `flutter run web`
- iOS (uniquement disponible sur macOS) : `flutter run ios`

En cas de problème, contactez-nous ou consultez la documentation de Flutter.



