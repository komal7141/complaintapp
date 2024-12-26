import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostelapplication/logic/modules/chat_model.dart';

class ChatFirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveChat(ChatModel chat) {
    return _db.collection('Chat').doc(chat.id.toString()).set(chat.createMap());
  }

  Stream<List<Map<String, dynamic>>> getChat() {
    return _db
        .collection('Chat')
        .orderBy("Date", descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((document) => document.data()).toList());
  }


}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hostelapplication/logic/modules/chat_model.dart';

// class ChatFirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   Future<void> saveChat(ChatModel chat) async {
//     try {
//       final docId = chat.id ?? _db.collection('Chat').doc().id;
//       await _db.collection('Chat').doc(docId).set(chat.createMap());
//     } catch (e) {
//       // Handle or log the error
//       throw Exception("Failed to save chat: $e");
//     }
//   }

//   Stream<List<ChatModel>> getChat() {
//     return _db
//         .collection('Chat')
//         .orderBy("Date", descending: true)
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((document) {
//               final data = document.data();
//               return ChatModel.fromMap(data);  // Assuming ChatModel has a fromMap constructor
//             }).toList());
//   }
// }

