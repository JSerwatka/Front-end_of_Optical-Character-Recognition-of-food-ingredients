import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:substances_ocr_app/custom_widgets/buttons.dart';
import 'package:substances_ocr_app/classes/image_capture.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Icon _customSearchIcon = Icon(
      Icons.search,
      color: Colors.grey[700],
  );
  Widget _customSearchBar = Text(
      "OCR Substances",
      style: TextStyle(
        color: Colors.grey[800],
      )
  );
  ImageCaptureState capturedImage = ImageCaptureState();

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
                  color: Colors.green[500],
                ),
              ),
              onPressed: () {
              },
            ),
          ],
        );
      },
    );
  }

  // Basic search bar without connection to db
  void _searchPressed() {
    setState(() {
      if (this._customSearchIcon.icon == Icons.search) {
        this._customSearchIcon = Icon(Icons.close, color: Colors.grey[700]);
        this._customSearchBar = TextField(
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Wyszukaj...'
          ),
        );
      } else {
        this._customSearchIcon = Icon(Icons.search, color: Colors.grey[700]);
        this._customSearchBar = Text(
          "OCR Substances",
          style: TextStyle(
          color: Colors.grey[800],
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      // ---- head ----
      appBar: AppBar(
        // title
        title: _customSearchBar,
        backgroundColor: Colors.lightBlue[100],
        centerTitle: true,
        //settings icon
        leading: IconButton(
          icon: Icon(
            Icons.view_headline,
            color: Colors.grey[700],
          ),
          onPressed: () =>_scaffoldKey.currentState.openDrawer(),
        ),
        // search icon
        actions: <Widget>[
          IconButton(
            icon: this._customSearchIcon,
            onPressed: () {
              _searchPressed();
            },
          ),
        ],
      ),
        // ----- body -----
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/products.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
      ),
      // ----- drawer -----
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
              ),
              child: Center(
                child: Text(
                  'xddd',
                  style: TextStyle(
                    color: Colors.black,
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
              BottomButton(
                label: "Skanuj",
                icon: Icons.camera_alt,
                onPressed: () async {
                  await capturedImage.pickAndCropImage(ImageSource.camera);
                  if (capturedImage.imageToSend != null) {
                    Navigator.pushNamed(
                        context, "/camera", arguments: capturedImage.imageToSend);
                  }
                },
              ),
              BottomButton(
                label: "Wybierz",
                icon: Icons.insert_photo,
                onPressed: () async {
                  await capturedImage.pickAndCropImage(ImageSource.gallery);
                  if (capturedImage.imageToSend != null){
                    Navigator.pushNamed(
                        context, "/camera", arguments: capturedImage.imageToSend);
                  }
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
