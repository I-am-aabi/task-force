import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PolicyDialog extends StatelessWidget {
  PolicyDialog({super.key, this.radius = 8, required this.mdfilename})
      : assert(mdfilename.contains('.md'));
  final double radius;
  final String mdfilename;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future:
                Future.delayed(const Duration(microseconds: 150)).then((value) {
              return rootBundle.loadString('assets/$mdfilename');
            }),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('NO Data');
              }
              if (snapshot.hasError) {}
              return const CircularProgressIndicator(
                color: Colors.blue,
              );
            },
          )),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'))
        ],
      ),
    );
  }
}
