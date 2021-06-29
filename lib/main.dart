import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpro_slideranimationbloc/bloc/counter_bloc.dart';
import 'package:fpro_slideranimationbloc/bloc/theme_bloc.dart';

import 'SlideBarLayout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
      BlocProvider<CounterBloc>(
          create: (BuildContext context)=> CounterBloc(0),
      ),
        BlocProvider<themeBloc>(
          create: (BuildContext context)=>themeBloc() ,
        )
    ],
      child: BlocBuilder<themeBloc,ThemeData>(builder: (context,ThemeData theme){
        return  MaterialApp(
          title: 'SideBar',
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: SideBarLayout(),
        );
      },)
    );
  }
}
