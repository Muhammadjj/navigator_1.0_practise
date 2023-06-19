import 'package:flutter/material.dart';

import 'third_page.dart';

class Practice extends StatelessWidget {
  const Practice({
    super.key,
    this.nameForHome, this.images, this.name,
  });
  final String? nameForHome;
  final String? images;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$nameForHome"),
            SizedBox(
              height: 200,
              width: 200,
              child: Image(image: AssetImage("$images"))),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Exit")),
          ],
        ),
      ),
    );
  }
}
