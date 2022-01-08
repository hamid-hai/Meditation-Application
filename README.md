# The Meditation App - Android

The Meditation App is a clean, easy to use Android app, which is designed to help users keep track of how they're feeling during different days and have the ability to listen to a range of calming, relaxing sounds.




## Features

- Secure login using Firebase
- Ability to store and view records on moods with Date and Time
- Listen to a range of relaxing ambient sounds
- Learn and contact different support organisations within the UK


## Tech Stack

### Front-end
- [Dart](https://dart.dev/) - A language created by Google that is easy to pickup and learn with many handy
  features that make coding for Android and iOS easy. Used due to the fact that it is bundled with the Flutter Framework.
- [Flutter](https://flutter.dev/) - A Framework created by Google created with Dart that allows the app development process with UI building tools to come from a single codebase for Android and iOS.
  Using Flutter allows for quick UI building within an app that would take much longer with the standard languages used for Android and iOS whilist building for both platforms.

### Back-end

- [Firebase Authentication](https://firebase.google.com/docs/auth) - Using Firebase Authentication meant that it was very easy and secure to implement sign in and can implent other sign-in methods in the future all from firebase. I can see who has signed up and all infomation is stored securly on Google Cloud servers.
- [Firebase Firestore](https://firebase.google.com/docs/firestore) - This is the NoSQL Database provided by Firebase, it is used to store the mood log data of signed in users. Data is secure as it is all stored with random ID's to prevent anyone from finding out who is submitting each document and is stored on Google Cloud Servers. Implementation is much easier than a standard SQL database, lightens the app size and provides a cloud backup of data.

### Libaries / Dependencies

- [firebase_auth](https://pub.dev/packages/firebase_auth) - Provides Firebase Authentication functionaility to Flutter.
- [cloud_firestore](https://pub.dev/packages/cloud_firestore) - Provides Firebase Firestore functionaility to Flutter.
- [dio](https://pub.dev/packages/dio) - Dio is a smart HTTP caller for Flutter, it was used to call the Daily Quote API on the User Dashboard.
- [audioplayers](https://pub.dev/packages/audioplayers) - Used to play network audio files on the Ambient Noises screen.
- [url_launcher](https://pub.dev/packages/url_launcher) - Used to provide quick access to resources on support pages such as numbers and websites.
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter) - Google Maps implentation within Support Pages showing where local services.
- [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) - Used to provide loading animaitons when the user is waiting for a task to complete.
- [provider](https://pub.dev/packages/provider) - Is used to determine what screen to show depending on the sign-in state of a user.




## Requirements

###Functional requirements

-	A way of logging a mood log of how you have been feeling on a particular day - MVP
-	The ability to look back on days to see how you are feeling on the said day - MVP
-	Ability to play audio containing a range of ambient sounds such as rain, wind and storms and have the ability for the sounds to be played in the background. - MVP
-	The app should utilise a mapping platform (Google/Apple Maps) to display businesses and companies that could benefit the user
-	Ability for the user to create a new account using a signup form using email and password and have it logged within an database. - MVP
-	Ability for a user to login using credentials to their own dashboard. – MVP
-	Contains a list of external resources with different contact methods for users and contain a description of what the said resources are for. - MVP
-	External Resources should have links to website, SMS and phone calls for quick access.
-	The app should have a 99% uptime to ensure the user is almost always able to access the app at any time as long as they have an internet connection (login, form submission). 
-	The app should contain three sections once signed in (Ambient Sounds, Mood Board, Extra Support). – MVP

### Non-functional requirements

-	The app needs to have a clean and simple layout to ensure that there are no complicated designs within the app preventing the user from meeting their needs. - MVP
-	Security must be held to a high standard with sensitive data being stored within the application regarding mood boards.
-	The ability to display inspirational quotes from the internet - MVP
-	The app should have a small response time between requests through the server and the app to ensure the user is not waiting long periods of time after sending data requests to the server (e.g. send a mood report). 
-	The app should be able to handle multiple requests at one given time which ensures that the app is scalable to a certain extent. 
-	The app needs to have a high level of accessibility ensuring that on-screen dialogue is readable by a screen reader (Voiceover/Talkback).
-	Ability to play audio files in the background – MVP

### Data requirements

-	Database table with records containing login information coming from registration that can be used to sign in (email and password). – MVP
-	A database with records containing mood log records with fields regarding date/time and the mood at that date/time. -  MVP


## Installation

### Dart / Flutter

Dart as a language comes bundled with the Flutter SDK. This means only Flutter needs
be installed to use the Dart language and the Flutter Framework.

[Click here to find instructions to install Flutter on your OS
(Windows, MacOS, Linux, ChromeOS)](https://docs.flutter.dev/get-started/install)

### Cloning the Repo

Clone the repo using HTML witin Android Studio or Git

```http
  git@git.cardiff.ac.uk:c1935888/meditationapp.git
```

![Android Studio Installation](https://i.imgur.com/qyPizqR.png)

Once the project has imported into Android Studio successfully

Perform the command below to update the project with the latest version of the
libaries/dependeicies

```bash
  flutter pub get
```
### Running The Meditation App

Either connect an Android Device with USB Debugging enabled. [More infomation](https://developer.android.com/studio/run/device)

Or run a local emulator within Android Studio within the AVD Manager [More infomation](https://developer.android.com/studio/run/managing-avds)

- Testing was done with a Pixel 5 (Emulation) on Android 8.1 API 27.

- Certain features such as Dark Mode (Following System Defaults) require Android 10 API 29.

**Make sure the selected device is running before starting the application on Android Studio**

### SDK Configuation

If no Dart SDK is found, please configure it within Android Studio settings please follow these steps

- Go to File -> Settings -> Language & Framework -> Flutter

- Choose Dart's SDK path (This should lead to where you installed Flutter earlier)
  - Within the Flutter directory the SDK is located under 'bin\cache\dart-sdk'

- Press apply and OK. 

### Building the project

Click run within Android Studio, this will build the project and display the login screen (if not signed in) on the chosen device.

**Please note the build may fail the first time, building the project a second time usually fixes this issue**

![Running the application](https://i.imgur.com/UHqXVhX.png)

## FAQ

#### How do I enable Dark Mode?

The Meditation App follows the system defaults for Dark Mode. This means you'll need a device with **Android 10 or above**.

#### How come I can't, sign in/reigster, hear any audio or submit/view mood data.

The Meditation App requires an active internet connection to perform certain functions wihtin the app.

#### How do I sign up?

The Meditation App currently only supports Email and Password sign up. Using services such as 'Sign in with Google' and 'Sign in with Apple'
require developer accounts which are not available at this time.


## Screenshots

![App Screenshot](https://i.imgur.com/KfwLn00.png)

![App Screenshot](https://i.imgur.com/29tlPe7.png)

![App Screenshot](https://i.imgur.com/1OuZfy4.png)

![App Screenshot](https://i.imgur.com/WiQCD5j.png)

![App Screenshot](https://i.imgur.com/yxeKDAp.png)

![App Screenshot](https://i.imgur.com/JwktnGu.png)

