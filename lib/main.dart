import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:splashscreen/splashscreen.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apuestas Online',
      theme: ThemeData(
         primaryColor: Colors.purple,
         accentColor: Colors.orange,

      ),
      home: Welcomescreen(),
    );
  }
}




class Welcomescreen extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Welcomescreen> {
  @override
  Widget build(BuildContext context) {

      return new SplashScreen(
      seconds: 10,
      navigateAfterSeconds: new MyHomePage(title: 'Apuestas online'),
      
      title: new Text('🚀La Pasion del Futbol nos une⚽',
      style: new TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.italic,
      ),),
      image: new Image.asset('assets/instagramlogo.png'),
      backgroundColor: Color(0xFF2F689B),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("LAS MEJORES APUESTAS DE COLOMBIA"),
      loaderColor: Colors.white,
    );
    
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  WebViewController _webViewController;

   dynamic _incrementCounter() {
    setState(() {
      _webViewController.loadUrl("https://youtube.com");
    });
   }
   
  dynamic _goAtras() {
    setState(() {
      _webViewController.goBack();
    });
  }
  /*
  void _goAdelante() {
    setState(() {
      _webViewController.goForward();
    });
  }
  */
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        centerTitle: true,
        title: new Image.asset('assets/googlelogo.png'),
      ),
      body: WebView(
        initialUrl: 'https://youtube.com',
        javaScriptMode: JavaScriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
      ),
      floatingActionButton: new Container(
      height: 140.0,
      child: new Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 60.0,
                  child: new FloatingActionButton(
                    onPressed: _incrementCounter,
                    child: new Icon(Icons.home,color: Colors.white,),
                  ),
                ),
                new Container(
                  height: 10.0,
                ), // a space
                Container(
                  height: 60.0,
                  child: new FloatingActionButton(
                    onPressed: _goAtras,
                    backgroundColor: Colors.red,
                    child: new Icon(Icons.arrow_back_ios, color: Colors.white,),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ) ,
    );
  }  
}

