import 'package:flutter/material.dart';

import 'home_scree.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed( const Duration(seconds: 5),() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context){
        return const HomeScreen();
      }));
    },);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         AnimatedContainer(
           margin: EdgeInsets.only(left: 40),
             height: 300,
             width: 300,
             duration: const Duration(seconds: 5),
           child: Center(child: Image.asset('assets/image1.png')),
         ),
          Padding(
            padding:  EdgeInsets.only(left: 25.0),
            child: Text('Coivid 19 Information ',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),),
          )
        ],
      ),
    );
  }
}
