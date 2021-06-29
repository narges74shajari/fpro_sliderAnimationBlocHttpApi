import 'package:flutter/material.dart';
import 'package:fpro_slideranimationbloc/bloc/product_bloc.dart';
import 'package:fpro_slideranimationbloc/models/product.dart';
class wishList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "product list",
      theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
      home: MyHomePage(title: 'Users List Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  ProductBLoc productBLoc = new ProductBLoc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          Chip(
            label: StreamBuilder<int>(
                stream: productBLoc.productCounter,
                builder: (context, snapshot) {
                  return Text(
                    (snapshot.data ?? 0).toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  );
                }),
            backgroundColor: Colors.red,
          ),
          Padding(
            padding: EdgeInsets.only(right: 16),
          )
        ],
      ),
      body: StreamBuilder(
          stream: productBLoc.productsList,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
              case ConnectionState.active:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError)
                  return Text('There was an error : ${snapshot.error}');
                List<Product> products = snapshot.data;

                return ListView.separated(
                  itemCount: products?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Product _product = products[index];
                    return ListTile(
                      title: Text(_product.productName),
                      subtitle: Text(_product.price),
                        leading:ClipOval(
                          child: Image.network(
                            _product.imageUrl,
                            fit: BoxFit.fill,
                          ),

                        ),
                      // leading: CircleAvatar(
                      //   child: Image.network(_product.imageUrl),
                      // ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                );
            }
          }),
    );
  }
}

