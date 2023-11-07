import 'package:flutter/material.dart';
import 'package:mental_health/resources/authmethods.dart';
import 'package:mental_health/screens/auth/signup_screen.dart';
import 'package:mental_health/screens/journal/create_journal_screen.dart';
import 'package:mental_health/widgets/textfiled.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  void login() async {
    String res =
        await Authmethods().login(email: email.text, password: password.text);
    if (res == "success") {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login successfully')));
      const Duration(milliseconds: 500);
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreateJournal()));
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 20,
            child: Container(),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              'Login',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 54, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(hint: 'email address', controller: email),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextInput(
              hint: 'Password',
              controller: password,
              isPassword: true,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: InkWell(
              onTap: () => login(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(26, 0, 0, 0),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    )),
                child: const Center(
                    child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don't have an account?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child:
                    const Text("Sign up", style: TextStyle(color: Colors.blue)),
              )
            ],
          ),
          Flexible(
            flex: 24,
            child: Container(),
          )
        ],
      ),
    ));
  }
}
