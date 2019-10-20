import 'package:flutter/material.dart';
import 'main.dart';
import 'signup.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
        home:new MyHomePage()
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class Carousel{
  String path;
  String Descritption;
  String Title;
}

class _MyHomePageState extends State<MyHomePage> {

  int photoIndex = 0;
  List<String> photos = [
    'assets/girl1.gif',
    'assets/girl2.gif',
    'assets/car2.jpg'
  ];

  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        backgroundColor: Colors.red,
        title:new Text('HealthCare'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color:Colors.white,
              ), onPressed:(){}
          ),
          new IconButton(icon: Icon(Icons.shopping_cart,color:Colors.white,), onPressed:(){})
        ],
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text('Shakira'),
                accountEmail: Text('shakira@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white,),
                  ),
                ),
                decoration: new BoxDecoration(
                    color: Colors.blueAccent
                )
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Homepage'),
                leading: Icon(Icons.home,color: Colors.greenAccent,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.deepPurple,),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite,color: Colors.green,),
              ),
            ),

            Divider(),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.red),
              ),
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.blueAccent,),
              ),
            ),
          ],
        ),
      ),



      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    image:DecorationImage(
                      image:AssetImage(photos[photoIndex]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 400.0,
                  width: 500.0,
                ),

                Positioned(
                  top: 375.0,
                  left: 25.0,
                  right: 25.0,
                  child: SelectedPhoto(numberOfDots: photos.length, photoIndex: photoIndex),
                ),
                //Text(
                // 'Hey good morning sunshineee!!! Get ready to get fit',

                //),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('Prev'),
                onPressed: _previousImage,
                elevation: 5.0,
                color: Colors.blue,
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                child: Text('Next'),
                onPressed: _nextImage,
                elevation: 5.0,
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {

  final int numberOfDots;
  final int photoIndex;

  SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
        child: new Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          child: Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(4.0)
            ),
          ),
        )
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0.0,
                    blurRadius: 2.0
                )
              ]
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for(int i = 0; i< numberOfDots; ++i) {
      dots.add(
          i == photoIndex ? _activePhoto(): _inactivePhoto()
      );
    }

    return dots;
  }


  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
