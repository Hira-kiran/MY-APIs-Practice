// ignore_for_file: prefer_interpolation_to_compose_strings
// This is get API
// Make Model with plugin(From JSON to dart website,we easily create json to dart code)
// This API starts from list and then repeat objects( very simple API)
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_api_practice/Api_practice/second_method.dart';
import '../Api_Models/model.dart';

class FirstMethod extends StatefulWidget {
  const FirstMethod({super.key});
  @override
  State<FirstMethod> createState() => _FirstMethodState();
}

class _FirstMethodState extends State<FirstMethod> {
// ******
  List<Autogenerated> postList = [];
//******for hit API (See API nature and then make its model)
  Future<List<Autogenerated>> getPostApi() async {
    final response = await http.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts")); // for API response and then we parse it in model,and then parse through model in postlist,then data is stored in list
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map<String, dynamic> i in data) {
        postList.add(Autogenerated.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("First Method"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondMethod()));
                },
                icon: const Icon(Icons.next_plan))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: Text("Loading..."));
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Title",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(postList[index].title.toString()),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text("Discription",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(postList[index].body.toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
            ),
          ],
        ));
  }
}
