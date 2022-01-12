import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_database_1/pages/sign_in.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);
 static final String id="sign_up";
  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {

  var username_controller=TextEditingController();
  var email_controller=TextEditingController();
  var phone_controller=TextEditingController();
  var password_controller=TextEditingController();
  _doSign_up(){
    String username=username_controller.text.toString().trim();
    String password=password_controller.text.toString().trim();
    String email=email_controller.text.toString().trim();
    String phone_number=phone_controller.text.toString().trim();
    var box = Hive.box("pdp online");
    box.put("username", username);
    box.put("email", email);
    box.put("phone_number", phone_number);
    box.put("password", password);

    String user_name=box.get("username");
    String user_email=box.get("email");
    String user_phone=box.get("phone_number");
    String user_password=box.get("password");
    showAboutDialog(context: context,
      applicationName: "Account informtion",
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
            Text("E-mail"),
            SizedBox(
              width: 4,
            ),
            Text(email,style: TextStyle(color: Colors.blue),),
          ],
        ),
        SizedBox(height: 2,),
        Row(
          children: [
            Text("Phone number"),
            SizedBox(
              width: 4,
            ),
            Text(phone_number,style: TextStyle(color: Colors.blue),),
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
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              // title
              Text("Create",style: TextStyle(color: Colors.white70,fontSize: 25),),
              SizedBox(height: 5,),
              Text("Account",style: TextStyle(color: Colors.white70,fontSize: 25),),
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
              SizedBox(height: 20,),
              TextField(
                controller: email_controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,),
                  hintText: "E-Mail",
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
              SizedBox(height: 20,),
              TextField(
                controller: phone_controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone,color: Colors.grey,),
                  hintText: "Phone Number",
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
              SizedBox(height: 20,),
              TextField(
                controller: password_controller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock,color: Colors.grey,),
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
              SizedBox(height: 35,),
              GestureDetector(
                onTap: (){
                  _doSign_up();
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
              SizedBox(height: 120,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(color: Colors.grey,fontSize: 14),),
                  SizedBox(width: 8,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, Sign_in.id);
                    },
                    child: Text("SIGN IN",style: TextStyle(
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
