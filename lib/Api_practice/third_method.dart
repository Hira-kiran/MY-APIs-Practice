import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import '../Api_Models/users_model.dart';
import 'forth_method.dart';
import 'package:http/http.dart' as http;
// This API starts from list and then repeat objects(little complex API)

class ThirdMethod extends StatefulWidget {
  const ThirdMethod({super.key});

  @override
  State<ThirdMethod> createState() => _ThirdMethodState();
}

class _ThirdMethodState extends State<ThirdMethod> {
  List<UserModel> userList = [];
  //in Future,list is the return type
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(
        response.body.toString()); // body k andr jo data h isy decode krty hn
    if (response.statusCode == 200) {
      // if it is Array,then we use for loop(for in loop)
      for (Map<String, dynamic> i in data) {
        // if wewnt to show just one line print then we use(print(i['name'])).
        userList.add(UserModel.fromJson(i)); // all data ko show krany k leye
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Third Method"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ForthMethod()));
              },
              icon: const Icon(Icons.next_plan))
        ],
      ),
      // future builder wait krna h reponse ka, phr isy list return kraty hn
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, AsyncSnapshot<List<UserModel>> snapshot) {
                  if (!snapshot.hasData) {
                    // list.builder,agr array k andr 100 items hn tu ya isy 100 times build krygi
                    return const Center(child: Text("Loading..."));
                  } else {
                    return ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ComponentRow(
                                    title: "Name",
                                    value:
                                        snapshot.data![index].name.toString()),
                                ComponentRow(
                                    title: "Email",
                                    value:
                                        snapshot.data![index].email.toString()),
                                ComponentRow(
                                    title: "Address",
                                    value: snapshot
                                        .data![index].address!.geo!.lat
                                        .toString()),
                                ComponentRow(
                                    title: "Geo",
                                    value: snapshot
                                        .data![index].address!.geo!.lng
                                        .toString()),
                                ComponentRow(
                                    title: "Company",
                                    value: snapshot.data![index].company!.name
                                        .toString())
                              ],
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}

//now we make components

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
