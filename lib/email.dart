class Email {
  final String? id;
  final String sentFrom;
  final String content;
  final String subject;

  Email({
    this.id,
    required this.sentFrom,
    required this.content,
    required this.subject,
  });
}