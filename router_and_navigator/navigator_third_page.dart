import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ThirdPage extends StatefulWidget {
   ThirdPage( {this.image,  this.email, super.key});
  late  String? image;
  late  String? email;

  @override
  State<ThirdPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {

    widget.image = ModalRoute.of(context)!.settings.arguments as String;
    widget.email = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 500,
                color: Colors.black12,
                child: Row(
                  children: [
                    Image(image: AssetImage("$widget.image"),fit: BoxFit.fill,width: 100,height: 200),
                      const SizedBox(width: 10,),
                    Column(
                      children: [
                        Text("$widget.email",style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 30,),
                        ElevatedButton(onPressed: (){
                          Navigator.of(context).pop();
                        }, child:const Text("Main Page"))
                      ],
                    )
                  ],
                ),
                 
              ),
            ],
          )),
    );
  }
}
