import 'package:DeliMeaks/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilteresScreen extends StatelessWidget {
static const routName =  '/filteres-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Your Filteres'),
      ),
          body: Container(
        child: Text('FilteresScreen'),
      ),
    );
  }
}