import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // بخش سبز منحنی بالای صفحه
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 300,
              color: Colors.green,
            ),
          ),
          // فرم لاگین
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // فیلد نام کاربری
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'نام کاربری',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  // فیلد رمز عبور
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'رمز عبور',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24),
                  // دکمه ورود
                  ElevatedButton(
                    onPressed: () {
                      // عملیات ورود
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  Colors.green, // رنگ دکمه
                      padding: EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: Text(
                      'ورود',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// کلاس برای ساخت منحنی بالای صفحه
class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

