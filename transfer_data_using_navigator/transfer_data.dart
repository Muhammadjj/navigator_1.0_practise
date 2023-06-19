import 'package:flutter/material.dart';

import 'detail_page.dart';
import 'fruit_model_class.dart';

void main(List<String> args) {
  runApp(const FirstScreen());
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

 static List fruitName =<String>["Apple","Orange","Banana","Coconut","Date"];

 static List fruitImage =<String> [
    "https://images.unsplash.com/photo-1614061811858-dde54a522f5e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZGF0ZXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://plus.unsplash.com/premium_photo-1667543228378-ec4478ab2845?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8b3JhbmdlJTIwanVpY2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1640958900081-7b069dd23e9c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGJhbmFuYXN8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://media.istockphoto.com/id/1475273505/photo/fresh-coconuts-on-sandy-beach-with-palm-leaf-shadow-and-sunlight.webp?b=1&s=170667a&w=0&k=20&c=SorsAFxcKRwTG5qtDiuWiNGfwa5r3Cp6DxOz2wisctA=",
    "https://media.istockphoto.com/id/1340549637/photo/ripe-red-apple-close-up-with-apple-orchard-in-background.webp?b=1&s=170667a&w=0&k=20&c=zqhTVck6FzTEmhWLldO55_URImyKBL51hHHazY40ASE="
  ];


 static List<FruitModelClass> fruitData =List.generate(fruitName.length, (index) => 
 FruitModelClass(name:"${fruitName[index]}",imagesUrl:"${fruitImage[index]}",description:"${fruitName[index]}...description"));


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body:ListView.builder(
          itemCount: fruitData.length,
          itemBuilder: (context, index) {
          return  Card(
            child:  ListTile(
              title: Text(fruitData[index].name),
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image(image: NetworkImage(fruitData[index].imagesUrl)),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return  DetailPage(fruitDataModel: fruitData[index],index: index,);
                },));
              },
            ),
          );
        },)
      ),
    );
  }
}