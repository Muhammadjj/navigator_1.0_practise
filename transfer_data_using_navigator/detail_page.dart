import 'package:flutter/material.dart';

import 'fruit_model_class.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.fruitDataModel, required this.index});
   int index;
  var fruitDataModel = FruitModelClass();
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.fruitDataModel.name,
      style:const TextStyle(color: Colors.white),),),
      body: Column(children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image(image: NetworkImage(widget.fruitDataModel.imagesUrl))),
          Text(widget.fruitDataModel.description),
      ],),
    );
  }
}
