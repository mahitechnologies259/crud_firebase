import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  late String carModel;
  late String carColor;

  Future<bool> addDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
      builder: (BuildContext context){
          return AlertDialog(
            title: Text("Add Data", style: TextStyle(fontSize: 15),),
            content: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Car Name",
                  ),
                  onChanged: (value){
                    this.carModel = value;
                  },
                ),
                SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Enter Car Color",
                  ),
                  onChanged: (value){
                    this.carColor = value;
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    Map carData = {
                      'CarName':this.carModel,
                      'CarColor':this.carColor
                    };
                    // crudObj.addData()
                  },
                  child: Text(
                    "Add"
                  ),
              )
            ],
          );
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud Operations in Firebase"),
        actions: [
          IconButton(onPressed: (){
            addDialog(context);
          },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
