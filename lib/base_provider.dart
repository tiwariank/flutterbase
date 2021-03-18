import 'package:flutter/cupertino.dart';
import 'package:flutter_base_code_base/base_provider.dart';
import 'package:provider/provider.dart';

import 'itemTile.dart';

class Counter extends ChangeNotifier {
  var _count = 0;
  int get getCounter {
    return _count;
  }

  void incrementCounter() {
    _count += 1;
    notifyListeners();
  }

}


class UpdatedTileList extends ChangeNotifier{
  List<ItemTile> tileList = [];
  List<ItemTile> get getTile {
    return tileList;
  }

  addTile(String tileName,String tileType) async{
    var tile = new ItemTile(tileName, tileType);
    tileList.add(tile);
    notifyListeners();
  }

  removeTile() async{
    if(tileList.length>0) {
      tileList.removeAt(tileList.length - 1);
      notifyListeners();
    }
  }

}


