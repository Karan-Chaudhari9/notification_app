import 'package:cloud_firestore/cloud_firestore.dart';

class SwiperManager {
  List swiperList = [];
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection("swiper");

  Future getSwiper() async{
    try {
      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {
          swiperList.add(result.data());
        }
      });
      return swiperList;
    } catch (e) {
      print("$e===================");
      return e;
    }
  }
}
