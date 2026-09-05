import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lms/routes/app_routes.dart';
import 'package:my_lms/widgets/custom_button.dart';
import 'package:my_lms/widgets/custom_text_field.dart';

import '../../core/utils/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school, size: 50, color: Colors.white),
                        const SizedBox(height: 10),
                        Text(
                          "Welcome Back!!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      label: "Email",
                      prefixIcon: Icons.email_outlined,
                      validator: FormValidator.validateEmail,
                      keyboardType: TextInputType.emailAddress,
                      maxLine: 1,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      prefixIcon: Icons.lock_outline,
                      isObscureText: true,
                      validator: FormValidator.validatePassword,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.forgotPassword),
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton(text: "Login", onPressed: _handleLogin,
                    ),
                    SizedBox(height: 40),
                    Row(
                      children: [
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                        const Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                          child: Text(
                            "or continue with",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: Divider(color: Colors.grey.shade300)),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _socialLoginButton(
                          icon: Icons.g_mobiledata,
                          onPressed: () {},
                        ),
                        _socialLoginButton(
                          icon: Icons.facebook,
                          onPressed: () {},
                        ),
                        _socialLoginButton(icon: Icons.apple, onPressed: () {}),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () => Get.toNamed(AppRoutes.signup),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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

  Widget _socialLoginButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return CustomButton(
      iconSize: 30,
      text: "",
      onPressed: onPressed,
      isOutline: true,
      icon: icon,
      isFullWidth: false,
    );
  }

  void _handleLogin(){
    if(_formKey.currentState!.validate()){
      Get.offAllNamed(AppRoutes.home);
    }
  }
}
