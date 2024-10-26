import 'package:flutter/material.dart';
import 'package:projects/core/design/app_image.dart';
import 'package:projects/core/logic/app_theme.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/tasks/sql/model.dart';
import 'package:projects/tasks/sql/sqlhelper.dart';
import 'package:projects/views/tranquility/onboard1.dart';

import 'addtest.dart';

class TestssView extends StatefulWidget {
  const TestssView({super.key});

  @override
  State<TestssView> createState() => _TestssViewState();
}

class _TestssViewState extends State<TestssView> {
  List<TestModel>? list;
  @override
  void initState() {
    getData();
  }
  Future<void> getData()async{
    list=null;
    list=await SqlHelper.getProduct();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          navigateTo(AddProductView()).then((value) {
            getData();
          },);
        },child: Icon(Icons.add)),
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: list==null?Center(child: CircularProgressIndicator(),)
            :ListView.separated(itemBuilder: (context, index) => _Item(model: list![index],
            onDelete:()async {
              await SqlHelper.deleteProduct(list![index].id);
             getData();
            }, onEdit: () {
              navigateTo(AddProductView(model: list![index],)).then((value) => (value) {
                getData();
              });
            },),
            separatorBuilder:(context, index) => SizedBox(height: 20),
            padding: EdgeInsets.all(16),
            itemCount: list!.length),
      ),
    );
  }
}
class _Item extends StatelessWidget {
  final TestModel model;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  const _Item({super.key, required this.model, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onEdit ,
      title: Text(model.name,style: TextStyle(
          color: AppTheme.primary,fontSize: 18,
          fontWeight:FontWeight.w600
      )),
      subtitle: Text(model.des,style: TextStyle(
          fontSize: 16,

      )),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
          children: [Text(model.price.toString()+"\$",style: TextStyle(
              color: Colors.green,fontSize: 18,
              fontWeight:FontWeight.w600
          )),
            SizedBox(width: 16,),
            IconButton(onPressed: onDelete, icon: Icon(Icons.delete,color: Colors.red,))
          ]),
    );
  }
}
