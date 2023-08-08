import 'package:flutter/material.dart';
import 'package:test_1/views/home/widgets/navigationbar.dart';


onHome(context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: ((context) =>  Navbar())));
}
