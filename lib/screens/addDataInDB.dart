import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDataInDB extends StatefulWidget {
  @override
  _AddDataInDBState createState() => _AddDataInDBState();
}

class _AddDataInDBState extends State<AddDataInDB> {
  final firestoreInstance = FirebaseFirestore.instance;
  TextEditingController keyController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController methodController = TextEditingController();
  TextEditingController imageURLController = TextEditingController();

  var _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 64),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: keyController,
                  decoration: InputDecoration(
                    labelText: 'Key Search',
                    border: OutlineInputBorder(),
                    hintText: 'Enter Key Search',
                  ),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'อาการเสีย',
                    border: OutlineInputBorder(),
                    hintText: 'อาการเสีย',
                  ),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'สาเหตุ',
                    border: OutlineInputBorder(),
                    hintText: 'สาเหตุ',
                  ),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: methodController,
                  decoration: InputDecoration(
                    labelText: 'วิธีแก้',
                    border: OutlineInputBorder(),
                    hintText: 'วิธีแก้',
                  ),
                  maxLines: null,
                ),
              ),
              RaisedButton(
                onPressed: () => {
                  _onPressed(context),
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }

  validateNotNull(value) {
    if (value == null || value.isEmpty) {
      return 'โปรดกรอกข้อมูล';
    }
    return null;
  }

  List<String> resultFormatKey;
  List<String> formatKey() {
    return resultFormatKey = keyController.text.split("-");
  }

  test() {
    String number = keyController.text;
    List<String> listnumber = number.split("");
    List<String> output = [];
    for (int i = 0; i < listnumber.length; i++) {
      if (i != listnumber.length - 1) {
        output.add(listnumber[i].toString());
      }
      List<String> temp = [listnumber[i]];
      for (int j = i + 1; j < listnumber.length; j++) {
        temp.add(listnumber[j]);
        output.add(temp.join().toString());
      }
    }
    return resultFormatKey = output;
  }

  void _onPressed(BuildContext context) {
    test();
    firestoreInstance.collection("computer-repair").add({
      "searchKey": resultFormatKey,
      "name": nameController.text,
      "description": descriptionController.text,
      "method": methodController.text,
    }).then((value) {
      _showMyDialog(context);
    });
  }

  Future _showMyDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('เพิ่มข้อมูลเรียบร้อย'),
          actions: <Widget>[
            TextButton(
              child: Text('ตกลง'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
