import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:substances_ocr_app/custom_widgets/buttons.dart';
import 'package:substances_ocr_app/custom_widgets/buttons.dart';
import 'package:substances_ocr_app/screens/camera.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // create a dialog "add new substance" function
  createAddDialog(BuildContext context){

    TextEditingController customController = TextEditingController();

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: customController,
            decoration: InputDecoration(
              labelText: "wpisz substancję",
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              elevation: 5.0,
              child: Text(
                "dodaj",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.green[600],
                ),
              ),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  // search bar to implement
//  void _searchPressed() {
//    setState(() {
//      if (this._searchIcon.icon == Icons.search) {
//        this._searchIcon = new Icon(Icons.close);
//        this._appBarTitle = new TextField(
//          controller: _filter,
//          decoration: new InputDecoration(
//              prefixIcon: new Icon(Icons.search),
//              hintText: 'Search...'
//          ),
//        );
//      } else {
//        this._searchIcon = new Icon(Icons.search);
//        this._appBarTitle = new Text('Search Example');
//        filteredNames = names;
//        _filter.clear();
//      }
//    });
//  }

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
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
//              BottomButton(
//                label: "Główna",
//                icon: Icons.home,
//                onPressed: () {},
//              ),
              BottomButton(
                label: "Skanuj",
                icon: Icons.camera_alt,
                onPressed: () {
                  Navigator.pushNamed(context, "/camera");
                },
              ),
              BottomButton(
                  label: "Dodaj",
                  icon: Icons.add,
                  onPressed: () {
                    createAddDialog(context);
                  },
              ),
            ],
          ),
        )
      )
    );
  }
}
