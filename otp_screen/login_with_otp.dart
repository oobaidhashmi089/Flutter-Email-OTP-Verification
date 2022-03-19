import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:velocity_x/velocity_x.dart';
// import 'package:email_auth_example/auth.config.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool submitValid = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  static const primaryColor = Color(0xff4338CA);
  static const secondaryColor = Color(0xff6D28D9);
  static const accentColor = Color(0xffffffff);
  static const double borderRadius = 15;
  late EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = new EmailAuth(
      sessionName: "Sample session",
    );
  }

  void sendOtp() async {
    bool result = await emailAuth.sendOtp(
        recipientMail: _emailController.value.text, otpLength: 5);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  void verify() {
    print(emailAuth.validateOtp(
        recipientMail: _emailController.value.text,
        userOtp: _otpController.value.text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.purple, Colors.orange]))),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome").text.bold.size(21).make(),
                HeightBox(40),
                _textfeild(context).centered(),
                HeightBox(40),
                // button(context),

                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      gradient: const LinearGradient(
                          colors: [primaryColor, secondaryColor])),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        alignment: Alignment.center,
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(
                                right: 75, left: 75, top: 15, bottom: 15)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(borderRadius)),
                        )),
                    onPressed: () {
                      sendOtp();
                    },
                    child: Text(
                      "Send Otp",
                      style: const TextStyle(color: accentColor, fontSize: 16),
                    ),
                  ),
                ),
                HeightBox(30),
                _textfeild2(context),

                HeightBox(30),

                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      gradient: const LinearGradient(
                          colors: [primaryColor, secondaryColor])),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        alignment: Alignment.center,
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(
                                right: 75, left: 75, top: 15, bottom: 15)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(borderRadius)),
                        )),
                    onPressed: () {},
                    child: Text(
                      "Verify Otp",
                      style: const TextStyle(color: accentColor, fontSize: 16),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _textfeild(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Color.fromARGB(255, 250, 243, 243).withOpacity(.1)),
      ]),
      child: TextField(
        controller: _emailController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style:
            const TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: Color.fromARGB(255, 2, 49, 179),
          ),
          filled: true,
          hintText: 'Enter your email',
          hintStyle:
              TextStyle(color: Color.fromARGB(255, 5, 21, 66).withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
        ),
      ),
    );
  }

  Widget _textfeild2(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Color.fromARGB(255, 250, 243, 243).withOpacity(.1)),
      ]),
      child: TextField(
        controller: _otpController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style:
            const TextStyle(fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.email,
            color: Color.fromARGB(255, 2, 49, 179),
          ),
          filled: true,
          hintText: 'Enter your email',
          hintStyle:
              TextStyle(color: Color.fromARGB(255, 5, 21, 66).withOpacity(.75)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(21.0)),
          ),
        ),
      ),
    );
  }
}

Widget button(BuildContext context) {
  return Container(
    height: 50,
    width: 250,
    child: AspectRatio(
      aspectRatio: 208 / 71,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              color: Color(0x4960F9).withOpacity(.3),
              spreadRadius: 4,
              blurRadius: 50)
        ]),
        child: MaterialButton(
          onPressed: () {},
          splashColor: Colors.lightBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(36)),
          padding: const EdgeInsets.all(0.0),
          child: Ink(
              decoration: BoxDecoration(
                //gradient:
                image: DecorationImage(
                  image: NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2FbuttonBackgroundSmall.png?alt=media&token=fa2f9bba-120a-4a94-8bc2-f3adc2b58a73"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Container(
                  constraints: const BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 36.0), // min sizes for Material buttons
                  alignment: Alignment.center,
                  child: Text("Login With OTP",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w300))
                      .text
                      .bold
                      .make())),
        ),
      ),
    ),
  );
}

         
      

 

//@override
// Widget button2(BuildContext context) {
//   final TextEditingController textController = TextEditingController();

//   _auth(BuildContext context) async {
//     var token = await Magic.instance.auth
//         .loginWithSMS(phoneNumber: textController.text);
//   }

//   const primaryColor = Color(0xff4338CA);
//   const secondaryColor = Color(0xff6D28D9);
//   const accentColor = Color(0xffffffff);
//   const double borderRadius = 15;
//   return DecoratedBox(
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(borderRadius),
//         gradient: const LinearGradient(colors: [primaryColor, secondaryColor])),
//     child: ElevatedButton(
//       style: ButtonStyle(
//           elevation: MaterialStateProperty.all(0),
//           alignment: Alignment.center,
//           padding: MaterialStateProperty.all(
//               const EdgeInsets.only(right: 75, left: 75, top: 15, bottom: 15)),
//           backgroundColor: MaterialStateProperty.all(Colors.transparent),
//           shape: MaterialStateProperty.all(
//             RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(borderRadius)),
//           )),
//       onPressed: () {
//         _auth(context);
//       },
//       child: Text(
//         "text",
//         style: const TextStyle(color: accentColor, fontSize: 16),
//       ),
//     ),
//   );
// }








// class GoogleBtn1 extends StatelessWidget {
// final Function() onPressed;
//   const GoogleBtn1({
// required this.onPressed,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 54,
//         margin: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.white,
//         ),
//         child: TextButton(
//           style: ButtonStyle(
//             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.network(
//                 "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
//                 width: 20,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               const Text("Google",
//                   style: TextStyle(color: Colors.black, fontSize: 16)),
//             ],
//           ),
//           onPressed: onPressed,
//         ));
//   }
// }
    // imageUrl: "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/backgrounds%2Fgradienta-7brhZmwXn08-unsplash.jpg?alt=media&token=ea7ee065-0bb3-4184-8baf-9188d268f075"


