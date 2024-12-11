import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _MyAppState();
}

class _MyAppState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Settings',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyList_Tile('Dark Mode', Icons.dark_mode,ontop: (){}),
          Divider(color: Colors.black45,endIndent: 5,indent:  5,),
          MyList_Tile('About', Icons.person,ontop: (){}),
          Divider(color: Colors.black45,endIndent: 5,indent:  5,),
          MyList_Tile('Language', Icons.language,ontop: (){}),
          Divider(color: Colors.black45,endIndent: 5,indent:  5,),
          MyList_Tile('Share', Icons.share,ontop: (){}),
          Divider(color: Colors.black45,endIndent: 5,indent:  5,),

        ],
      )
    );
  }
  
 MyList_Tile(title, icon,{ontop}){
   return ListTile(
     minTileHeight: 100,
      title: Text(title,style: TextStyle(fontSize: 30),),
      trailing: Icon(icon,size: 30,),
      onTap: ontop,
    );
  }
  
  
}
