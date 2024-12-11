import 'package:final_project/Add_Time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';



class Add_contruct extends StatefulWidget {
  const Add_contruct({super.key});

  @override
  State<Add_contruct> createState() => _MyAppState();
}

class _MyAppState extends State<Add_contruct> {

  TextEditingController name_controll = TextEditingController();
  TextEditingController time_controll = TextEditingController();
  TextEditingController date_controll = TextEditingController();
  TextEditingController Ex_Date_contoll=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_page(),));},
        child: Icon(Icons.home_outlined,size: 30,),splashColor: Colors.red,),

      appBar: AppBar(
        title: Text('Add_contructual',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AddBox().text_filds(1, 'T_Name', name_controll),
          AddBox().text_filds(2, "Time",time_controll),
          AddBox().text_filds(3, 'Date', date_controll),
          AddBox().text_filds(4, 'Expire_Date', Ex_Date_contoll),
          MaterialButton(onPressed: (){

          },
            child: Text('Save'),
            height: 40,minWidth: 100,
            color: Colors.greenAccent,
            splashColor: Colors.red,
            highlightColor: Colors.blue,
          )
        ],
      )
    );
  }
}
