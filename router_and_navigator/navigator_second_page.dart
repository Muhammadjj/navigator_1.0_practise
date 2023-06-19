import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key, 
  required this.email, 
  required this.password, 
  required this.image});

  final String email;
  final String password;
  final String image;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
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
                    Image(image: AssetImage(widget.image),fit: BoxFit.fill,width: 100,height: 200),
                      const SizedBox(width: 10,),
                    Column(
                      children: [
                        Text(widget.email,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5,),
                        Text(widget.password,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.w700,),),
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
