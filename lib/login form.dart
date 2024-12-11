import 'package:final_project/Classes.dart';
import 'package:final_project/Database.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';


class LoginScreen extends StatefulWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  DatabaseHelper _database = DatabaseHelper();
  bool showPas = true;
  TextEditingController username_controller =TextEditingController();
  TextEditingController password_controller =TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.white,Colors.green,Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: Stack(
          children: [
            // Background with curved design
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                painter: CurvedPainter(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
              ),
            ),
            // Login Form
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 100,left: 50,right: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: username_controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter your username",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextField(
                      controller: password_controller,
                      obscureText: showPas,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter your password",
                        suffixIcon: IconButton(onPressed: (){
                          setState(() {
                            showPas =! showPas;
                          });
                        },
                            icon: Icon(showPas ==true? Icons.visibility : Icons.visibility_off)),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: ()async {
                        final user_name = username_controller.text;
                        final password = password_controller.text;

                        if(user_name.isNotEmpty && password.isNotEmpty){
                          final Exist = await _database.checkLogin(user_name, password);

                          if(Exist){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_page(),));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Welcome Back[$user_name]❤❤')));
                          }else{
                            await _database.Insert_Login(Login(password: password, user_name: user_name));
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_page(),));
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Welcome $user_name! your Account created ')));
                          }

                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please fill all fields'),backgroundColor: Colors.red,),
                          );
                        }
                        print(username_controller.text);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.green,
                      ),
                      child: Text('Login')
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  
  
  
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint greenPaint = Paint()..color = Colors.green;

    // Green curve
    Path greenPath = Path();
    greenPath.lineTo(0, size.height * 0.8);
    greenPath.quadraticBezierTo(
      size.width * 0.12,
      size.height *0.2,
      size.width ,
      size.height * 0.2,
    );
    greenPath.lineTo(size.width, 0);
    greenPath.close();
    canvas.drawPath(greenPath, greenPaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



