import 'package:flutter_bloc/flutter_bloc.dart';

class CounterIncremented {}

class CounterBlock extends Bloc<CounterIncremented, int> {
  //
  CounterBlock() : super(0);
  //
}
