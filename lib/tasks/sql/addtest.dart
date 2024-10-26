import 'package:flutter/material.dart';
import 'package:projects/core/design/app_button.dart';
import 'package:projects/core/design/app_input.dart';
import 'package:projects/core/logic/helper_methods.dart';
import 'package:projects/tasks/sql/model.dart';
import 'package:projects/tasks/sql/sqlhelper.dart';
import 'package:projects/tasks/sql/view.dart';
import 'package:projects/views/tranquility/onboard1.dart';

class AddProductView extends StatefulWidget {


  final TestModel? model;
  const AddProductView({super.key, this.model});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final priceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if(widget.model != null){
      nameController.text =widget.model!.name;
      desController.text =widget.model!.des;
      priceController.text =widget.model!.price.toString();
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.model!=null?"Edit Product":"Add New Product")),
      body: SafeArea(
        child: SingleChildScrollView(
           padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppInput(label: "Name",controller: nameController),
              SizedBox(height: 16,),
              AppInput(label: "Descreption",controller: desController),
              SizedBox(height: 16,),
              AppInput(label: "Price",controller: priceController),
              SizedBox(height: 16,),
              AppButton(text: widget.model!=null?"Edit":"Save", onPressd: () async{
                final model = TestModel(name: nameController.text,
                    des: desController.text,
                    price: num.tryParse(priceController.text)??0);
                if(widget.model!=null){
                  await SqlHelper.updateProduct(widget.model!.id,model);
                  navigateTo(TestssView());
                }else{
                  await SqlHelper.insertProduct(model);
                  showMessage("Saved Success",messageType: MessageType.Success);
                }

              },)
            ],
          ),
        ),
      ),
    );
  }
}
