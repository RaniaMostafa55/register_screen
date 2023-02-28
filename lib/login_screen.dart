import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:register_task/animated_list_screen.dart';
import 'package:register_task/global_text_field.dart';
import 'package:register_task/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool isPassSecured = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //To make page scrollable
          SingleChildScrollView(
        child: Column(
          children: [
            //To make the wavy shape I used custom_clippers package
            ClipPath(
              clipper: SinCosineWaveClipper(
                  horizontalPosition: HorizontalPosition.RIGHT,
                  verticalPosition: VerticalPosition.BOTTOM),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                padding: const EdgeInsets.all(20),
                color: Colors.purple,
                alignment: Alignment.center,
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    //Creating the five-required textFields
                    const SizedBox(height: 10),
                    GlobalTextField(
                      action: TextInputAction.next,
                      type: TextInputType.emailAddress,
                      controller: emailController,
                      prefix: Icons.email_outlined,
                      hint: "test@gmail.com",
                      label: "Email",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email address";
                        } else if (!value.contains("@") ||
                            !value.contains(".com")) {
                          return "Please enter a valid email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    GlobalTextField(
                      action: TextInputAction.next,
                      type: TextInputType.visiblePassword,
                      controller: passController,
                      prefix: Icons.lock_outlined,
                      hint: "*******",
                      label: "Password",
                      isSecure: isPassSecured,
                      suffix: Icons.visibility_off,
                      onSuffixTap: () {
                        setState(() {
                          isPassSecured = !isPassSecured;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 6) {
                          return "Your password must be 6 digits at least";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    //Creating the two-required buttons
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      minWidth: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      onPressed: () {
                        //To check the validation of textFields
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AnimatedListScreen(),
                              ));
                        }
                      },
                      color: Colors.purple,
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      minWidth: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                    const SizedBox(height: 20)
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
