class ChatModel {
  final String id;
  final String senderId;
  final String receiverId;
  final String message;
  final String courseId;
  final DateTime timeStamp;
  final bool isRead;

  const ChatModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.courseId,
    required this.timeStamp,
    this.isRead = false,
  });

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] ?? "",
      senderId: map['senderId'] ?? "",
      receiverId: map['receiverId'] ?? "",
      message: map['message'] ?? "",
      courseId: map['courseId'] ?? "",
      timeStamp: DateTime.parse(map['timeStamp']),
      isRead: map['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'courseId': courseId,
      'timeStamp': timeStamp.toIso8601String(),
      'isRead': isRead,
    };
  }
}
