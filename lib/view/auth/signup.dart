import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_lms/core/utils/validator.dart';
import 'package:my_lms/models/user_model.dart';
import 'package:my_lms/routes/app_routes.dart';
import 'package:my_lms/widgets/custom_button.dart';
import 'package:my_lms/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  UserRole? _selectedRole;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Start your learning journey",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsGeometry.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "Full Name",
                          controller: _fullNameController,
                          prefixIcon: Icons.person_outline,
                          validator: FormValidator.validateFullName,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: "Email",
                          controller: _emailController,
                          prefixIcon: Icons.email_outlined,
                          validator: FormValidator.validateEmail,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: "Password",
                          controller: _passwordController,
                          prefixIcon: Icons.lock_outline,
                          isObscureText: true,
                          validator: FormValidator.validatePassword,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          label: "Confirm Password",
                          controller: _confirmPasswordController,
                          prefixIcon: Icons.lock_outline,
                          isObscureText: true,
                          validator: (value) {
                            return FormValidator.validateConfirmPassword(
                              value,
                              _passwordController.text,
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<UserRole>(
                          dropdownColor: Colors.white,
                          initialValue: UserRole.Student,
                          validator: (value) {
                            if (value == null) {
                              return "Role is required";
                            }
                            return null;
                          },
                          value: _selectedRole,
                          decoration: InputDecoration(
                            labelText: "Role",
                            prefixIcon: Icon(Icons.person_outline),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),

                          items: UserRole.values.map((role) {
                            return DropdownMenuItem<UserRole>(
                              value: role,
                              child: Text(role.name),
                            );
                          }).toList(),

                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value;
                            });
                          },
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: "Sign Up",
                          onPressed: _handleRegister,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?"),
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                "Login",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate() && _selectedRole != null) {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
