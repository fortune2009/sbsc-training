import 'package:flutter/material.dart';

void main() {
  runApp(
    //using Material Design System in Flutter
    MaterialApp(
      //Using the scaffold to better build our app by leveraging the available properties
      home: Scaffold(
        //APP bar property for the top
        appBar: AppBar(
          //Title is for presenting the caption
          title: Text("About Me"),
          //Using action to present widgets at the right side

          actions: [
            Icon(Icons.mail),
            Icon(Icons.share),
          ],
        ),
        //body: this is for holding or displaying the primary content of the scaffold
        body: Column(
          //presenting widgets vertically
          children: [
            //This is the top segment of the content in our Body widget
            Row(
              children: [
                //For showing images in the application
                //Step 1) Add the assets to the application folder
                //Step 2) Register the assets(eg Image) in the pubspec.yaml
                //Step 3) Use the asset in the appropriate place (eg Image asset)
                Image.asset(
                  "assets/image/userProfile.png",
                  height: 90,
                  width: 90,
                ),
                Column(
                  children: [
                    //Fullname
                    Text("Full Name"),
                    //Contact Info
                    Text("Contact Info"),
                  ],
                )
              ],
            ),
            Divider(
              color: Colors.black,
              height: 4.0,
            ),
            Container(
              child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum"),
            ),
            ElevatedButton(
              child: Text('Let\'s Talk'),
              onPressed: () {},
            )
          ],
        ),
      ),
    ),
  );
}
