import 'package:flutter/material.dart';

void main (){

  runApp(
   MaterialApp(
        home: Principal() ,
   ), 
  );
}


class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

List lista = [
   "ola",
   "meu",
   "consagrado"
];


class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

 appBar: AppBar(
     title: Text("Widget Dismissible"),
 ),
        body: Container(
      
      padding: EdgeInsets.all(32),
      width: double.infinity ,
      child: Column(
        children:[
         Expanded(child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context,index){
            
              final item = lista[index];
            
            
              return  Dismissible(
               background: Container(color: Colors.green,
               padding: EdgeInsets.all(16),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Icon(Icons.edit,
                   color:Colors.white ,
                   )
                 ],
               ),
               ),
               secondaryBackground: Container(color: Colors.red,
               padding: EdgeInsets.all(16),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.end,
                 children: [
                   Icon(Icons.delete_outline,
                   color: Colors.white,
                   ) 
                 ],
               ),
               ),
                onDismissed: (direction){

                 
                    
                    if(direction == DismissDirection.endToStart){
                          print("direção lixeira:" + direction.toString());
                    } else if (direction == DismissDirection.startToEnd){
                          print("direção editar:" + direction.toString());
                    }
                
                 setState(() {
                     lista.removeAt(index);
                 });
                    
                },
              
                key: Key(item),
               child: ListTile(
                    title: Text(item),
               )
               );
            }
            ), 
            ),
         

        ],
      ), 
    ),
    ); 
  }
}