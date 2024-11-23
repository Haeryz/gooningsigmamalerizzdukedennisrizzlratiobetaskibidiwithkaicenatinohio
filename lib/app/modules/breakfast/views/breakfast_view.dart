import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/breakfast_controller.dart';

class BreakfastView extends GetView<BreakfastController> {
  const BreakfastView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BreakfastView'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'search breakfast',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )
            ),
          ),

          SizedBox(height: 20),

          const Text('Category',
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
          
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 100,
                  color: Colors.blue[200],
                  alignment: AlignmentDirectional.center,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(image: AssetImage('assets/recipe-book.png'))
                  // ),
                  child: Text('salad'),
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                  child: Text('salad'),
                ),
                Container(
                  width: 100,
                  color: Colors.green,
                  child: Text('salad'),
                ),
                Container(
                  width: 100,
                  color: Colors.purple,
                  child: Text('salad'),
                ),
                Container(
                  width: 100,
                  color: Colors.blue,
                  child: Text('salad'),
                ),
                Container(
                  width: 100,
                  color: Colors.red,
                  child: Text('salad'),
                ),
                Container(
                  width: 100,
                  color: Colors.green,
                  child: Text('salad'),
                ),
                Container(
                  width: 100,
                  color: Colors.purple,
                  child: Text('salad'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Text('recommendation for diet',
          textAlign: TextAlign.start,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
        ],
      ),
      );
  }
}
