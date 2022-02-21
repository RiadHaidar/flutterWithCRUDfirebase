import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home:MyHomePage() ,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final FirestoreFirestore firestore = Firestore.instance;
//  Firebase.initializeApp();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   
   
   void _create() async{

    try{
 await firebaseFirestore.collection("users").doc("testUserYY").set({
'firstName': 'testYY', 
'lastName' : 'userYY',

 });


    }catch(e){print(e);}

   }

    void _read()  async{

      DocumentSnapshot snapshot;
      try{
       final dataX = await firebaseFirestore.collection('users').doc('testUser').get();
        snapshot = dataX;
        print(snapshot.data());
      }catch(e){print(e);}
    } 

    void _update()  async{try{
      firebaseFirestore.collection('users').doc('testUser').update({'firstName' : 'Riad Asef', 
      'lastName': 'Haidar'});




    }catch(e){print(e);}} 

    void _delete()  async{try{

      firebaseFirestore.collection('users').doc('testUserXX').delete();
    }catch(e){print(e);}}

  
  
  @override
  Widget build(BuildContext context) {

    return Scaffold( 
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
          Center(child: Column(children: [ElevatedButton(onPressed:(){
            _create();
          }, child:Text('create')),
             ElevatedButton(onPressed:(){ 
               _read();
             }, child: Text('read')),
                ElevatedButton(onPressed: (){
                  _update();
                }, child: Text('update')),
                   ElevatedButton(onPressed: (){
                     _delete();
                   }, child: Text('delete')), ],),),
          

        ],
      ),
    );
  }
}
