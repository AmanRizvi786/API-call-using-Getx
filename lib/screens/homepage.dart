import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getx_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Put ApiController to make it available for use
    ApiController apiController = Get.put(ApiController());

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey.shade900,
        title: const Text("API Call"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Use Obx to listen to changes in the userList and isLoading from the controller
          Obx(
                () => apiController.isLoading.value
                ? const LinearProgressIndicator() // Show the progress indicator while loading
                : const SizedBox.shrink(), // Hide it when not loading
          ),
          // Use Obx to listen to changes in the userList from the controller
          Expanded(
            child: Obx(
                  () => ListView.builder(
                itemCount: apiController.userList.length,
                itemBuilder: (context, index) {
                  final user = apiController.userList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        // User avatar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            user.avatarUrl,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(width: 30),
                        // User login and id
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.login,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              'ID: ${user.id}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
