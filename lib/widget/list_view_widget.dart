import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_listview/data/list_items.dart';
import 'package:flutter_listview/model/Items.dart';

class ListViewWidget extends StatelessWidget {
  final Items items;
  final Animation<double> animation;
  final VoidCallback? onClicked;

  const ListViewWidget({required this.items,
    required this.animation,
    this.onClicked,
    Key? key}) :super(key: key);

  // xoá theo chiều ngang
  // @override
  // Widget build(BuildContext context) => SlideTransition(
  //   position: Tween<Offset>(
  //     begin: Offset(-1, 0),
  //     end: Offset.zero,
  //   ).animate(CurvedAnimation(parent: animation, curve: CurvedAnimation(
  //
  //   ))),
  //   child: buildItem(),);
  @override
  Widget build(BuildContext context) => SizeTransition(
    sizeFactor: animation,
    child: buildItem(),);

  Widget buildItem()=> Container(
    margin: EdgeInsets.all(8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white70,
    ),
    child: ListTile(
      contentPadding: EdgeInsets.all(15),
      leading: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(items.urlImage),
      ),
      title: Text(
        items.title, style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete, color: Colors.redAccent, size: 32,),
        onPressed: (onClicked),
      ),
    ),
  );
}
