
class MessageItem{
   String? title;
  bool? error;
  MessageItem(
      {this.title,
      this.error,
       });
  MessageItem.fromMap(Map<String, dynamic> map) {
    title = map['Title'];
    error = map['Error'];
  }
  factory MessageItem.fromJson(Map<String, dynamic> json) {
    return MessageItem(
      title: json['Title'],
      error: json['Error'],
    );
  }
}