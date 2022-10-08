import 'package:flutter/material.dart';
import 'package:my_app/features/counter/providers/counter_provider.dart';
import 'package:my_app/theme/colors/app_gradients.dart';
import 'package:provider/provider.dart';

class Count extends StatelessWidget {
  const Count({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox( 
      child: Text(
         context.watch<CounterProvider>().counter.count.toString(), 
        style:  Theme.of(context).textTheme.headline1?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
        
      ),
    );
  }
}
class IncrementButton extends StatelessWidget {
  const IncrementButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<CounterProvider>().incrementCounter(),
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

 