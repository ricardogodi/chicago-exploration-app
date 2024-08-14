# Chicago Exploration App

## Overview

The Chicago Exploration App is a Flutter-based mobile application designed to showcase various attractions, restaurants, and sports teams in Chicago. The app features a simple, yet interactive user interface, where users can navigate through different categories using a tabbed layout. Each category displays a list of items with relevant details, such as images, addresses, and interactive buttons for likes and dislikes. This project emphasizes practical application of state management, user interaction, and responsive UI design in Flutter.

## Core Features

- **Tab-Based Navigation**: The app allows users to easily switch between three main categories: Restaurants, Sports Teams, and Attractions, each represented by a dedicated tab.
- **Interactive List Views**: Each tab displays a list of items in a card format. Each card contains an image, title, address, and interactive buttons for thumbs up and thumbs down.
- **State Management**: The app keeps track of user interactions, such as the number of thumbs up or down for each item, and dynamically updates the UI accordingly.
- **User Interaction**: Clicking on an item triggers an alert dialog that displays the name of the selected item. Additionally, a floating action button provides contextual information about the currently viewed tab.

## Files Included

### `main.dart`
- The entry point of the application.
- **MyApp Class**: Initializes the main application with a dark theme and sets up the tab-based navigation.
- **MyStatelessWidget Class**: Defines the main structure of the app, including the tab navigation and content display. It organizes the data for attractions, restaurants, and sports teams.
- **CounterCard Class**: A stateful widget that represents each item in the list. It handles the display of the item’s image, title, address, and interactive buttons. The `CounterCard` widget is responsible for managing the state of likes and dislikes for each item and handling user interactions such as clicks and taps.

### `images/`
- A folder containing the images used in the application:
  - **Attractions**: Images like `zoo.jpg`, `steppenwolf.jpg`, `bean.jpg`, `willis_tower.jpg`, and `navy_pier.jpg`.
  - **Restaurants**: Images like `alinea.jpg`, `girl_and_the_goat.jpg`, `lou_malnatis.jpg`, `purple_pig.jpg`, and `joes_seafood.jpg`.
  - **Sports Teams**: Images like `bulls.jpg`, `bears.jpg`, `cubs.jpg`, `white_sox.jpg`, and `blackhawks.jpg`.

*Note: The full Android Studio project is not included due to size constraints. You must use the provided files and import the code into your own Flutter project to run the app.*

## Screenshots

### Restaurants Tab
- **Description**: Displays a list of popular Chicago restaurants with images, names, and addresses.
- ![Restaurants Tab](images/restaurants_tab.png)

### Sport Teams Tab
- **Description**: Shows Chicago’s major sports teams, including their home venues.
- ![Sport Teams Tab](images/sports_teams_tab.png)

### Attractions Tab
- **Description**: Lists well-known attractions in Chicago with relevant details.
- ![Attractions Tab](images/attractions_tab.png)

### Thumbs Up and Down Demo
- **Description**: Demonstrates the interactive buttons allowing users to like or dislike items.
- ![Thumbs Up and Down Demo](images/thumbs_up_down_demo.png)

### Clicking on an Attraction
- **Description**: An example of the dialog that appears when a user taps on an attraction item.
- ![Clicking on an Attraction](images/clicking_on_attraction.png)
