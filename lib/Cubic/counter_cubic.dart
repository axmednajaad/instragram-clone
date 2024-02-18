import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubic extends Cubit<int> {
  CounterCubic() : super(0);

  ///  Increments the state by one.
  void increment() {
    emit(state + 1);
  }

  ///  Decrements the state by one.
  void decrement() {
    /// this checks and allows us to  not go below zero
    if (state <= 0) {
      return;
    }
    emit(state - 1);
  }
}


