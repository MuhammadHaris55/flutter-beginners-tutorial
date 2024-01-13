import 'package:flutter/material.dart';
import 'package:myapp/features/api_integeration/api_services.dart';

class ApiIntegerationScreen extends StatefulWidget {
  const ApiIntegerationScreen({super.key});

  @override
  State<ApiIntegerationScreen> createState() => _ApiIntegerationScreenState();
}

class _ApiIntegerationScreenState extends State<ApiIntegerationScreen> {
  @override
  Widget build(BuildContext context) {
    final ApiServices apiServices = ApiServices();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Integeration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: apiServices.triggerGetApi,
              child: const Text('Trigger Get Api'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              // onPressed: () => apiServices.triggerPostApi,
              onPressed: () => apiServices.triggerPostApi(context),
              child: const Text('Trigger Post Api'),
            ),
          ],
        ),
      ),
    );
  }
}
