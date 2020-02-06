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
  final items = List<String> .generate(20,(i)=>"Item ${i + 1}");

  void onreorder(int oldIndex, int newIndex){

    setState(() {
      if(newIndex>oldIndex){
        newIndex-=1;
      }

      var x= items.removeAt(oldIndex);
      items.insert(newIndex, x);
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
            children:
            items.map((index){
              return Dismissible(
                child: ListTile(key: ObjectKey(index),title: Text('${index}'),subtitle: Text('Move it anywhere'),
                ),
                  direction: DismissDirection.endToStart,
                  background: Container(color: Colors.red),
                  secondaryBackground: _secondBackground(),
                  movementDuration: Duration(seconds: 2),
                  key: Key(index),
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    print('direction $direction');
                  });
                  // Then show a snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$items dismissed")));
                },

              );
            }).toList(),

            onReorder: onreorder,
        ),
      ),
    );
  }

  _secondBackground() {
    return Container(
      margin: EdgeInsets.all(12.0),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(icon: Icon(Icons.delete), onPressed: (){
        setState(() {
          items.removeLast();

        });
      }),
    );
  }
}
