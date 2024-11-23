import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> fetchTasks() async {
    // Add logic here to fetch tasks if necessary
    update(); // Notify listeners about changes
  }

  
}
