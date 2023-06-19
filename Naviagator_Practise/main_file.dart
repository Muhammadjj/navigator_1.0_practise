import 'package:flutter/material.dart';

import 'second_page.dart';
import 'third_page.dart';

void main(List<String> args) {
  runApp(const NavigatorMainFile());
}

class NavigatorMainFile extends StatelessWidget {
  const NavigatorMainFile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Navigation Route ",
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: const NavigatorPractice(),
    );
  }
}

class NavigatorPractice extends StatefulWidget {
  const NavigatorPractice({super.key});

  @override
  State<NavigatorPractice> createState() => _NavigatorPracticeState();
}

class _NavigatorPracticeState extends State<NavigatorPractice> {
  TextEditingController editingController = TextEditingController();
  String? images = "assest/images/casian.jpg";

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  static const String namedRoute = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: editingController,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Practice(
                        nameForHome: editingController.text.toString(),
                        images: images,
                      );
                    },
                  ));
                },
                child:const Text("Main page")),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage("$images")))
                
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var result =await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Third(),
              settings:const RouteSettings(name: namedRoute, arguments: "Pakistan")));
              ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("$result"),duration:const Duration(seconds: 2),));
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
