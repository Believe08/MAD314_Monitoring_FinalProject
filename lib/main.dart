import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'signup.dart';
import 'mainPage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => SignUp()
      },
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/car1.jpg'),
              fit: BoxFit.cover,
            )
        ),
        padding: EdgeInsets.only(
            top: 150.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("LOGIN",
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 40.0),
            buildTextField("Email:"),
            SizedBox(height: 20.0),
            buildTextField("Password:"),
            SizedBox(height: 20.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            SizedBox(height: 30.0,),
            buildButtonContainer(context),
            //InkWell(
                //onTap: () {
               //   Navigator.of(context).pushNamed('/signup');
               // }
            //),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?" ,
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.0,width: 10.0,),
                    InkWell(
                      child: Text("SIGN UP", style: TextStyle(color: Colors.red,
                        fontWeight: FontWeight.bold,)
                      ),
                      onTap: (){
                        Navigator.of(context).push(new MaterialPageRoute(builder: (context) => SignUp()));
                      },
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

  Widget buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: hintText == "Email:" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: hintText == "Password:" ? IconButton(
            onPressed: (){},
            icon: Icon(Icons.visibility_off),
          ) : null
      ),
    );
  }

  Widget buildButtonContainer(BuildContext context){
    return
      InkWell(child: Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.lightBlue,
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft
          ),
        ),
        child: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
            ),
          ),
        ),
      ),
        onTap: (){
          Navigator.of(context).push(new MaterialPageRoute(builder: (context) => MyHomePage()));
        },);
  }


}







