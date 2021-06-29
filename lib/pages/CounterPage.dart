import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpro_slideranimationbloc/bloc/counter_bloc.dart';
import 'package:fpro_slideranimationbloc/bloc/theme_bloc.dart';

class CounterPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new BlocBuilder<CounterBloc ,int>(builder: (context,int myCounter){
       return Center(
          child: new Text("Counter is: $myCounter",style: new TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w900
          ),),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
       context.read<CounterBloc>().add(CounterEvents.Increment);
       context.read<themeBloc>().add(ThemeEvents.toggle);
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
