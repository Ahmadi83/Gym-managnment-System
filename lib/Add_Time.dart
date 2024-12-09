import 'package:final_project/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Add_time extends StatefulWidget {
  const Add_time({super.key});

  @override
  State<Add_time> createState() => _MyAppState();
}

class _MyAppState extends State<Add_time> {

 TextEditingController name_controller = TextEditingController();
 TextEditingController Time_controller = TextEditingController();
 TextEditingController Date_controller = TextEditingController();
 TextEditingController price_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.orange[100],
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_page(),));},
        child: Icon(Icons.home_outlined,size: 35,),splashColor: Colors.red,),

      appBar: AppBar(
        title: Text('Add Time',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),


      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AddBox().text_filds(1,'Name',name_controller),
          AddBox().text_filds(2, 'Time', Time_controller),
          AddBox().text_filds(3, 'Date', Date_controller),
          AddBox().text_filds(4, 'price', price_controller),

          MaterialButton(onPressed: (){
            print(name_controller.text);
            print(Time_controller.text);
            print(Date_controller.text);
            print(price_controller.text);},

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




class AddBox {
  TextEditingController t_name_controll = TextEditingController();
  TextEditingController time_controll = TextEditingController();
  TextEditingController date_controll = TextEditingController();
  TextEditingController price_controll = TextEditingController();

  text_filds(int f_number,String text_lable,TextEditingController control){
   return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15,bottom: 15,left: 20,right: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue[200],
                child: Text('$f_number',style: TextStyle(fontSize: 30),),),
              SizedBox(width: 10,),

              Expanded(
                child: TextField(
                  controller: control,
                  decoration: InputDecoration(
                    label: Text('$text_lable'),
                   border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(10),
                   )
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}