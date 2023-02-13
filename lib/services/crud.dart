import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class crudMethods{
  bool isLoggedIn(){
    if (FirebaseAuth.instance.currentUser != null ){
      return true;
    }
    else{
      return false;
    }
  }

  void addData(carData){
    if(isLoggedIn()){
      FirebaseFirestore.instance.collection("textcrud").add(carData)
          .catchError((e){
            print(e);
      });
    } else {
      print("You need to be logged in");
    }
  }
}