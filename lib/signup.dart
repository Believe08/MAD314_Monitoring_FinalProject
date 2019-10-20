import 'package:flutter/material.dart';
import 'mainPage.dart';
import 'main.dart';

void main() => runApp(SignUp());

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img1.jpg'),
                fit: BoxFit.cover,
              )
          ),
          padding: EdgeInsets.only(
              top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("SIGN UP",
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Theme
                          .of(context)
                          .primaryColor
                  ),
                ),
                SizedBox(height: 40.0),
                buildTextField("First Name:"),
                SizedBox(height: 20.0),
                buildTextField("Last Name:"),
                SizedBox(height: 20.0),
                buildTextField("Email address"),
                SizedBox(height: 20.0,),
                buildTextField("Password(8+ caracters)"),
                SizedBox(height: 20.0,),
                buildTextField("Confirm Password"),
                SizedBox(height: 20.0,),
                buildButtonContainer(context),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account?" ,
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 20.0,width: 10.0,),
                        InkWell(
                          child: Text("Login", style: TextStyle(color: Colors.red,
                            fontWeight: FontWeight.bold,)
                          ),
                          onTap: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder: (context) => LoginPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          )
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
          prefixIcon: hintText == "First Name:" ? Icon(Icons.person) : Icon(
              Icons.person),
          suffixIcon: hintText == "Password:" ? IconButton(
            onPressed: () {},
            icon: Icon(Icons.visibility_off),
          ) : null
      ),
    );
  }

}


Widget buildButtonContainer(BuildContext _context){
  return
    InkWell(child: Container(
      height: 56.0,
      width: MediaQuery.of(_context).size.width,
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
          "SIGN UP",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
          ),
        ),
      ),
    ),
      onTap: (){
        //Navigator.of(context).canPop();
        Navigator.of(_context).push(new MaterialPageRoute(builder: (_context) => MyHomePage())); // After SignUp -> GoTo Some Page instead of login as of now I kept login
      },
    );
}







