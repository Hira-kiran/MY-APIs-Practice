// https://randomuser.me/api/?results=2

// This API starts from object and the use list (complex api)
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Api_Models/random_uer_model.dart';

class FifthMethod extends StatefulWidget {
  const FifthMethod({super.key});

  @override
  State<FifthMethod> createState() => _FifthMethodState();
}

class _FifthMethodState extends State<FifthMethod> {
  Future<RandomUserModel?> getRandomUser() async {
    var response =
        await http.get(Uri.parse("https://randomuser.me/api/?results=1"));
    var data = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      return RandomUserModel.fromJson(data);
    }
    return RandomUserModel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Fifth Method"),
          actions: [
            IconButton(
                onPressed: () {
                  /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondMethod())); */
                },
                icon: const Icon(Icons.next_plan))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<RandomUserModel?>(
              future: getRandomUser(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text("Loading..."));
                } else {
                  final results = snapshot.data!.results;

                  return ListView.builder(
                    itemCount: results!.length,
                    itemBuilder: (context, index) {
                      final user = results[index];
                      final location = user.location;

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Title",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                  "ID: ${user.id!.value}"), // Access the 'id' property
                              const SizedBox(
                                height: 5,
                              ),
                              const Text("Description",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                  "Location: ${location!.city}"), // Access the 'city' property
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            )),
          ],
        ));
  }
}
