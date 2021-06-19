import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Align(
          alignment: Alignment.bottomLeft,
          child: SizedBox(
            child: Text(
              // photo with some space
              "JogScape",
              style: TextStyle(
                  fontFamily: 'Dela Gothic One',
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Jogscape',
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 100)),
                ],
                onTap: () {},
                pause: const Duration(seconds: 5),
                isRepeatingAnimation: true,
                totalRepeatCount: 2,
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Coming Soon',
                    textStyle:
                        const TextStyle(color: Colors.white, fontSize: 50),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    width: 250,
                    child: ElevatedButton(
                        style: elevatedButtonStyle(Colors.transparent),
                        onPressed: () {
                          createAlertDialog(context);
                        },
                        child: Text(
                          "Pre-Register",
                          style: style(),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

createAlertDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Enter your Name"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return "Please type your correct name";
                      }
                    },
                    decoration: textfieldbasicDecoration("John Doe"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Enter your Phone"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: textfieldbasicDecoration("9414173314"),
                    validator: (value) {
                      if (value!.length != 10) {
                        return "Enter correct mobile number";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text("Enter your Mail-Id"),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: textfieldbasicDecoration("hello@gmail.com"),
                    controller: emailController,
                    validator: (value) {
                      if (!value!.contains('@')) {
                        return "Enter valid email";
                      }
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: ElevatedButton(
                        onPressed: () {
                          // print("Showing TOast in some time");
                          // Fluttertoast.showToast(
                          //     msg: "This is Center Short Toast",
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.CENTER,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0);
                          if (_formKey.currentState!.validate()) {
                            // print("Verification completed");
                          }
                        },
                        child: Text("submit".toUpperCase()),
                        style: elevatedButtonStyle(Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

style() {
  return const TextStyle(fontSize: 25, color: Colors.white);
}

elevatedButtonStyle(colore) {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(colore),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: const BorderSide(color: Colors.green))));
}

textfieldbasicDecoration(hint) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    hintText: hint,
  );
}
