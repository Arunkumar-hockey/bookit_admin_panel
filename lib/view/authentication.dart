import 'package:admin_panel/constants/style.dart';
import 'package:admin_panel/layout.dart';
import 'package:admin_panel/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationPage extends StatelessWidget {
   AuthenticationPage({Key key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset('assets/icons/logo.png',width:50),
                      ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text("Login",
                        style: GoogleFonts.roboto(
                            fontSize: 30, fontWeight: FontWeight.bold,color: blue)),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CustomText(
                      text: "Welcome back to the admin panel.",
                      color:green, size:20, weight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle:  TextStyle(color:blue),
                      hintText: "abc@domain.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: green),
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onSaved: (value) {
                    username.text = value;
                  },
                  validator: (value) {
                    if (value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:  TextStyle(color:blue),
                      hintText: "123",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: green),
                      borderRadius: BorderRadius.circular(20),
                  )),
                  onSaved: (value) {
                    password.text = value;
                  },
                  validator: (value){
                    if (value.isEmpty){
                      return 'Enter a valid password';
                    }
                    return null;
                  },
                ),
                 const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value){}),
                        const CustomText(text: "Remember Me", size: 15, weight: FontWeight.normal, color: Colors.black,),
                      ],
                    ),
                    CustomText(
                      text: "Forgot password?",
                      color: blue, weight: FontWeight.normal, size: 15,
                    )
                  ],
                ),
                  const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: (){
                    // if(formKey.currentState.validate()) {
                    //   print("Success");
                     Get.offAll(SiteLayout());
                    // } else {
                    //   print("failed....");
                    // }
                  },
                  child: Container(
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [blue,green]),
                    borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child:  const CustomText(
                      text: "Login",
                      color: Colors.white, size: 20, weight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
