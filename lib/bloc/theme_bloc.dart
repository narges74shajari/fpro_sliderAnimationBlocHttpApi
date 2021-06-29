import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ThemeEvents{
  toggle
}

class themeBloc extends Bloc<ThemeEvents,ThemeData>{
  themeBloc() : super(ThemeData.light());

  @override
  Stream<ThemeData> mapEventToState(ThemeEvents event) async*{
    if(state==ThemeData.dark()){
      yield ThemeData.light();
    }else{
      yield ThemeData.dark();
    }
  }

 // CounterBloc() : super(0);



}

