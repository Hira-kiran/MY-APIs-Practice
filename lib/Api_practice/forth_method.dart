// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../PostAPIs/signUpApi.dart';

// Complex JSON but model ni bn rha through plugin
class ForthMethod extends StatefulWidget {
  const ForthMethod({super.key});

  @override
  State<ForthMethod> createState() => _ForthMethodState();
}

class _ForthMethodState extends State<ForthMethod> {
  var data;
  Future<void> userGetApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forth Method"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpPostApi()));
              },
              icon: const Icon(Icons.next_plan))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: userGetApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading..."));
                } else {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            children: [
                              ComponentRow(
                                  title: "Name",
                                  value: data[index]["name"].toString()),
                              ComponentRow(
                                  title: "Username",
                                  value: data[index]["username"].toString()),
                              ComponentRow(
                                  title: "address",
                                  value: data[index]["address"]["geo"]["lat"]
                                      .toString())
                            ],
                          ),
                        );
                      });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

//Now we make components

class ComponentRow extends StatelessWidget {
  final String title;
  final String value;
  const ComponentRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          Text(value),
        ],
      ),
    );
  }
}
