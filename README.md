[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">Sweater Weather</h3>

  <p align="center">
    A JSON API that returns forecasts and background images for a city and estimated travel time between an origin and destination through five RESTful routes.
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Contact](#contact)



<!-- ABOUT THE PROJECT -->
## About The Project

![Sweater Weather Postman Request](https://user-images.githubusercontent.com/48839191/82373738-3b4cd500-99db-11ea-8e3e-90458f1f86d7.png)

[Sweater Weather](https://floating-lake-73630.herokuapp.com/) is a JSON API that consumes several external APIs ([Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/start?utm_source=google&utm_medium=cpc&utm_campaign=FY18-Q2-global-demandgen-paidsearchonnetworkhouseads-cs-maps_contactsal_saf&utm_content=text-ad-none-none-DEV_c-CRE_315916117595-ADGP_Hybrid+%7C+AW+SEM+%7C+BKWS+~+Google+Maps+Geocoding+API-KWID_43700039136946117-aud-581578347266:kwd-300650646186-userloc_9028770&utm_term=KW_google%20geocoding%20api-ST_google+geocoding+api&gclid=CjwKCAjwh472BRAGEiwAvHVfGm8JFeuzbZ2IAX9GgfrJbwGJg4Wol_XqXpX67z1jVEC9pK9yL-SSABoCOX8QAvD_BwE), [Google Geolocation API](https://developers.google.com/maps/documentation/geolocation/intro?utm_source=google&utm_medium=cpc&utm_campaign=FY18-Q2-global-demandgen-paidsearchonnetworkhouseads-cs-maps_contactsal_saf&utm_content=text-ad-none-none-DEV_c-CRE_315916117601-ADGP_Hybrid+%7C+AW+SEM+%7C+BKWS+~+Google+Maps+Geolocation+API-KWID_43700039136946123-aud-581578347266:kwd-300650646226-userloc_9028770&utm_term=KW_google%20geolocation%20api-ST_google+geolocation+api&gclid=CjwKCAjwh472BRAGEiwAvHVfGguoJUzsCpOTbR2bzPCDI2y8EsodBbsf04hATUFHoYLkzLVFKzBp-xoCbV0QAvD_BwE), [Dark Sky API](https://darksky.net/dev), [Unsplash API](https://unsplash.com/documentation)) and aggregates and manipulates data for a user. A visitor can retrieve hourly/daily/weekly forecasts/background image for a city, register as a user and receive a unique API key, log in, and plan a road trip that tells them the estimated travel time to and expected forecast in the destination city.

Sweater Weather returns data for the following five endpoints:

1. Retrieve weather for a city (hourly, daily, and weekly forecasts)
```
GET /api/v1/forecast?location=denver,co
```
2. Retrieve a background image for a city
```
GET /api/v1/backgrounds?location=denver,co
```
3. Register as a user and receive a unique API key in return
```
POST /api/v1/users
```
4. Log in as a user using your unique API key
```
POST /api/v1/sessions
```
5. Get estimated travel time between two cities and the forecast upon arrival in the destination city
```
POST /api/v1/road_trip
```

### Built With
* [Rails](https://guides.rubyonrails.org/)

<!-- GETTING STARTED -->
## Getting Started

To make API calls to the production application, skip to usage. If you'd like to get a local copy up and running, follow these steps.

### Prerequisites

If Ruby is not already installed, install Ruby with the following commands
* ruby
```sh
brew install rbenv
rbenv install 2.4.1
```

If Rails is not already installed, install Rails with the following commands
* rails
```sh
gem install rails
```

### Installation

1. Get API keys from Google Geocoding, Google Geolocation, Dark Sky, and Unsplash. See built with section.

2. Clone the repo
```sh
git clone https://github.com/rlew421/sweater_weather.git
```
3. Install gems
```sh
bundle install
```
4. Install figaro and enter your API keys in `application.yml`
```JS
figaro install
```



<!-- USAGE EXAMPLES -->
## Usage

To make API calls to the [production application](https://floating-lake-73630.herokuapp.com/), skip this command. To make requests in your local environment, start the server with the following command.
```sh
rails s
```

Use Postman to make requests to the API. For the production application, prefix the following requests with
```https://floating-lake-73630.herokuapp.com```. Examples are provided.

1. Retrieve weather for a city (hourly, daily, and weekly forecasts)
```
GET /api/v1/forecast?location=denver,co
```
![Forecast Postman Request](https://user-images.githubusercontent.com/48839191/82380736-33def900-99e6-11ea-8f0a-798b83e2b946.png)

2. Retrieve a background image for a city
```
GET /api/v1/backgrounds?location=denver,co
```
![Image Postman Request](https://user-images.githubusercontent.com/48839191/82380847-6852b500-99e6-11ea-88a6-3eed2af6f2d4.png)

3. Register as a user and receive a unique API key in return. Email, password, and password confirmation must be passed through in request body as shown.
```
POST /api/v1/users
```
![Registration Postman Request](https://user-images.githubusercontent.com/48839191/82381235-11011480-99e7-11ea-8633-59a59d7cb279.png)

4. Log in as a user. Email and password must be passed through in request body as shown.
```
POST /api/v1/sessions
```
![Login Postman Request](https://user-images.githubusercontent.com/48839191/82381534-9c7aa580-99e7-11ea-8af7-abfb4ab950ad.png)

5. Get estimated travel time between two cities and the forecast upon arrival in the destination city. Origin, destination, and API key must be passed in through request body as shown.
```
POST /api/v1/road_trip
```

![Roadtrip Postman Request](https://user-images.githubusercontent.com/48839191/82379091-8cf95d80-99e3-11ea-817d-b54e01b1b036.png)

To make requests locally, replace ```floating-lake-73630.herokuapp.com``` with ```localhost:3000```.


<!-- CONTACT -->
## Contact

Rachel Lew - [LinkedIn](https://www.linkedin.com/in/rachel-ann-lew/) - rlew07@gmail.com


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=flat-square
[contributors-url]: https://github.com/othneildrew/Best-README-Template/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/othneildrew/Best-README-Template.svg?style=flat-square
[forks-url]: https://github.com/othneildrew/Best-README-Template/network/members
[stars-shield]: https://img.shields.io/github/stars/othneildrew/Best-README-Template.svg?style=flat-square
[stars-url]: https://github.com/othneildrew/Best-README-Template/stargazers
[issues-shield]: https://img.shields.io/github/issues/othneildrew/Best-README-Template.svg?style=flat-square
[issues-url]: https://github.com/othneildrew/Best-README-Template/issues
[license-shield]: https://img.shields.io/github/license/othneildrew/Best-README-Template.svg?style=flat-square
[license-url]: https://github.com/othneildrew/Best-README-Template/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=flat-square&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/othneildrew
[product-screenshot]: images/screenshot.png
