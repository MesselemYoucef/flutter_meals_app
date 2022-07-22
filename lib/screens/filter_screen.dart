import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static String routeName = "/filters";

  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your FLilters"),
      ),
      drawer: const MainDrawer(),
      body: Center(
      child: Text("Filters Screen"),
    ));
  }
}
