import 'package:flutter/material.dart';

class Third extends StatelessWidget {
  Third({
    super.key,
    this.nameForHome,
  });
  late String? nameForHome;

  @override
  Widget build(BuildContext context) {
    nameForHome = ModalRoute.of(context)!.settings.arguments as String ;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$nameForHome"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context,"Development");
                },
                child: const Text("Exit")),
          ],
        ),
      ),
    );
  }
}
