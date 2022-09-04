import 'package:fake_store/Dashboard.dart';
import 'package:fake_store/Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closesplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: Image.asset('assets/logo.png'),
              ),
              Text('Fake Store',style: TextStyle(color:colors.primary,fontSize:19,fontWeight:FontWeight.bold,fontFamily: GoogleFonts.nunito().fontFamily),)
            ],
          ),
        ),
      ),
    );
  }

  Future<void> closesplash() async {
    Future.delayed(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
    });
  }

}
