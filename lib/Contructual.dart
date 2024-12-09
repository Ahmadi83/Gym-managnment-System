
import 'package:final_project/Add_Contructual.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_page.dart';



class Contructual extends StatefulWidget {
  const Contructual({super.key});

  @override
  State<Contructual> createState() => _MyAppState();
}

class _MyAppState extends State<Contructual> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => main_page(),));},
        child: Icon(Icons.home_outlined,size: 30,),splashColor: Colors.red,),

      appBar: AppBar(
        toolbarHeight: 70,
        title: Text('Contructual',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Team List:',style: TextStyle(fontSize: 20),),
                SizedBox(width: 10,),

                CircleAvatar(
                  radius: 22,
                  child: Text('3',style: TextStyle(fontSize: 25),),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top:1,left: 110),
                  child: Column(
                    children: [
                      Text('Add Contructual'),
                      IconButton(
                        icon:Icon(Icons.add_circle_outline,
                          size: 50,color: Colors.blue,),
                       onPressed: (){
                          setState(() {
                          });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Add_contruct(),));
                      },
                      ),],),
                ),
              ],
            ),
          ),
          Divider(endIndent: 5,indent: 5,color: Colors.black54,),

          Expanded(
            child: ListView.builder(itemCount: 3,itemBuilder: (context, index) {
             return Padding(
               padding: const EdgeInsets.all(8.0),
               child:Container(
                 height: 150,
                 decoration: BoxDecoration(
                   color: Colors.orange[200],
                   border: Border.all(),
                   borderRadius: BorderRadius.circular(15),
                 ),

                 child:Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Column(
                     children: [
                       Row(
                         children: [
                           Make_Text('Name', 25),
                           SizedBox(width: 180,),
                           Make_Text('Time', 20)
                         ],
                       ),
                       SizedBox(height: 40,),

                       Row(
                         children: [
                           Make_Text('Date', 20),
                           SizedBox(width: 35,),
                           Make_Text('Ex_Date',20)
                         ],
                       )
                     ],
                   ),
                 ),
               )
             );
            },),
          )
        ],
      )
    );
  }

   Make_Text(String text,double size){
   return Text('$text',style: TextStyle(fontSize: size),);
  }

}
