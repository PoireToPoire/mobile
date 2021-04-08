import 'package:flutter/material.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({
    Key key,
    this.onSubmit,
    this.forgetPassword,
  }) : super(key: key);

  final Function onSubmit;
  final Function forgetPassword;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 5),
      child: Row(
        children: [
          TextButton(
            onPressed: forgetPassword,
            child: Text("Mot de passe oublié",
                style: TextStyle(color: Colors.white)),
          ),
          Spacer(),
          IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              onPressed: onSubmit)
        ],
      ),
    );
  }
}
