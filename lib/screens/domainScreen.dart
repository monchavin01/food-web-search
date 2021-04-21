import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DomainScreen extends StatefulWidget {
  @override
  _DomainScreenState createState() => _DomainScreenState();
}

class _DomainScreenState extends State<DomainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Domain'),
        backgroundColor: Colors.black,
      ),
      body: Stack(children: [
        Image.asset(
          '/bg.jpeg',
          fit: BoxFit.fill,
          height: Get.height,
          width: Get.width,
        ),
        Center(
          child: Container(
            width: Get.width * 0.8,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ]),
            child: Text(
              DataMock.domain.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 24),
            ),
            // color: Colors.red,
          ),
        ),
      ]),
    );
  }
}

class DataMock {
  static var domain =
      "     ยุคสมัยนี้คอมพิวเตอร์เข้ามามีบทบาทในชีวิตประจำวันของเราอย่างมาก ไม่ว่าจะเป็นการทำงานการส่งงานในคอมพิวเตอร์ย่อมมีความสำคัญต่อการทำงาน ซึ่งการใช้งานคอมพิวเตอร์ไปนานๆ ทำให้เกิดความ เสียหายและปัญหาตามมาอยู่แล้ว ไม่ว่าจะเป็นปัญหาจากอุบัติเหตุ เช่น การกระแทก การโดนความชื้น แต่ส่วนมากที่เจอมักจะเป็นปัญหาจากการ เสื่อมสภาพของอุปกรณ์ภายในคอมพิวเตอร์ ปัญหาจากฮาร์ดแวร์ เช่น การโดนไวรัส การ error ของเครื่อง ปัญหา เหล่านี้สามารถแก้ไขได้ การแก้ไขเบื้องต้นของปัญหาที่เกิดขึ้นกับคอมพิวเตอร์ โดยส่วนมากผู้ใช้งานบางคนไม่ทราบวิธีแก้ไข หรือบางคนก็นำเครื่องไปหาช่างผู้เชี่ยวชาญ ซึ่งปัญหาบางอย่างเราสามารถแก้ไขเบื้องต้นได้ เพื่อไม่ให้เกิดการ  เสียเวลา เสียค่าใช้จ่ายและส่งผลเสียต่อข้อมูลสำคัญภายในเครื่องโดยการค้นหาวิธีแก้ไขผ่านอินเทอร์เน็ตแต่ผู้ใช้บางรายอาจจะค้นหาแล้วไม่เจอการแก้ปัญหา หรือหาการแก้ไขที่ไม่ตรงจุดกับอาการเสียบ้าง จึงทำให้เกิดความคิดที่จะนำเทคโนโยลี Ontology เพื่อมาทำการสร้างข้อมูลที่รวบรวมอาการเสียของคอมพิวเตอร์มาใช้ประโยชน์ในด้านนี้ช่วยให้ผู้ใช้งานสามารถ ค้นหาการแก้ไขได้อย่างถูกต้องมากยิ่งขึ้น";
}
