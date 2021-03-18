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
              body: Center(child: CustomDialog()),
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


class CustomDialog extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomDialog();
  }


}

class _CustomDialog extends State<CustomDialog>{
  bool isDialogVisible = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Visibility(
          visible: !isDialogVisible,
          child: RaisedButton(
            elevation: 2,
            hoverColor: Colors.blue,
            color:Colors.red,
            hoverElevation: 10,
            onPressed: null,
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black
              ),
              child: Container(
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width/4,

                child: Column(
                  children: <Widget>[
                    RaisedButton(onPressed: (){
                      setState(() {
                        isDialogVisible = ! isDialogVisible;
                      });
                    },
                      child: Icon(Icons.filter_rounded),)
                  ],
                ),
                color:Colors.amber,

              ),
            ),
          ),
        ),
        Visibility(
          visible: isDialogVisible,
          child: Container(
              child:RaisedButton(onPressed: (){
                setState(() {
                  isDialogVisible = ! isDialogVisible;
                });
              },
                child: Icon(Icons.filter_rounded),)
          ),
        )
      ],
    );

  }

}
