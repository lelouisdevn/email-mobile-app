import 'package:flutter/material.dart';

class User {
  final String? id;
  final String userID;
  final String mailAddr;
  final String password;

  User({
    this.id,
    required this.userID,
    required this.mailAddr,
    required this.password,
  });
}
