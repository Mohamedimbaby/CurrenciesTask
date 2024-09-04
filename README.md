
# CurrenciesConverter

A brief description of what this project does and who it's for

Currencies Coverter App
Welcome to the Currencies Coverter App! This app allows users to demonstrate all countries and its currencies information regarding to EGP or the egypt currency. The app includes details about if user need a converter between currencies and also has a theming feature and locale for english and arabic speakers.

Features
Currencies list : review all countries and their currencies .
Currencies Converter: convert between currencies and their prices smoothly.
Theming Modes: you can review the app with your likely theme either its dark / light 
Localization swith : choose you comfort language between English / arabic
Offline flow : we working with offline first flow which means that we getting the data from remote source first then save it in our local storage 


# Packages and plugins requests 

- https://pub.dev/packages/build_runner -> for generate a code 
- https://pub.dev/packages/flutter_bloc -> for state management 
- https://pub.dev/packages/shared_preferences -> for saving choosen theme and language
- https://pub.dev/packages/sqflite -> for saving data localley 
- https://pub.dev/packages/json_serializable -> serializing responses 
- https://pub.dev/packages/dio -> for fetching api data  
- https://pub.dev/packages/injectable -> for dependency inversion 

# Installation
To run this app locally, follow these steps:


# Requirements
Flutter SDK: Ensure you have Flutter SDK version 3.22.2 installed. You can download it from the official Flutter website.
Usage

# Project Structure
The project structure is organized as follows:

main.dart: The entry point of the application.
we work with feature first style
feature ->
presentation/: Contains the main screens of the app (search and details).
domain/: contains app usecase and upper layer repositories.
data/: Contains services for fetching weather data.



#Screen shots

Contributing![Screenshot_1725448804](https://github.com/user-attachments/assets/c5b4717c-ca52-4f42-8270-73e553bebdfb)
![Screenshot_1725434426](https://github.com/user-attachments/assets/eef38d01-99e2-4b12-8870-93b9521b09ad)
![Screenshot_1725434418](https://github.com/user-attachments/assets/1be67c18-c77a-405b-a62d-862773fff8a0)
![Screenshot_1725434415](https://github.com/user-attachments/assets/a8aceca5-cf9e-4d24-a732-e768ca1b1685)
![Screenshot_1725434412](https://github.com/user-attachments/assets/93a96a68-895b-4aed-aee6-68e765c0e3e2)

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Make sure to follow the code style and include appropriate tests.



Contact
If you have any questions or feedback, feel free to reach out to me at Mohamedimbaby999@gmail.com.
## API Reference
BASE_URL = https://api.currencyapi.com/v3/
#### Get currencies prices regarding to egp
```http
  GET historical?apikey=YOUR_API_KEY&currencies=&base_currency=EGP&date="YYYY-mm-DD"
```
