import 'package:flutter/material.dart';

import '../Naviagator_Practise/model.dart';
import 'navigator_second_page.dart';
import 'navigator_third_page.dart';

void main(List<String> args) {
  runApp(const NavigatorAndRouter());
}

class NavigatorAndRouter extends StatelessWidget {
  const NavigatorAndRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const RouterPractice(),
    );
  }
}

class RouterPractice extends StatefulWidget {
  const RouterPractice({super.key});

  @override
  State<RouterPractice> createState() => _RouterPracticeState();
}

class _RouterPracticeState extends State<RouterPractice> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  var image = "assest/images/fashion1.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 400,
                width: 400,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                    ))),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: email,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: password,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SecondPage(
                      image: image,
                      email: email.text.toString(),
                      password: password.text.toString(),
                    );
                  },
                ));
              },
              child: const Text("Second Page"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var result = Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ThirdPage(),
              settings: RouteSettings(
                  name: "Profile",
                  arguments:
                      Profile(image: image, email: email.text.toString()))));
          ScaffoldMessenger.of(context)
          .showSnackBar( SnackBar(content: Text("$result")));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
