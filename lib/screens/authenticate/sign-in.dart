import 'package:flutter/material.dart';
import 'package:flutter_firebase/shared/constants.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // textfield state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold (
      appBar : AppBar (
        backgroundColor : appBarBackgroundColor,
        elevation : 0.0,
        title : Text (
          'Login',
          style : TextStyle(color: Colors.white),
        ),
        actions : [
          FlatButton.icon(
            icon : Icon(
              Icons.person,
              color : Colors.white,
            ),
            label : Text(
              'Join Us',
                style: TextStyle(color: Colors.white),
            ),
            onPressed : () {
              widget.toggleView();
            }
          ),
        ],
      ),
      body : Container (
        decoration : backgroundDecoration,
        padding : EdgeInsets.symmetric(
          vertical : 20.0,
          horizontal : 50.0,
        ),
        child : Form ( 
          key : _formKey,
          child : Column (
            children: [
              SizedBox (height : 20.0),
              TextFormField (
                decoration: textInputDecoration.copyWith(
                  hintText : 'Email'
                  ),
                validator : (value) => value.isEmpty ? 'Enter an Email' : null,
                onChanged : (value) {
                  setState(() => email = value);
                }
              ),
              SizedBox (height : 20.0),
              TextFormField (
                decoration: textInputDecoration.copyWith(
                  hintText : 'Password'
                ),
                obscureText : true,
                validator : (value) => value.length < 6 ? 'Enter a Password 6+ chars long' : null,
                onChanged : (value) {
                  setState(() => password = value);
                }
              ),
              SizedBox(height : 20.0),
              RaisedButton (
                onPressed: () async {
                  // check the form for empty spots and validity
                  bool emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(email);
                  if (emailValid) {
                    if (_formKey.currentState.validate()) {
                      setState(() => loading = true);
                      dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if (result == null) {
                        setState(() => error = 'Could not sign in with those credentials');
                        loading = false;
                      }
                    }
                  }
                  else setState(() => error = 'Please write a valid email!');
                }, 
                color : buttonColor,
                child : Text (
                  'SIGN IN',
                  style : TextStyle (
                    color : Colors.white
                  ),
                ),
              ),
              SizedBox(height : 12.0),
              Text (
                error,
                style : TextStyle (
                  color : Colors.red,
                  fontSize : 14.0,
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}