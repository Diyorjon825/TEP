import 'package:cloud_firestore/cloud_firestore.dart';

class Api {
  static Future<List<Map<String, dynamic>>> getInfo() async {
    var list = <Map<String, dynamic>>[];
    await FirebaseFirestore.instance
        .collection('doctor')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) {
        final first = element.data() as Map<String, dynamic>;
        final second = first['Doctors'] as Map<String, dynamic>;
        list.add(second);
      });
    });
    return list;
  }
}
