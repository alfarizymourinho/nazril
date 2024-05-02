import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  CounterView({Key? key}) : super(key: key);

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Count: ${controller.count}",
                  style: TextStyle(
                    fontSize: controller.count.toDouble(),
                  ),
                )),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.decrement();
                    if (controller.count < 100) {
                      showSnackBar("Decremented: ${controller.count}");
                    } else {
                      showSnackBar("Value exceeds 100!");
                    }
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    controller.increment();
                    if (controller.count > 100) {
                      showSnackBar("Incremented: ${controller.count}");
                    }
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(String message) {
    Get.snackbar(
      "Notification",
      message,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      
    );
  }
}
