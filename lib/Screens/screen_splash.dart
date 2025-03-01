import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/Screens/dashboard.dart';
import 'package:globalchat/Screens/login.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  var user=FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5),(){
     //  if(user==null)
     // openLogin();
     //  else
     //    openDashboard();
      openLogin();
    });
  }
  void openLogin(){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Login();
    }));
  }

  void openDashboard(){
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
      return Dashboard();
    }),(route){
      return false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/logo.png"),
          Text("Global Chats",
          style: TextStyle(
     //       fontFamily: Poppins,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),)

        ],
      ),
    );
  }
}
