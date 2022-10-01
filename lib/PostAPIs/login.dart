// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPostApi extends StatefulWidget {
  const LoginPostApi({super.key});

  @override
  State<LoginPostApi> createState() => _LoginPostApiState();
}

class _LoginPostApiState extends State<LoginPostApi> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      // post server pr request byjny k lye h
      Response response = await post(Uri.parse("https://reqres.in/api/login"),
          body: {'email': email, 'password': password});
      if (response.statusCode == 200) {
        // for getting Id and token
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        // if u want to get just token
        // then print(data['token'])
        print("Login Successfully");
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LogIn Post")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                controller: emailController,
                decoration: const InputDecoration(label: Text("Email"))),
            TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(label: Text("Password"))),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(child: Text("Login")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LoginPostApi())));
                  },
                  child: const Text("Dont have an account? SIGNUP")),
            ),
            const InkWell(
                /* onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const UploadImages())));
                }, */
                child: Text("NEXT IMAGE PAGE"))
          ],
        ),
      ),
    );
  }
}
