import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> data = ['aaa','bbb','ccc','ddd','eee','fff','ggg','hhh','iii','jjj'];

  void onreorder(int oldIndex, int newIndex){

    setState(() {
      if(newIndex>oldIndex){
        newIndex-=1;
      }

      var x= data.removeAt(oldIndex);
      data.insert(newIndex, x);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reorder listview'),
      ),
      body: Center(
        child: ReorderableListView(
            children: data.map((index)=>ListTile(key: ObjectKey(index),title: Text('${index}'),subtitle: Text('Move it anywhere'),)).toList(),
            onReorder: onreorder,
        ),
      ),
    );
  }
}
