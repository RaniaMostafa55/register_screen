import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  bool isPassSecured = true;
  bool isConfirmPassSecured = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  'Register',
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
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.person_2_outlined,
                          color: Colors.purple,
                        ),
                        hintText: "Ahmed Ali Ahmed",
                        label: const Text("Full Name"),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.phone_outlined,
                          color: Colors.purple,
                        ),
                        hintText: "01126528088",
                        label: const Text("Phone Number"),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your phone number";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.purple,
                        ),
                        hintText: "test@gmail.com",
                        label: const Text("Email"),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      obscureText: isPassSecured,
                      keyboardType: TextInputType.visiblePassword,
                      controller: passController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock_outlined,
                          color: Colors.purple,
                        ),
                        hintText: "*******",
                        label: const Text("Password"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassSecured = !isPassSecured;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                          ),
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      textInputAction: TextInputAction.go,
                      obscureText: isConfirmPassSecured,
                      keyboardType: TextInputType.visiblePassword,
                      controller: confirmPassController,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock_outlined,
                          color: Colors.purple,
                        ),
                        hintText: "*******",
                        label: const Text("Confirm Password"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isConfirmPassSecured = !isConfirmPassSecured;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                          ),
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please re-enter your password";
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      minWidth: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.07,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          print("Done");
                        }
                      },
                      color: Colors.purple,
                      child: const Text(
                        "Register",
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
                      onPressed: () {},
                      child: const Text(
                        "Login",
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
