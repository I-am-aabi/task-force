import 'package:flutter/cupertino.dart';

class SignupText extends StatelessWidget {
  const SignupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        
        children: const [
          SizedBox(height: 20,),
          Text(
            'Sign up',
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 200,
            child: Text(
              'Signup to start using our application',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}