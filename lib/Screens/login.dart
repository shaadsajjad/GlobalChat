import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:globalchat/Screens/dashboard.dart';
import 'package:globalchat/Screens/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}
Future<void> login(BuildContext context) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text, password: pass.text);
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
      return Dashboard();
    }), (route){
      return false;
    });
  } catch (e) {
    SnackBar errorMessage = SnackBar(content: Text(e.toString()));

    ScaffoldMessenger.of(context).showSnackBar(errorMessage);
  }
}
TextEditingController email=TextEditingController();

TextEditingController pass=TextEditingController();
var key=GlobalKey<FormState>();
bool showpass=false;
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/logo.png"),
            Text("Login",
              style:TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40
              ),),
            Form(
                key: key,
                child:
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    validator: (value){
                      if(value==null || value.isEmpty)
                        return "please enter a valid email";
                    },
                    decoration: InputDecoration(
                      hintText: "Enter email"
                    ),
        
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    obscureText: showpass?false:true,
                    controller: pass,
                    validator: (value){
                      if(value==null || value.isEmpty)
                        return "please enter a valid password";
                    },
                    decoration: InputDecoration(
        
        
                      hintText: "Enter password",
                      suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              showpass=!showpass;
                            });
                            print(showpass);
                          },
                          child: showpass?Icon(Icons.visibility_off) :Icon(Icons.visibility))
                    ),
        
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(onPressed: (){
                          if(key.currentState!.validate()){
                           login(context);
                          }
                        }, child: Text("Login",style: TextStyle(
                          fontSize: 20,
                          color: Colors.black
                        ),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:Colors.blue[500]
                          )
        
                        ),
                      ),
        
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Doesnot have an account?"),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context){
                            return Signup();
                          }));
                        },
                        child: Text("Signup",
                        style: TextStyle(
                          color: Colors.blue[500],
                          fontSize: 18
                        ),),
                      )
                    ],
                  )
                ],
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
