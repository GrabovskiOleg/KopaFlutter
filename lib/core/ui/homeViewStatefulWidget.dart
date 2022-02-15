import 'package:flutter/material.dart';
import 'package:kopaapp/view/phoneAuth.dart';


class EnterPage extends StatefulWidget {

  @override
  _EnterPageState createState() => _EnterPageState();
}


class _EnterPageState extends State<EnterPage> {
  bool siLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  loginWithFB() async{
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.logedIn:
        final token = result.accessToken.token;
        final graphResponse = await htpp.get();
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          isLogeddIn = true;
        });
        break;
    }
  }

  GoogleSignIn googleSignIn = GoogleSignIn(scopes:['email'] );

  loginWithGoogle() async{
    try{
      await googleSignIn.signIn();
      setState(() {
        isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 230, 230, 230),
      body: siLoggedIn ? Navigator() : Conatiner(
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Image(
                image: AssetImage("assets/Logo.png"),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Stack(
                  children: <Widget>[
                    Image(
                        image: AssetImage("assets/Ellipse.png"),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 70, top: 30),
                      child: Text("Вхiд" , style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.only(top: 45),
              child: Row(
                children: <Widget>[
                  PhoneLogin(),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        loginWithFB();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          RawMaterialButton(
                            padding: EdgeInsets.all(31.5),
                            fillColor: Colors.blueAccent,
                            shape: CircleBorder(),
                          ),
                          Image(
                              image: AssetImage("assets/Facebook.png")
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        loginWithGoogle();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                                padding: EdgeInsets.all(32.5),
                                fillColor: Colors.red,
                                shape: CircleBorder(),
                                onPressed: () {  },

                            ),
                            Image(
                                image: AssetImage("assets/google.png"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

         ],
        ),
      ),
    );
  }
}