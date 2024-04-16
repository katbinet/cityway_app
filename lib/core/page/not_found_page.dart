import 'package:flutter/material.dart';

//Deafult Page If Routing Fail
// TODO: Not Finished

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Not Found Page"),
      ),
    );
  }
}
