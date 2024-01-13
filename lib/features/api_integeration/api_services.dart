import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  triggerGetApi() async {
    // var url = Uri.https('reqres.in', 'api/users/2');
    debugPrint('kkk pp');
    try {
      http.Response response = await http.get(
        // url,
        Uri.parse('https://reqres.in/api/users/950'),
        headers: {},
      );
      print('http response == ${response.body.toString()}');
    } catch (e) {
      print('exception ' + e.toString());
    }
    print('function ends');
  }

  triggerPostApi(BuildContext context) async {
    print('post api');
    try {
      http.Response response = await http.put(
        Uri.parse('https://reqres.in/api/users/950'),
        // headers: {
        //   'authorization': '',
        // },
        body: {"name": "Daniyal", "job": "Flutter Developer"},
      );
      // if (response.statusCode == 201) {
      const snackBar = SnackBar(
        content: Text('User added successfully'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // }
      print('http post response == ${response.body.toString()}');
    } catch (e) {
      print('exception ' + e.toString());
    }
    print('post api function ends');
  }
}
