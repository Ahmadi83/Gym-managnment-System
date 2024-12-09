import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Add_Time.dart';
import 'Settings.dart';



class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _MyAppState();
}

class _MyAppState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,size: 35,),splashColor: Colors.greenAccent,
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Add_time(),));
        print('Add Time button Clicked');
      }),

      appBar: AppBar(
        title: Text('List Times',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => settings(),));
          print('Setting Button Clicked');
        },
          icon: Icon(Icons.settings,size: 30,),)
      ),


      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
              Circleavatar('Reports', Icon(Icons.report) ),
              Circleavatar('Contructual',Icon( Icons.repeat) ),
              Circleavatar('Competition', Icon( Icons.wine_bar) ),
              ]),
            SizedBox(height: 50,),
            Divider(color: Colors.black38,),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: DataTable(
                  border: TableBorder(right: BorderSide(width: 3),
                      left: BorderSide(width: 3),
                      bottom: BorderSide(width: 3),top: BorderSide(width: 3,)),
                  sortAscending: true,
                    dividerThickness: 2,
                    columns: [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Data')),
                      DataColumn(label: Text('State')),
                      DataColumn(label: Text('Type'))
                ],
                    rows: [
                      DataRow(cells: [
                        DataCell(Text('Ali')),
                        DataCell(Text('12:00')),
                        DataCell(Text('2008/8/20')),
                        DataCell(Text('X')),
                        DataCell(Text('Free')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Ali')),
                        DataCell(Text('12:00')),
                        DataCell(Text('2008/8/20')),
                        DataCell(Text('X')),
                        DataCell(Text('Free')),
                      ]),

                    ]),
              ),
            ),
          ],
        ),
      )
    );
  }



   Circleavatar(name,icon,){
   return Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$name',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: CircleAvatar(child: icon,radius: 50,),
        )
      ],);
  }
}
