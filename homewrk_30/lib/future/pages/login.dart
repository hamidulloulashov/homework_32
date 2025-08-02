import 'package:flutter/material.dart';
import 'package:homewrk_30/future/pages/sign_up.dart';
import 'package:homewrk_30/theme/app_theme.dart';
import 'package:homewrk_30/future/widget/recipe_text_form.dart';
import 'package:homewrk_30/core/client.dart';

Future<void> loginUser(
  BuildContext context,
  String email,
  String password,
) async {
  try {
    final response = await dio.post(
      '/auth/login',
      data: {'Login': email, 'Password': password},
    );
    print(response);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login successful")));
      print(response);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(" Login failed: ${response.statusCode}")),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Error: $e")));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 50),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RecipiTextForm(
              hint: "example@example.com",
              text: "Email",
              controller: _emailController,
            ),
            SizedBox(height: 16),
            RecipiTextForm(
              hint: "Password",
              text: "Parol",
              isPassword: true,
              controller: _passwordController,
            ),
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.only(left: 85),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.container,
                      fixedSize: Size(207, 45),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginUser(
                          context,
                          _emailController.text,
                          _passwordController.text,
                        );
                      }
                    },
                    child: Text(
                      "Login in",
                      style: TextStyle(color: AppColors.text),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.container,
                      fixedSize: const Size(207, 45),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(color: AppColors.text),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
