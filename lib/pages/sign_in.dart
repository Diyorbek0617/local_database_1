import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:local_database_1/pages/sign_up.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);
  static final String id="sign_in";

  @override
  _Sign_inState createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {

  var username_controller=TextEditingController();
  var password_controller=TextEditingController();
 _doSign_in(){
   String username=username_controller.text.toString().trim();
   String password=password_controller.text.toString().trim();

   var box = Hive.box("pdp online");
   box.put("username", username);
   box.put("password", password);

   String user_name=box.get("username");
   String user_password=box.get("password");
   showAboutDialog(context: context,
   applicationName: "User information",
   children: [
     Row(
       children: [
         Text("Name"),
         SizedBox(
           width: 4,
         ),
         Text(user_name,style: TextStyle(color: Colors.blue),),
       ],
     ),
     SizedBox(height: 2,),
     Row(
       children: [
         Text("Password"),
         SizedBox(
           width: 4,
         ),
         Text(password,style: TextStyle(color: Colors.blue),),
       ],
     ),
   ],
   );
   print(user_name);
   print(user_password);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black54,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo.withAlpha(20),
            borderRadius: BorderRadius.circular(15),
          ),
         //Color.fromRGBO(26, 21, 71, 255),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              // user image
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image:AssetImage("assets/images/man_fon.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              // title
              Text("Welcome Back!",style: TextStyle(color: Colors.white70,fontSize: 25),),
              SizedBox(height: 5,),
              Text("Sign in to continue",style: TextStyle(color: Colors.white54,fontSize: 13),),
              SizedBox(height: 40,),
              TextField(
                controller: username_controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline,color: Colors.grey,),
                  hintText: "User name",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(color: Colors.white,),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey.shade900,
              ),
              SizedBox(height: 30,),
              TextField(
                controller: password_controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_open_outlined,color: Colors.grey,),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(color: Colors.white,),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: Colors.grey.shade900,
              ),
              SizedBox(height: 30,),
              Text("Forgot Password?",style: TextStyle(color: Colors.grey.shade700,fontSize: 14),),
              SizedBox(height: 35,),
              GestureDetector(
                onTap: (){
                  _doSign_in();
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade900,
                  ),
                  child:
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          colors: [

                            Colors.blue.shade900.withOpacity(0.1),
                            Colors.blue.shade700.withOpacity(0.2),
                            Colors.blue.shade700.withOpacity(0.3),
                            Colors.blue.shade700.withOpacity(0.4),
                            Colors.blueAccent.shade100.withOpacity(0.42),
                            Colors.blueAccent.shade100.withOpacity(0.4),

                          ]
                      ),
                    ),
                    child:
                    Center(
                      child: Icon(Icons.arrow_forward,color: Colors.white,size: 25,),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don`t have an account?",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  SizedBox(width: 8,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, Sign_up.id);
                    },
                    child: Text("SIGN UP",style: TextStyle(
                      color: Colors.blue,fontSize: 14,
                    ),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
