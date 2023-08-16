import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("print");
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/image/user.jpg'),
              Text(
                "Sign in".toUpperCase(),
                style: const TextStyle(
                  fontSize: 70,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "Username",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter Your User Name",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Consumer<LoginProvider>(
                builder: (context, loginProvider, child) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: loginProvider.passwordVisible,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        prefixIcon: const Icon(Icons.lock_open_rounded),
                        suffixIcon: IconButton(
                            onPressed: () {
                              loginProvider.togglePassword();
                            },
                            icon: loginProvider.passwordVisible == true
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility_outlined)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer<LoginProvider>(
                builder: (context, value, child) {
                  return Align(
                    alignment: Alignment.center,
                    child: OutlinedButton(
                        onPressed: () {
                          value.login(
                              emailController.text, passwordController.text);
                        },
                        style: OutlinedButton.styleFrom(
                          fixedSize: const Size(250, 50),
                        ),
                        child: value.loading
                            ? CircularProgressIndicator()
                            : const Text(
                                "sign In",
                                style: TextStyle(fontSize: 25),
                              )),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
