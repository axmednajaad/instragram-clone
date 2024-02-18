// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramclone/Cubic/Incr_decr_counter.dart';
import 'package:instagramclone/Cubic/counter_cubic.dart';

class counterCubicHome extends StatelessWidget {
  const counterCubicHome({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubic = BlocProvider.of<CounterCubic>(context);
    //// instead of this i use bloc builder
    // final counter = counterCubic.state;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('you have pushed'),
            BlocBuilder<CounterCubic, int>(
                bloc: counterCubic,
                builder: (context, counter) {
                  return Text(' $counter ');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Incr_decr_counter(),
            ),
          );
        },
        tooltip: 'connect another page',
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
