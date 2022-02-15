import 'package:flutter/material.dart';
import 'package:kopaapp/core/ui/homeViewStatefulWidget.dart';
import 'package:kopaapp/view/homeVerification.dart';
import 'package:kopaapp/view/homeVerification.dart';


void main() => runApp( KopaApp());


class KopaApp extends StatelessWidget {
  const KopaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:  EnterPage(),
    );


  }
}
