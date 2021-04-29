import 'package:flutter/material.dart';

void main() {
  runApp(
    //using Material Design System in Flutter
    MaterialApp(
      //state the application state either (development or production ready)
      debugShowCheckedModeBanner: false,
      //Styling the app from the root using the THEME widget
      theme:
          ThemeData(backgroundColor: Colors.grey, primaryColor: Colors.black),
      //Using the scaffold to better build our app by leveraging the available properties
      home: Scaffold(
        //APP bar property for the top
        appBar: AppBar(
          //Title is for presenting the caption
          title: Text(
            "About Me",
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w500),
          ),
          //Using action to present widgets at the right side

          actions: [
            //Using a BUTTON Widget directly
            IconButton(
              icon: Icon(Icons.mail),
              onPressed: () {
                print(
                    "Thank you for reaching out to us with that Business idea. We would get back to you shortly.");
              },
            ),

            // GestureDetector/ InkWell
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 16.0),
              child: GestureDetector(
                onTap: () {
                  print("Thank you for the marketing. We won't pay you o.");
                },
                onDoubleTap: () {
                  print("E don do......");
                },
                child: Icon(Icons.share),
              ),
            )
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
                Container(
                  height: 95,
                  width: 95,
                  padding: EdgeInsets.all(0.0),
                  margin: EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 23,
                        spreadRadius: -3,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                    image: DecorationImage(
                        image: AssetImage("assets/image/userProfile.png"),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Fullname
                      //
                      //this is using the Inline styling and SPAN tags concept of web dev
                      RichText(
                          text: TextSpan(
                              text: "Full Name:",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                              children: [
                            TextSpan(
                              text: " Taiwo Adisa Joshua",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            )
                          ])),
                      SizedBox(height: 6),
                      //Contact Info
                      //
                      //TODO! Question for tomorrows class  Let the contact info be a caption and the value or your contacts details be SUBJECt following the above design
                      Text(
                        "Contact Info: 08122222222, gbasgbos@gbasgbos.comma",
                      ),
                    ],
                  ),
                )
              ],
            ),
            //#endRegion
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
