import 'package:flutter/cupertino.dart';
import 'base_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'addTile.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreen();
  }

}

class _HomeScreen extends State<HomeScreen> {

  bool isMenuVisible = false;

  // void addItemTile(BuildContext context) {
  //   Provider.of<UpdatedTileList>(context, listen: false).addTile();
  // }

  void removeItemTile(BuildContext context) {
    Provider.of<UpdatedTileList>(context, listen: false).removeTile();
  }

  void getAddTileBottomSheet(){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 800.0,
          child: Text("hello"),
        );

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Consumer<UpdatedTileList>(
                  builder: (context, tileList, _) {
                    print(tileList.getTile);
                    return Expanded(
                        // wrap in Expanded
                        child: SizedBox(
                      child: ListView.builder(
                        itemCount: tileList.getTile.length,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: tileList.getTile[index],
                          );
                        },
                      ),
                    ));

                    //   ListView(shrinkWrap: true,
                    // children: tileList.getTile,);
                    //   // Column(children: tileList.getTile,);
                  },
                ),
              )
            ],
          ),
        ),
        // Positioned(
        //   left: MediaQuery.of(context).size.width - 80.0,
        //   top: MediaQuery.of(context).size.height - 80.0,
        //   child: FloatingActionButton(
        //     onPressed: null,
        //     child: Icon(Icons.menu),
        //   ),
        // ),
        Positioned(
          left: MediaQuery.of(context).size.width - 80.0,
          top:MediaQuery.of(context).size.height-300,
          height: 250.0,
          width: 300.0,
          child: Stack(
            children: <Widget>[
          Positioned(
            bottom:150.0,
            child: Visibility(
              visible: isMenuVisible,
              child: FloatingActionButton(onPressed: ()=>getAddTileBottomSheet(),
                child: Icon(Icons.add),

              ),
            ),
          ),
            Positioned(
              bottom:75.0,
              child: Visibility(
                visible: isMenuVisible,
                child: FloatingActionButton(onPressed: (){
                     removeItemTile(context);
                       },
                child: Icon(Icons.remove_circle_outline),
                              ),
              ),
            ),
              Positioned(
                bottom:0,
                child: FloatingActionButton(
                  onPressed: (){
                    this.setState(() {
                      isMenuVisible = ! isMenuVisible;
                    });
                  },
                  child: Icon(Icons.menu),
                ),
              ),


            ],
          ),
        ),
      ],
    );
  }
}
