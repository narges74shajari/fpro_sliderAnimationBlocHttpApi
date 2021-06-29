import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fpro_slideranimationbloc/pages/CounterPage.dart';
import 'package:fpro_slideranimationbloc/pages/HomePage.dart';
import 'package:fpro_slideranimationbloc/pages/myOrderPage.dart';
import 'package:fpro_slideranimationbloc/pages/wishListPage.dart';

enum NavigationEvents{
  HomPageClickEvent,
  MyOrderPageClickEvent,
  WishListPageClickEvent,
  CounterPageClickEvent
}
class NavigationBloc extends Bloc<NavigationEvents,Widget>{
  NavigationBloc(Widget initialState) : super(initialState);



  @override
  Stream<Widget> mapEventToState(NavigationEvents event) async* {
   if(event==NavigationEvents.HomPageClickEvent){
     yield HomePage();
   }
   else if(event==NavigationEvents.MyOrderPageClickEvent){
     yield MyOrder();
   }
    if(event==NavigationEvents.WishListPageClickEvent){
     yield wishList();
   }
   if(event==NavigationEvents.CounterPageClickEvent){
     yield CounterPage();
   }
  }

}