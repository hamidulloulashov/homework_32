import 'package:flutter/material.dart';
import 'package:homewrk_30/future/pages/login.dart';
import '../theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Center(
          child: Text(
            "Login",
            style: TextStyle(
              color: AppColors.text,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            LoginPage(),
            SizedBox(height: 50),
            Text("Forgot Password?", style: TextStyle(color: Colors.white)),
            SizedBox(height: 50),
            Text(
              "or sign up with",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/instagram.png", width: 26),
                  SizedBox(width: 10),
                  Image.asset("assets/google.png", width: 26),
                  SizedBox(width: 10),
                  Image.asset("assets/facbook.png", width: 26),
                  SizedBox(width: 10),
                  Image.asset("assets/watsap.png", width: 26),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Dont have an account? Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
