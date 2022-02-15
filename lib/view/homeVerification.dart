import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart ';
import 'package:firebase_core/firebase_core.dart';



class HomeVerification extends StatefulWidget {
  const HomeVerification({Key? key}) : super(key: key);

  void initFirebase() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  @override
  _HomeVerificationState createState() => _HomeVerificationState();


}

class _HomeVerificationState extends State<HomeVerification> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  bool isValid = false;

  get state => null;

  Future<Null> validate (StateSetter updateState) async{
    if (_phoneNumberController.text.length == 10) {
      updateState((){
        isValid = true;
      });
    }
  }

  @override
  Widget bulid(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 229, 229, 229),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.topCenter,
        child: Column(
          children:  [
            Image(
              image: AssetImage("assets/Logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/Ellips.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, top: 30),
                        child: Text("Вхiд",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ]
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _phoneNumberController,
                autofocus: true,
                onChanged: (text) {
                  validate(state);
                },
                decoration: new InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}