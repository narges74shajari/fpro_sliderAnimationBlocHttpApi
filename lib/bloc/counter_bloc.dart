import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

enum CounterEvents{
  Increment,
  decrment
}

class CounterBloc extends Bloc<CounterEvents,int>{
  CounterBloc(int initialState) : super(initialState);

 // CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvents event)async* {
    if (event==CounterEvents.Increment){
      yield state+1;
    }
    else{
      yield state-1;
    }
  }

}

