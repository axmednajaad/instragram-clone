// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagramclone/Cubic/counter_cubic.dart';
import 'package:instagramclone/cubic_home/counter_cubic_home.dart';

class Incr_decr_counter extends StatelessWidget {
  const Incr_decr_counter({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubic = BlocProvider.of<CounterCubic>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => counterCubicHome(),
                ),
              );
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterCubic.decrement();
            },
            child: Icon(Icons.minimize),
          ),
          SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              counterCubic.increment();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      // body: ,
    );
  }
}
