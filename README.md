# SIMPLE CHAT APP

A new Flutter project.

### Built With

-   [Flutter 3.16.4 (channel stable)](https://docs.flutter.dev/get-started/install)
-   [Java 11.0.17 2022-10-18 LTS](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
-   [Kotlin 1.7.21](https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html)
-   [Swift-driver version 5.9](https://www.swift.org/download/)

Additional Package Used

- [GETX](https://pub.dev/packages/get)

## Getting Started

[Repository link](https://github.com/RIZVY91221/simple_chat_app.git)
<br>
To get a local copy up and running follow these steps.

#### Prerequisites

-   Flutter Sdk version: >=3.2.3 <4.0.0 ,recommended  3.16.4
-   Java version: >=11.0.1 <21.0.1 , recommended 11.0.17
-   Kotlin version: 1.8.22
-   Swift version: 5.9



#### Installation

1. Clone the repo
    ```sh
    ssh: git clone https://github.com/RIZVY91221/simple_chat_app.git
    ```
2. Environment Setup
    - Create `.env` file cp `.env.example` to `.env `
    - Can update flavor `DEV`,`PROD`,`STAGING`
   
3. Install dependencies
     ```sh
    ssh: flutter pub get
    ```
4. Run
    - Connect emulator or real device 
    - `flutter run`
   
5. Start development!

#### Libraries

* [OTA UPDATE](https://pub.dev/packages/shorebird_code_push)

    - Download shorebird
        - For Mac: ```curl --proto '=https' --tlsv1.2 https://raw.githubusercontent.com/shorebirdtech/install/main/install.sh -sSf | bash```
        - For Windows: ```Set-ExecutionPolicy RemoteSigned -scope CurrentUser # Needed to execute remote scripts``` ```iwr -UseBasicParsing 'https://raw.githubusercontent.com/shorebirdtech/install/main/install.ps1'|iex```
    - To start using
      - Login first: ```shorebird login```
      - Generate shorebird.yaml to get an appid: ```shorebird init```
      - See Available Scripts to start push OTA updates!
  

* Custom Lazy Loading with Search and Filter

    - Package Used
        - for lazy loading: [Infinite Scrolling : ^4.0.0](https://pub.dev/packages/infinite_scroll_pagination)
    - To start using
        - refer implementation: ```/test/pagination_test.dart```


#### Available Scripts
- In the project directory, you can run with using flavor:

    `flutter build apk --dart-define=FLAVOR=PROD`

- In project uses `inject` library, If face any conflict run this cmd :

    `flutter packages pub run build_runner build --delete-conflicting-outputs`

- or watch command in order to keep the source code synced automatically: 

     `flutter packages pub run build_runner watch`

- In project create data model using terminal: 

     `flutter packages pub run build_runner build ` or if face any conflict run `flutter packages pub run build_runner build --delete-conflicting-outputs`

- In project on OTA UPDATE using terminal:

    - Publish a Release:
        - android: `shorebird release android`
        - ios: `shorebird release ios-alpha`
    - Push Updates
        - android: `shorebird patch android`
        - ios: `shorebird patch ios-alpha`