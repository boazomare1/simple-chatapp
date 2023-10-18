import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderEmail,
    required this.receiverId,
    required this.message,
    required this.timestamp,
    required this.senderId,
  });

  //convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderId':senderId,
      'senderEmail':senderEmail,
      'receriverId':receiverId,
      'message':message,
      'timestamp':timestamp
    };
  }
}
