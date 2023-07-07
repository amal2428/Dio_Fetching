import 'package:dio/dio.dart';
import 'package:dio_fetching/constants.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String responseValue = "Click the button to fetch data";
  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Dio fetching"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              responseValue,
              maxLines: 20,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                fetchData();
              },
              child: const Icon(
                Icons.done_outline_sharp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      final response = await dio.get(pathUrl);
      print(response.data);

      if (response.statusCode == 200 || response.statusCode == 201) {
        setState(() {
          responseValue = response.data.toString();
        });
      } else {
        print("Error on server side");
      }
    } catch (error) {
      print("Client side error");
    }
  }
}
