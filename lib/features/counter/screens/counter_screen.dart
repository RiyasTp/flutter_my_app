import 'package:flutter/material.dart';
import 'package:my_app/features/counter/providers/counter_provider.dart';
import 'package:my_app/features/counter/widgets/count_widget.dart';
import 'package:my_app/theme/colors/app_gradients.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
   const CounterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
      print('rebuilding');
    return Scaffold(
     
      body: Container(
        decoration: const BoxDecoration(
          gradient: blueRadialGradient, 
        ),
        child: const Center(
          child: Count(),
        ),
      ),
      floatingActionButton: const IncrementButton(),
    );
  }
}

