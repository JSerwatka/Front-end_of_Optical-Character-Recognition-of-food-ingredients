import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      // ---- head ----
      appBar: AppBar(
        // title
        title: Text("OCR Substances"),
        backgroundColor: Colors.lightBlue[700],
        centerTitle: true,
        //settings icon
        leading: IconButton(
            onPressed: () =>_scaffoldKey.currentState.openDrawer(),
            icon: Icon(
              Icons.view_headline,
              color: Colors.grey[300],
            ),
        ),
        // search icon
        actions: <Widget>[
          IconButton(
              onPressed: () {
                print('search pressed');
              },
              icon: Icon(
                Icons.search,
                color: Colors.grey[300],
              ),
          ),
        ],
      ),
      // ----- drawer -----
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'TEST',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Historia'),
              onTap: () {
                print("history pressed");
//                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.mail_outline),
              title: Text('Kontakt'),
              onTap: () {
                print("contacts pressed");
//                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // ---- bottom ----
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[100],
        fixedColor: Colors.teal,
          items: [
            BottomNavigationBarItem(
              title: Text("Główna"),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text("Skanuj"),
              icon: Icon(Icons.camera_alt),
            ),
            BottomNavigationBarItem(
              title: Text("Dodaj"),
              icon: Icon(Icons.add),
            ),
          ]
      ),
    );
  }
}
