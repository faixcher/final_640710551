import 'package:flutter/material.dart';

AppBar newMethod() => AppBar(
    backgroundColor: Colors.deepPurple,
    title: Center(
      child: Column(
        children: [
          Text(
            "Webby Fondue",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "ระบบรายงานเว็ปเลวๆ",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    ));
