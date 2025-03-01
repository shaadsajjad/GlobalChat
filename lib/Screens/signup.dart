import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dashboard.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}
Future<void> createAccount(BuildContext context) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emails.text, password: passs.text);
  } catch (e) {
    SnackBar errorMessage = SnackBar(content: Text(e.toString()));

    ScaffoldMessenger.of(context).showSnackBar(errorMessage);
  }
}
TextEditingController emails=TextEditingController();
TextEditingController name=TextEditingController();
TextEditingController mobile=TextEditingController();

TextEditingController passs=TextEditingController();
var keys=GlobalKey<FormState>();
bool showpass=false;
class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Image.asset("assets/images/logo.png",
          width: 300,),
          Text("Create Account",
            style:TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 40
            ),),
          Form(
              key: keys,
              child:
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: name,
                      validator: (value){
                        if(value==null || value.isEmpty)
                          return "Name cant be empty";
                      },
                      decoration: InputDecoration(
                          hintText: "Enter name"
                      ),
        
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: mobile,
                      validator: (value){
                        if(value==null || value.isEmpty || value.length<11)
                          return "Enter valid mobile number";
                      },
                      decoration: InputDecoration(
                          hintText: "Enter mobile number"
                      ),

                    ),
                    SizedBox(height: 20,),TextFormField(
                      controller: emails,
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
                      controller: passs,
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
                            if(keys.currentState!.validate()){
                              createAccount(context);

                            }
                          }, child: Text("Signup",style: TextStyle(
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
        
                  ],
                ),
              )
          )
        ],
            ),
      ),);
  }
}
