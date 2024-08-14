/// Project 2: Chicago Exploration App
///
/// Ricardo Gonzalez
///
/// A basic app to navigate through Chicago's attractions,
/// restaurants, and sports teams using tabs and cards.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'CS 378 - Project 2';
  
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: _title,
      theme: ThemeData.dark(),
      home: MyStatelessWidget(),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  // list of data representing attractions in Chicago
  static const List<Map<String, String>> attractions = [
    {
      'name': 'Chicago Zoo',
      'imagePath': 'images/zoo.jpg',
      'address': '123 Zoo St, Chicago, IL'
    },
    {
      'name': 'Steppenwolf Theatre',
      'imagePath': 'images/steppenwolf.jpg',
      'address': '1650 N Halsted St, Chicago, IL'
    },
    {
      'name': 'The Bean',
      'imagePath': 'images/bean.jpg',
      'address': '201 E Randolph St, Chicago, IL 60602'
    },
    {
      'name': 'Willis Tower',
      'imagePath': 'images/willis_tower.jpg',
      'address': '233 S Wacker Dr, Chicago, IL 60606'
    },
    {
      'name': 'Navy Pier',
      'imagePath': 'images/navy_pier.jpg',
      'address': '600 E Grand Ave, Chicago, IL 60611'
    }
  ];

  // list of data representing restaurants in Chicago
  static const List<Map<String, String>> restaurants = [
    {
      'name': 'Alinea',
      'imagePath': 'images/alinea.jpg',
      'address': '1723 N Halsted St, Chicago, IL 60614'
    },
    {
      'name': 'Girl & the Goat',
      'imagePath': 'images/girl_and_the_goat.jpg',
      'address': '809 W Randolph St, Chicago, IL 60607'
    },
    {
      'name': 'Lou Malnati’s Pizzeria',
      'imagePath': 'images/lou_malnatis.jpg',
      'address': '439 N Wells St, Chicago, IL 60654'
    },
    {
      'name': 'The Purple Pig',
      'imagePath': 'images/purple_pig.jpg',
      'address': '444 N Michigan Ave, Chicago, IL 60611'
    },
    {
      'name': 'Joe’s Seafood, Prime Steak & Stone Crab',
      'imagePath': 'images/joes_seafood.jpg',
      'address': '60 E Grand Ave, Chicago, IL 60611'
    }
  ];

  // list of data representing sport teams in Chicago
  static const List<Map<String, String>> sportTeams = [
    {
      'name': 'Chicago Bulls',
      'imagePath': 'images/bulls.jpg',
      'address': 'United Center, 1901 W Madison St, Chicago, IL 60612'
    },
    {
      'name': 'Chicago Bears',
      'imagePath': 'images/bears.jpg',
      'address': 'Soldier Field, 1410 Museum Campus Dr, Chicago, IL 60605'
    },
    {
      'name': 'Chicago Cubs',
      'imagePath': 'images/cubs.jpg',
      'address': 'Wrigley Field, 1060 W Addison St, Chicago, IL 60613'
    },
    {
      'name': 'Chicago White Sox',
      'imagePath': 'images/white_sox.jpg',
      'address': 'Guaranteed Rate Field, 333 W 35th St, Chicago, IL 60616'
    },
    {
      'name': 'Chicago Blackhawks',
      'imagePath': 'images/blackhawks.jpg',
      'address': 'United Center, 1901 W Madison St, Chicago, IL 60612'
    }
  ];

  // This method returns the main UI of the widget
  @override
  Widget build(BuildContext context) {

    // Using DefaultTabController to provide tab-based navigation
    return DefaultTabController(
      initialIndex: 2, // The tab to display initially when the widget is first created
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar( //top app bar (header)
          title: const Text('Explore Chicago'), // title of the app bar
          centerTitle: true,
          bottom: const TabBar( // The list of tabs situated at the bottom of the app bar
            tabs: <Widget>[
              Tab(text: 'Restaurants'),
              Tab(text: 'Sport Teams'),
              Tab(text: 'Attractions'),
            ],
          ),
        ),
        // The main content of the scaffold based on the selected tab
        body: TabBarView(
          children: <Widget>[
            ListView.builder( // A list of restaurants
              itemCount: restaurants.length,
              itemBuilder: (BuildContext context, int index) {
                // Returns a card for each restaurant
                return CounterCard(data: restaurants[index]);
              },
            ),
            ListView.builder( // A list of sports teams
              itemCount: sportTeams.length,
              itemBuilder: (BuildContext context, int index) {
                // Returns a card for each sports team
                return CounterCard(data: sportTeams[index]);
              },
            ),
            ListView.builder( // A list of attractions
              itemCount: attractions.length,
              itemBuilder: (BuildContext context, int index) {
                // Returns a card for each attraction.
                return CounterCard(data: attractions[index]);
              },
            )
          ],
        ),
        // A floating action button (FAB) to display info about the currently viewed tab
        floatingActionButton: Builder(
          builder: (BuildContext context) {
            return FloatingActionButton(
              child: Icon(Icons.info_outline), // The icon inside the FAB
              onPressed: () { // The action to be performed when the FAB is pressed
                int tabIndex = DefaultTabController.of(context)!.index; // gets the currently selected tab's index
                String tabName;
                // Determines the name of the tab based on its index.
                switch(tabIndex) {
                  case 0: tabName = "Restaurants"; break;
                  case 1: tabName = "Sport Teams"; break;
                  case 2: tabName = "Attractions"; break;
                  default: tabName = "Unknown"; break;
                }
                // Displays a snackbar with the name of the currently viewed tab.
                final snackBar = SnackBar(
                  content: Text('Currently viewing $tabName'),
                  action: SnackBarAction(
                    label: 'Dismiss',
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Hides the snackbar.
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}

// A widget to represent an item with thumbs up and down count
class CounterCard extends StatefulWidget {
  // The data for the card: name, image, and address
  final Map<String, String?> data;

  // Constructor
  CounterCard({required this.data});

  // Creating the mutable state for this widget
  @override
  _CounterCardState createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  int thumbsUpCount = 0;
  int thumbsDownCount = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      // Styling the card with rounded corners
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      // Margin around the card
      margin: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        child: Column(
          children: [
            // Display the name of the item
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                widget.data['name']!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            // Tappable area to show a dialog

            // I initially considered using ListTile (instead of InkWell) for its built-in onTap functionality.
            // However, a ListTile would not let me place the thumbs on the bottom right position of each card.
            // Therefore I decided to opt for a Column widget instead. This change led to the challenge
            // of losing the onTap functionality that ListTile offers. To address this, I incorporated InkWell,
            // provided with the functionality of onTap()
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('You clicked on ${widget.data['name']}'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () { // Close the dialog.
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Image.asset(widget.data['imagePath']!, width: 100, height: 100), // display the image from the data
                    SizedBox(width: 10.0),  // for the space between image and address
                    Expanded(  // display the address. If it's long, it will truncate with ellipsis
                      child: Text(
                        widget.data['address']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton( // thumbs up button and its count
                              icon: const Icon(Icons.thumb_up),
                              onPressed: () {
                                setState(() {   // increment thumbsUpCount.
                                  thumbsUpCount++;
                                });
                              },
                            ),
                            Text("$thumbsUpCount"),
                            IconButton( // thumbs down button and its count
                              icon: const Icon(Icons.thumb_down),
                              onPressed: () {
                                // increment thumbsDownCount
                                setState(() {
                                  thumbsDownCount++;
                                });
                              },
                            ),
                            Text("$thumbsDownCount"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
