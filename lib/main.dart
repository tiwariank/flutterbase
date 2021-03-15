import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base_code_base/base_provider.dart';
import 'itemTile.dart';
import 'homeScreen.dart';


void main() {
  runApp(HomeApp());
}
class HomeApp extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider<UpdatedTileList>(
  //     create: (BuildContext context) {
  //       print("my app context");
  //       return UpdatedTileList();
  //     },
  //     child: MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: HomeScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<UpdatedTileList>(create: (context) {
        return UpdatedTileList();
      }),
    ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: HomeScreen(),
            )
            ,
            theme: ThemeData.light(),
          ));


    // return ChangeNotifierProvider<UpdatedTileList>(
    //   create: (BuildContext context) {
    //     print("my app context");
    //     return UpdatedTileList();
    //   },
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: HomeScreen(),
    //   ),
    // );
  }

}





class MyApp1 extends StatelessWidget{

  void addItemTile(BuildContext context) {
    // Provider.of<UpdatedTileList>(context, listen: false).addTile();
    print("hello");
    Provider.of<UpdatedTileList>(context, listen: false).addTile();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
     children: <Widget>[
       RaisedButton(
         onPressed: (){
           addItemTile(context);
         },
         child: Icon(Icons.add),
       )

     ],
    );
  }

}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: "AndroidVille Provider Pattern"),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({this.title});
  void _incrementCounter(BuildContext context) {
    Provider.of<Counter>(context, listen: false).incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context).getCounter;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}


