import 'package:flutter/material.dart';
import 'package:kopaapp/view/homeVerification.dart';


class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key? key}) : super(key: key) {
    throw UnimplementedError();
  }

  @override
  _PhoneLoginState createState() => _PhoneLoginState();

}
class _PhoneLoginState extends State<PhoneLogin>{
  final TextEditingController _phoneNumberContoller = TextEditingController();

  bool isValid= false;


  Future<Null> validate(StateSetter updateState) async{
    if (_phoneNumberContoller.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      child: RawMaterialButton(
        padding: EdgeInsets.all(23.0),
        fillColor: Colors.green,
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeVerification()),
          );
        },

        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage("assets/Vector.png")
              ),
            ],
          ),
        ),

      ),
    );
  }
}