import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const OnWillPop());
}

class OnWillPop extends StatelessWidget {
  const OnWillPop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const OnWillPopPage());
  }
}

class OnWillPopPage extends StatelessWidget {
  const OnWillPopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WillPopScope Demo"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const SecondClass();
            }));
          },
          child: const Text("Go to Next screen"),
        ),
      ),
    );
  }
}

class SecondClass extends StatefulWidget {
  const SecondClass({super.key});

  @override
  State<SecondClass> createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  Future<bool?> showWarning(BuildContext context) async => showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Your Data Save."),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(
                      false,
                    );
                  },
                  child: Text("NO")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text("Yes")),
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final should = await showWarning(context); 
        return should ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
          title: Text("SECOND PAGE"),
        ),
        body: Container(
          height: 200,
          width: 200,
          color: Colors.amber,
        ),
      ),
    );
  }
}
