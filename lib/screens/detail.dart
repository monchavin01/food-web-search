import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  final data;
  Detail({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              appBar(context),
              Container(
                padding: EdgeInsets.only(bottom: 32),
                width: Get.width * 0.5,
                child: Column(
                  children: [
                    data['image'] != ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              data['image'],
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              'http://teamtech24.com/foodhati/foodhatiAdmin/assets/img/foodimg/default-food-image.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                    SizedBox(height: 16),
                    data['description'] != ""
                        ? _buildLayoutDescription(
                            data['description'], 'วัตถุดิบ')
                        : Container(),
                    SizedBox(height: 16),
                    data['method'] != ""
                        ? _buildLayoutDescription(data['method'], 'วิธีการปรุง')
                        : Container()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  data['name'],
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2F2F3E)),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  Widget _buildLayoutDescription(String value, String title) {
    var resultValue = value;
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$title",
          style: TextStyle(
              height: 1.5,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Container(
          width: Get.width * 0.4,
          child: Text(
            "$resultValue",
            style: TextStyle(
              height: 1.5,
              color: Color(0xFF6F8398),
              fontSize: 16,
            ),
            maxLines: null,
            // softWrap: false,
          ),
        ),
      ],
    );
  }
}
