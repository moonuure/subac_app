import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterLoginScreen extends StatefulWidget {
  @override
  State<RegisterLoginScreen> createState() => _RegisterLoginScreenState();
}

class _RegisterLoginScreenState extends State<RegisterLoginScreen> {
  /*
 declaring gloobal fireabse objects
*/
  final _fireabaseAuth = FirebaseAuth.instance;
  final _firebaseFireStorage = FirebaseFirestore.instance;

  // link of default iamge url of the person and he can update later in the profile section
  final String profile_url =
      "https://tse4.mm.bing.net/th?id=OIP.jixXH_Els1MXBRmKFdMQPAHaHa&pid=Api&P=0&h=180";

  /*
  * variables that store us information of textfields
  * each one stores specific TextField as per name
  * email for email textfield and so on,
  */
  String _emailController = "";
  String _passwordController = "";
  String _phonoController = "";
  String _nameController = "";

  /*
  * this variable tells us weather we are in login mode or register mode.
  *by default every program/app starts login page then you can hit or press
  * other buttons or links to go another page.
  */
  bool _isLogin = true;

  /*
  * is the key form which for FormState type for storing and saving textFieldForms
  */
  final _formState = GlobalKey<FormState>();

  /* 
  * this is the variable that allows us to do loading screen when going to the home screen or 
  * dashoboard by hididng the keyboard and button then if there is error it hides it's selft
  * the button and keyboard will appear to be another chance for the user to input a data.
  * by default is false because it will be true when user press or click the button.
    */
  bool _isAuthenticating = false;

  /* 
  *function that returns texfield with dynamic values through parameters
  */
  Widget _buildTextField(
      {required bool isHiddenPassowrd,
      required String hintText,
      required Function(String value) validateInput,
      required void Function(String valueToBeSave) saveValue,
      required TextInputType keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextFormField(
        obscureText: isHiddenPassowrd,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            labelText: hintText,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 49, 202, 169))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 49, 202, 169))),
            fillColor: Colors.white,
            labelStyle: TextStyle(color: Colors.grey, fontSize: 30)),
        validator: (input) => validateInput(input!),
        onSaved: (enteredValue) => saveValue(enteredValue!),
      ),
    );
  }

  /*
  * this is only Function that is designed for phono textfiled only
  */
  Widget _buildPhonoTextField(
      {required String hintText,
      required String valueHolder,
      required Function(String valueToBeValida) validateValue,
      required String Function(String valueToBeSave) saveValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: IntlPhoneField(
        obscureText: false,
        validator: (valueToBeValidate) =>
            validateValue(valueToBeValidate.toString()),
        onSaved: (valueToBeSave) => saveValue(valueToBeSave.toString()),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 49, 202, 169))),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Color.fromARGB(255, 49, 202, 169))),
            labelText: hintText,
            labelStyle: TextStyle(fontSize: 25, color: Colors.grey),
            border: OutlineInputBorder(borderSide: BorderSide())),
      ),
    );
  }

  /*
  * this is the function that checks if all validations of each textfile
  * is correct and valid then saves that data into the previous variables 
  * that we have named like _emailcontroller and e.t.c using _formState object with function
  * save .
  * the function _formState.currentState!.validate() -- retuns true if all validators
  * return null which is not error for textfiled otherwise returns false
  * if there is one textfield which retuns error.
  */
  _saveData() async {
    final isValid = _formState.currentState!.validate();

    // if it retuns true then save to the corresponding variables.
    if (isValid) _formState.currentState!.save();

    if (isValid) {
      setState(() {
        _isAuthenticating = true;
        FocusScope.of(context)
            .unfocus(); // this closes if there is open keyboard
      });
      // is login case we validate informaiton
      if (_isLogin) {
        try {
          await _fireabaseAuth.signInWithEmailAndPassword(
              email: _emailController, password: _passwordController);
        } catch (exception) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(exception.toString())));
        }
      } else {
        final _userCredential =
            await _fireabaseAuth.createUserWithEmailAndPassword(
                email: _emailController, password: _passwordController);

        await _firebaseFireStorage.collection("userinformation").add({
          "email": _emailController,
          "password": _passwordController,
          "phono": _phonoController,
          "userid": _userCredential.user!.uid,
          "name": _nameController,
          "profile_url": profile_url
        });
      }

      if (mounted)
        setState(() {
          _isAuthenticating = false;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: BackButton(color: Color.fromARGB(255, 56, 221, 144)),
        title: Text(
          "Create Account ",
          style: TextStyle(color: Color.fromARGB(255, 56, 221, 144)),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: !_isLogin ? 60 : 180),
              if (!_isLogin)
                _buildTextField(
                  hintText: "Name",
                  isHiddenPassowrd: false,
                  keyboardType: TextInputType.name,
                  validateInput: (enetedValue) {
                    if (enetedValue.isEmpty) return "Field* name is compulsory";
                    return null;
                  },
                  saveValue: (valueToBeSave) => _nameController = valueToBeSave,
                ),
              _buildTextField(
                hintText: "Email",
                isHiddenPassowrd: false,
                keyboardType: TextInputType.emailAddress,
                validateInput: (enteredEmail) {
                  if (enteredEmail.isEmpty) return "Field* email is compulsory";

                  if (!enteredEmail.contains("@"))
                    return "Please Enter Valid email with @";
                  return null;
                },
                saveValue: (valueToBeSave) => _emailController = valueToBeSave,
              ),
              _buildTextField(
                hintText: "Passowrd",
                isHiddenPassowrd: false,
                keyboardType: TextInputType.name,
                validateInput: (enteredPassowrd) {
                  if (enteredPassowrd.isEmpty)
                    return "Password field* is compulsory!";

                  return null;
                },
                saveValue: (valueToBeSave) =>
                    _passwordController = valueToBeSave,
              ),
              if (!_isLogin)
                _buildPhonoTextField(
                  hintText: "Phono Number",
                  valueHolder: _phonoController,
                  validateValue: (valueToBeValida) {
                    if (valueToBeValida.isEmpty)
                      return "Phone Field is compulsory!";
                    return null;
                  },
                  saveValue: (valueToBeSave) =>
                      _phonoController = valueToBeSave,
                ),
              if (!_isAuthenticating)
                GestureDetector(
                  onTap: _saveData,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(horizontal: 34),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 49, 202, 169),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: Text(
                      _isLogin ? "Login Account" : "Create Account",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
                  ),
                ),

              // this loading will appear only when is someone clis the button
              if (_isAuthenticating) SizedBox(height: 30),
              if (_isAuthenticating)
                CircularProgressIndicator(
                    color: Color.fromARGB(255, 49, 202, 169)),
              if (_isAuthenticating == false)
                TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin
                          ? "I Dont have Account?"
                          : "I have Already Account?",
                      style: GoogleFonts.firaCode().copyWith(
                        fontSize: 20,
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
