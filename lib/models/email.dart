class Email {
  final String? id;
  // final String userID;
  String sentFrom;
  String sentTo;
  String content;
  String subject;
  // DateTime at;

  Email({
    this.id,
    // required this.userID,
    required this.sentFrom,
    required this.sentTo,
    required this.content,
    required this.subject,
    // required this.at,
  });
}