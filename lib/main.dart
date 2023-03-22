import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MaterialApp(home: MyApp(),));


}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [


                      Padding(padding: EdgeInsets.only(bottom: 8, top: MediaQuery.of(context).size.height*0.17,),
                      child: Stack(
                      children: [
                      Container(

                        width: MediaQuery.of(context).size.width*0.95,
                        height: MediaQuery.of(context).size.height-(MediaQuery.of(context).size.height*0.19),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),

                        child: Column(


                            children:[

                              Transform.translate(
                              offset: Offset(0, MediaQuery.of(context).size.height*0.12*(-1)), // move the image up
                              child: Image.asset(
                                'assets/images/profilepic.png',
                                height: 200,
                                width: 200,
                                fit: BoxFit.none,
                              ),

                            ),

                Transform.translate(
                  offset: Offset(0, MediaQuery.of(context).size.height*0.12*(-1)), // move the image up

                             child: Column(
                              children:
                              [Title(color: Colors.black, child: Text("ZOSIMO D. BINIZA III", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)),
                              Text("Full Stack Developer", style: TextStyle(fontSize: 15)),
                              Text("Graphics Designer", style: TextStyle(fontSize: 15)),
                              Text("Video Editor", style: TextStyle(fontSize: 15)),
                              Text("\nScan to see Portfolio", style: TextStyle(fontSize: 15)),
                              Image.asset(
                                'assets/images/qr.png',
                                height: 255,
                                width: 280,
                                fit: BoxFit.none,
                              ),
                              Text("Or click this:", style: TextStyle(fontSize: 15)),
                                ElevatedButton(
                                  onPressed: _launchURL,
                                  child: Text('Portfolio'),
                                ),
                                Text("\n09483938872\n", style: TextStyle(fontSize: 15)),


                                Container(
                                  width: double.infinity,
                                  height: 28,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/icons/fb.png", height: 30, width: 40,),
                                      Image.asset("assets/icons/ig.png", height: 30, width: 40,),
                                      Image.asset("assets/icons/li.png", height: 30, width: 40,),
                                    ],
                                  ),
                                ),


                           ] ),),


                        ]
                        ),),

                      ]),),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

_launchURL() async {
  const url = 'https://zosimobiniza.wixsite.com/zosimobiniza';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}