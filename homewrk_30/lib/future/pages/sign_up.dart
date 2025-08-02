import 'package:flutter/material.dart';
import 'package:homewrk_30/theme/app_theme.dart';
import 'package:homewrk_30/future/widget/recipe_text_form.dart';
import 'package:homewrk_30/core/client.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> registerUser() async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: {
          'username': _usernameController.text,
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'email': _emailController.text,
          'phoneNumber': _phoneController.text,
          'birthDate': '${_birthDateController.text}T00:00:00',
          'password': _passwordController.text,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ro'yxatdan muvaffaqiyatli o'tdingiz!")),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Xatolik: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Xatolik yuz berdi: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColors.text,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Register', style: TextStyle(color: AppColors.text)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              RecipiTextForm(
                text: "Username",
                hint: "yourusername",
                controller: _usernameController,
              ),
              RecipiTextForm(
                text: "First Name",
                hint: "Ali",
                controller: _firstNameController,
              ),
              RecipiTextForm(
                text: "Last Name",
                hint: "Valiyev",
                controller: _lastNameController,
              ),
              RecipiTextForm(
                text: "Email",
                hint: "example@gmail.com",
                controller: _emailController,
              ),
              RecipiTextForm(
                text: "Phone",
                hint: "+998901234567",
                controller: _phoneController,
              ),
              RecipiTextForm(
                text: "Birth Date",
                hint: "2000-01-01",
                controller: _birthDateController,
              ),
              RecipiTextForm(
                text: "Password",
                hint: "********",
                controller: _passwordController,
                isPassword: true,
              ),

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerUser();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.container,
                  fixedSize: const Size(200, 45),
                ),
                child: Text("Sign Up", style: TextStyle(color: AppColors.text)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
