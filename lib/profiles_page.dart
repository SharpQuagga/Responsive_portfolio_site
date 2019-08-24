import 'package:flutter_web/cupertino.dart';
import 'package:flutter_web/material.dart';
import 'package:responsive_site2/domino_reveal.dart';
import 'responsive_widget.dart';
import 'dart:html' as html;

class ProfilePage extends StatelessWidget {
  //const ProfilePage({Key key}) : super(key: key);

  final PageController controller = PageController(
    initialPage: _currentPage,
  );
  static int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Colors.white,
        appBar: ResponsiveWidget.isSmallScreen(context)
            ? AppBar(
                elevation: 0.0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: _ds(context),
              )
            : AppBar(
                centerTitle: true,
                title: _ds(context),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  _navHeader(context),
                ],
              ),
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: <Widget>[
                    NavButton(
                      text: "About me",
                      onPressed: () {
                        controller.animateToPage(1,
                            curve: Curves.easeIn,
                            duration: Duration(seconds: 1));
                      },
                    ),
                    NavButton(
                      text: "Work",
                      onPressed: () {
                        controller.animateToPage(2,
                            curve: Curves.easeIn,
                            duration: Duration(seconds: 1));
                      },
                    ),
                    NavButton(
                      text: "Portfolio",
                      onPressed: () {
                        controller.animateToPage(3,
                            curve: Curves.easeIn,
                            duration: Duration(seconds: 1));
                      },
                    ),
                    NavButton(
                      text: "Contact",
                      onPressed: () {
                        controller.animateToPage(4,
                            curve: Curves.easeIn,
                            duration: Duration(seconds: 1));
                      },
                    ),
                  ],
                ),
              )
            : null,
        body: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _firstPage(context),
            _secondPage(context),
            _thirdPage(context),
            _Forth(),
            _fifthPage(context)
            // Last(),
          ],
          pageSnapping: false,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }

  AnimatedContainer _firstPage(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.1,
        bottom: MediaQuery.of(context).size.height * 0.05,
      ),
      child: ResponsiveWidget(
        largeScreen: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              // color: Colors.yellow,
              // padding: EdgeInsets.only(
              //    left: MediaQuery.of(context).size.width * 0.05),
              child: Row(
                children: <Widget>[
                  Container(
                    //color: Colors.green,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2 -
                        MediaQuery.of(context).size.width * 0.1,
                    child: _firstPageIntro(),
                  ),
                  DominoReveal(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          color: Colors.orange[300],
                          image: DecorationImage(
                            alignment: Alignment.bottomCenter,
                            image: AssetImage("images/qqq.png"),
                            fit: BoxFit.contain,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.zero,
                              topRight: Radius.zero,
                              bottomLeft: Radius.circular(140),
                              bottomRight: Radius.circular(130))),
                    ),
                  )
                ],
              ),
            ),
            //NavHeader(),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: <Widget>[
            //     NavHeader(),
            //     SizedBox(
            //       height: MediaQuery.of(context).size.height * 0.1,
            //     ),
            //     //ProfileInfo(),
            //     //SizedBox(
            //     //  height: MediaQuery.of(context).size.height * 0.2,
            //     //),
            //     //SocialInfo(),
            //   ],
            // ),
          ],
        ),
        smallScreen: _firstPageIntro(),
      ),
    );
  }

  ResponsiveWidget _navHeader(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //    DS(),
          //  Spacer(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: <Widget>[
                DNavButton(
                  text: "About me",
                  onPressed: () {
                    controller.animateToPage(1,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ),
                DNavButton(
                  text: "Work",
                  onPressed: () {
                    controller.animateToPage(2,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ),
                DNavButton(
                  text: "Portfolio",
                  onPressed: () {
                    controller.animateToPage(3,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ),
                DNavButton(
                  text: "Contact",
                  onPressed: () {
                    controller.animateToPage(4,
                        curve: Curves.easeIn, duration: Duration(seconds: 1));
                  },
                ),
                SizedBox(
                  width: 50,
                )
              ],
            ),
        ],
      ),
    );
  }

  GestureDetector _ds(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(0,
            curve: Curves.easeIn, duration: Duration(seconds: 1));
      },
      child: Row(
        children: <Widget>[
          Text(
            "Darsbir",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Singh",
            style: TextStyle(
              fontSize: 24,
              color: Colors.orange[300],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Container _fifthPage(BuildContext context) {
    var s_width = MediaQuery.of(context).size.width / 4;
    var s_height = MediaQuery.of(context).size.height / 3;
    return Container(
        //  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/3),
        width: MediaQuery.of(context).size.width,
        // height: 100,
        //height: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.orange[600], Colors.amberAccent[100]],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ResponsiveWidget(
              largeScreen: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _pdetails(),
                  _myservices(s_height, s_width),
                  _mylinks(s_height, s_width),
                ],
              ),
            )
          ],
        ));
  }

  DominoReveal _mylinks(s_height, s_width) {
    return DominoReveal(
      child: SizedBox(
        width: s_width,
        height: s_height,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Connect with me: ",
                  style: TextStyle(
                      // fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        html.window.open(
                            "https://www.facebook.com/Darsbir.Singh",
                            "Facebook");
                      },
                      child: Text(
                        "Facebook",
                        style: TextStyle(color: Colors.black),
                      ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        html.window
                            .open("https://github.com/SharpQuagga", "GitHub");
                      },
                      child: Text(
                        "Github",
                        style: TextStyle(color: Colors.black),
                      ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        html.window.open(
                            "https://www.linkedin.com/in/darsbir-singh-b58a41127/",
                            "LinkedIn");
                      },
                      child: Text("LinkedIn",
                          style:
                              TextStyle(color: Colors.black)))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                      onTap: () {
                        html.window.open(
                            "https://www.linkedin.com/in/darsbir-singh-b58a41127/",
                            "LinkedIn");
                      },
                      child: Text("Glassdoor",
                          style: TextStyle(
                              // fontSize: 17,
                              // fontFamily: 'Lato-Regular',
                              color: Colors.black)))),
            ],
          ),
        ),
      ),
    );
  }

  DominoReveal _myservices(s_height, s_width) {
    return DominoReveal(
      child: SizedBox(
        width: s_width,
        height: s_height,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Services",
                  style: TextStyle(
                      // fontSize: 20,
                      // fontFamily: 'Lato-Bold',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Android Apps",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "iOS Apps",
                    style: TextStyle(color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Mobile Application",
                      style: TextStyle(color: Colors.black))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Web Development",
                      style: TextStyle(color: Colors.black))),
            ],
          ),
        ),
      ),
    );
  }
}

class _firstPageIntro extends StatelessWidget {
  const _firstPageIntro({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        DominoReveal(
          child: Text(
            "Hello, I am",
            style: (TextStyle(
              fontSize: 20,
            )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        DominoReveal(
          child: Text(
            "Darsbir Singh",
            style: (TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        DominoReveal(
          child: Text(
            "Android and Flutter Developer",
            style: (TextStyle(
              fontSize: 20,
            )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        DominoReveal(
          child: Text(
            "Aspiring Data Scientist",
            style: (TextStyle(
              fontSize: 20,
            )),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        DominoReveal(
          child: Row(
            children: <Widget>[
              RaisedButton(
                elevation: 10,
                textColor: Colors.white,
                highlightColor: Colors.amber,
                hoverColor: Colors.orange[300],
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                color: Colors.orange[600],
                child: Text("Hire Me"),
              ),
              Container(
                width: 17,
                color: Colors.transparent,
              ),
              GestureDetector(
                  onTap: () {
                    html.window.open(
                        "https://drive.google.com/file/d/1dMCxQypY6ye74unK8WOkySlcl9VQqTWN/view?usp=sharing",
                        "resume");
                  },
                  child: Text("Resume",
                      style: TextStyle(
                          //fontFamily: "Blinker-Regular.ttf",
                          fontSize: 20,
                          color: Colors.black))),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.transparent,
          ),
        ),
        DominoReveal(
          child: Row(
            children: <Widget>[
              Text("Follow Me",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                  onTap: () {
                    html.window.open(
                        "https://www.facebook.com/Darsbir.Singh", "Facebook");
                  },
                  child: Image(
                    image: AssetImage("images/facebook.png"),
                    width: 25,
                  )),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    html.window.open(
                        "https://www.linkedin.com/in/darsbir-singh-b58a41127/",
                        "LinkedIn");
                  },
                  child: Image(
                    image: AssetImage("images/instagram.png"),
                    width: 25,
                  )),
              SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    html.window.open(
                        "https://www.linkedin.com/in/darsbir-singh-b58a41127/",
                        "LinkedIn");
                  },
                  child: Image(
                      image: AssetImage("images/linkedin.png"), width: 25)),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class _pdetails extends StatelessWidget {
  const _pdetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DominoReveal(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 2,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Darsbir Singh",
                    style: TextStyle(
                        // fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Address:",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "I-Block, Sarabha Nagar",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Ludhiana",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Mobile: ",
                      style: TextStyle(
                          // fontSize: 17,
                          // fontFamily: 'Lato-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "+91 85578 55866",
                    style: TextStyle(
                        // fontSize: 17,
                        // fontFamily: 'Lato-Regular',
                        color: Colors.black),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Email: ",
                      style: TextStyle(
                          // fontSize: 17,
                          // fontFamily: 'Lato-Regular',
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
              Text(
                "darsbiritten@gmail.com",
                style: TextStyle(
                    // fontSize: 17,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AnimatedContainer _secondPage(BuildContext context) {
  return AnimatedContainer(
    //  height: MediaQuery.of(context).size.height,
    //  width: MediaQuery.of(context).size.width,
    duration: Duration(seconds: 1),
    margin: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.1,
      left: MediaQuery.of(context).size.width * 0.1,
      // bottom: MediaQuery.of(context).size.height * 0.05,
    ),
    child: ResponsiveWidget(
      largeScreen: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            DominoReveal(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 2 -
                    MediaQuery.of(context).size.width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/qq.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 7,
            ),
            Column(
              children: <Widget>[
                DominoReveal(
                  child: Text(
                    "About Me",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 4 + 50,
                  child: DominoReveal(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: "Hi! I am"),
                          TextSpan(
                              text: " Darsbir Singh.",
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              )),
                          TextSpan(
                              text:
                                  " I am a Mobile and Web Developer with experience in developing real world applications.I have the necessary skills and knowledge to manage a project. I like to code and I am very passionate about Flutter."),
                          TextSpan(
                              text:
                                  " I am 20 years old and currently studying Computer science and engineering from"),
                          TextSpan(
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                              text:
                                  " Guru Nanak Dev Engineering College, Ludhiana."),
                          TextSpan(
                              text:
                                  " I like to read books and I am keen to learn new things.")
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 12),
                ),
                DominoReveal(
                  child: RaisedButton(
                    elevation: 10,
                    textColor: Colors.white,
                    highlightColor: Colors.amber,
                    hoverColor: Colors.orange[300],
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    color: Colors.orange[600],
                    child: Text("Read More"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

AnimatedContainer _thirdPage(BuildContext context) {
  return AnimatedContainer(
    duration: Duration(seconds: 1),
    padding: EdgeInsets.only(
        //top: MediaQuery.of(context).size.height * 0.05,
        //bottom: MediaQuery.of(context).size.height * 0.1,
        ),
    child: ResponsiveWidget(
      largeScreen: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: 1.25 * MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    DominoReveal(
                      child: Text(
                        "Services",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //height: 1.15 * MediaQuery.of(context).size.height,
              child: DominoReveal(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _dabbeMainDabba(
                        context,
                        "Android Development",
                        "Android software development is the process by which new applications are created for devices running the Android operating system.",
                        1,
                        "images/android.png"),
                    SizedBox(
                      width: 30,
                    ),
                    _dabbeMainDabba(
                        context,
                        "Flutter Development",
                        "Flutter is an open-source mobile application development framework created by Google to develop applications for Android and iOS.",
                        1,
                        "Flutter"),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DominoReveal(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _dabbeMainDabba(
                      context,
                      "Web Development",
                      "Web development is the work involved in developing a web site for the Internet or an intranet.",
                      1,
                      "Flutter"),
                  SizedBox(
                    width: 30,
                  ),
                  _dabbeMainDabba(
                      context,
                      "Data Science",
                      "Data science is a field that uses scientific processes, algorithms and systems to extract knowledge and insights from data.",
                      1,
                      "images/python.png"),
                ],
              ),
            )
          ],
        ),
      ),
      smallScreen: Container(
        margin: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            DominoReveal(
              child: Text(
                "Services",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: DominoReveal(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _dabbeMainDabba(
                          context,
                          "Android Development",
                          "Android software development is the process by which new applications are created for devices running the Android operating system.",
                          0,
                          "images/android.png"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      _dabbeMainDabba(
                          context,
                          "Flutter Development",
                          "Flutter is an open-source mobile application development framework created by Google to develop applications for Android and iOS.",
                          0,
                          "Flutter"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      _dabbeMainDabba(
                          context,
                          "Web Development",
                          "Web development is the work involved in developing a web site for the Internet or an intranet.",
                          0,
                          "Flutter"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      _dabbeMainDabba(
                          context,
                          "Data Science",
                          "Data science is a field that uses scientific processes, algorithms and systems to extract knowledge and insights from data.",
                          0,
                          "images/python.png"),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// RichText _serv(String head, String desc) {
//   return RichText(
//     text: TextSpan(
//       style: TextStyle(fontSize: 20, color: Colors.red),
//       text: head + " - ",
//       children: <TextSpan>[
//         TextSpan(
//           style: TextStyle(fontSize: 17, color: Colors.black87),
//           text: desc,
//         )
//       ],
//     ),
//   );
// }

class _Forth extends StatefulWidget {
  @override
  __ForthState createState() => __ForthState();
}

class __ForthState extends State<_Forth> {
  static int _projectcurrentPage = 0;

  final PageController _projectcontroller = PageController(
    initialPage: _projectcurrentPage,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1,
          // bottom: MediaQuery.of(context).size.height * 0.1,
        ),
        child: ResponsiveWidget(
            largeScreen: AnimatedContainer(
              duration: Duration(seconds: 1),
              // height: 1.25 * MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: DominoReveal(
                      child: Text(
                        "My Projects",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  DominoReveal(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _projectcurrentPage -= 1;
                            _projectcontroller.animateToPage(
                              _projectcurrentPage,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            // alignment: Alignment(
                            //     MediaQuery.of(context).size.height / 2 - 20,
                            //     MediaQuery.of(context).size.width / 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_left),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.03,
                              right: MediaQuery.of(context).size.width * 0.03),
                          padding: EdgeInsets.only(
                            top: 50,
                          ),
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 1.6,
                          alignment: Alignment.center,
                          child: DominoReveal(
                            child: PageView(
                              controller: _projectcontroller,
                              children: <Widget>[
                                if (!ResponsiveWidget.isSmallScreen(context))
                                  ProjectDecs(
                                    img1: "project/11.png",
                                    img2: "project/22.png",
                                    img3: "project/33.png",
                                    txt1: "Palace",
                                    txt2: "Hunt",
                                  ),
                                ProjectDecs(
                                  img1: "project/pho.png",
                                  img2: "project/pm.png",
                                  img3: "project/pp.png",
                                  txt1: "Punjabi",
                                  txt2: "Ekta",
                                ),
                          ProjectDecs(
                                  img1: "project/bz1.png",
                                  img2: "project/bz2.png",
                                  img3: "project/bz3.png",
                                  txt1: "Bizz",
                                  txt2: "Code",
                                ),
                                ProjectDecs(
                                  img1: "project/ea.jpeg",
                                  img2: "project/eaa.jpeg",
                                  img3: "project/33.png",
                                  txt1: "Estate",
                                  txt2: "App",
                                ),
                              ],
                            ),
                          ),
                        ),
         GestureDetector(
                          onTap: () {
                            print("Tapp");
                            _projectcurrentPage += 1;
                            _projectcontroller.animateToPage(
                              _projectcurrentPage,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeIn,
                            );
                          },
            child: Container(
                            height: 50,
                            width: 50,
                            // alignment: Alignment(
                            //     MediaQuery.of(context).size.height / 2 - 20,
                            //     MediaQuery.of(context).size.width / 2),
                            decoration: BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(Icons.arrow_right),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            smallScreen: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: RichText(
                        text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            text: "My Projects"),
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      width: MediaQuery.of(context).size.width / 0.5,
                      height: MediaQuery.of(context).size.height / 1.6,
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: DominoReveal(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              _smallProjectDocs(
                                img1: "project/11.png",
                                txt1: "Palace",
                                txt2: "Hunt",
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              _smallProjectDocs(
                                img1: "project/pho.png",
                                txt1: "Punjabi",
                                txt2: "Ekta",
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              _smallProjectDocs(
                                img1: "project/bz1.png",
                                txt1: "Bizz",
                                txt2: "Code",
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              _smallProjectDocs(
                                img1: "project/ea.jpeg",
                                txt1: "Estate",
                                txt2: "App",
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            )));
  }
}

class _smallProjectDocs extends StatelessWidget {
  final String img1, txt1, txt2;

  const _smallProjectDocs({Key key, this.img1, this.txt1, this.txt2});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DominoReveal(
          child: Material(
            shadowColor: Colors.yellow[900],
            animationDuration: Duration(seconds: 3),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            elevation: 20,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.2,
              width: MediaQuery.of(context).size.width / 1.4,
              color: Colors.blue[300],
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 50,
                  ),
                  RotationTransition(
                      turns: AlwaysStoppedAnimation(-10 / 360),
                      child: Material(
                        animationDuration: Duration(seconds: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 30,
                        shadowColor: Colors.black87,
                        child: Container(
                          width: 160,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img1), fit: BoxFit.fill)),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          // left: 3/2*MediaQuery.of(context).size.width,
          top: 30,
          child: SizedBox(
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width/4,
                child: FittedBox(
                child: Text(
                "$txt1\n$txt2",
                style: TextStyle(
                  // fontSize: 50,
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  // fontFamily: 'Lato-Regular',
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

Container _dabbeMainDabba(
    BuildContext context, String head, String bdy, int _size, String img) {
  return Container(
    padding: EdgeInsets.all(10),
    margin:
        _size == 0 ? EdgeInsets.symmetric(vertical: 15, horizontal: 8) : null,
    width: _size == 1
        ? MediaQuery.of(context).size.width / 4
        : MediaQuery.of(context).size.height / 2.8,
    height: _size == 1
        ? MediaQuery.of(context).size.height / 3.3
        : MediaQuery.of(context).size.height / 2.8,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.orange[400],
        boxShadow: [
          BoxShadow(
              color: Colors.brown, offset: Offset(10, 10), blurRadius: 10.0)
        ]),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: _size == 1 ? 50 : 40,
          height: _size == 1 ? 50 : 40,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(5),
          child: Center(
            child: img == "Flutter"
                ? FlutterLogo(
                    // colors: Colors.orange,
                    size: _size == 1 ? 30 : 18,
                  )
                : Image(
                    image: AssetImage(img),
                    colorBlendMode: BlendMode.colorBurn,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    width: _size == 1 ? 30 : 18,
                    height: _size == 1 ? 30 : 18,
                  ),
            // child: Icon(
            //   Icons.android,
            //   color: Colors.orange,
            //   size: _size == 1 ? 30 : 18,
            // ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          head,
          style: TextStyle(
              color: Colors.white,
              fontSize: _size == 1 ? 22 : 18,
              fontWeight: FontWeight.bold),
        ),
        // if(_size==1)
        Padding(
          padding: EdgeInsets.only(top: 10, right: 10),
          child: Container(
            child: Text(
              bdy,
              maxLines: 5,
              style: TextStyle(
                  fontSize: _size == 1 ? 16 : 15,
                  color: Colors.white,
                  fontFamily: "Blinker-Regular"),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ],
    ),
  );
}

class DNavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const DNavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RaisedButton(
          color: Colors.white,
          elevation: 0.0,
          highlightColor: Colors.lime[100],
          hoverColor: Colors.yellowAccent[100],
          // hoverColor: Colors.orange[500],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: TextStyle(color: Colors.orange),
          ),
          // borderSide: BorderSide(
          //   color: color,
          // ),
          onPressed: onPressed,
          // highlightedBorderColor: color,
        ),
        SizedBox(
          width: 8,
        )
      ],
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProjectDecs extends StatelessWidget {
  final String img1, img2, img3, txt1, txt2;

  const ProjectDecs(
      {Key key, this.img1, this.img2, this.img3, this.txt1, this.txt2});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.6,
      height: MediaQuery.of(context).size.height / 2,
      child: Stack(
        children: <Widget>[
          Material(
            shadowColor: Colors.yellow[900],
            animationDuration: Duration(seconds: 3),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            elevation: 20,
            child: Container(
              height: 300,
              width: 800,
              color: Colors.blue[200],
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 50,
                  ),
                  RotationTransition(
                      turns: AlwaysStoppedAnimation(-10 / 360),
                      child: Material(
                        animationDuration: Duration(seconds: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 30,
                        shadowColor: Colors.black87,
                        child: Container(
                          width: 160,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img1), fit: BoxFit.fill)),
                        ),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  RotationTransition(
                      turns: AlwaysStoppedAnimation(-10 / 360),
                      child: Material(
                        animationDuration: Duration(seconds: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 30,
                        shadowColor: Colors.black87,
                        child: Container(
                          width: 160,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img2), fit: BoxFit.fill)),
                        ),
                      )),
                  SizedBox(
                    width: 50,
                  ),
                  RotationTransition(
                      turns: AlwaysStoppedAnimation(-10 / 360),
                      child: Material(
                        animationDuration: Duration(seconds: 3),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        elevation: 30,
                        shadowColor: Colors.black87,
                        child: Container(
                          width: 160,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(img3), fit: BoxFit.fill)),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            left: 720,
            top: 80,
            child: Text(
              "$txt1\n$txt2",
              // "Palace\nHunt",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

// class Last extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveWidget(
//       largeScreen: Container(
//         // width: MediaQuery.of(context).size.width,
//         // height: MediaQuery.of(context).size.height ,
//         child: Row(
//           children: <Widget>[
//             SizedBox(
//               width: MediaQuery.of(context).size.width / 4,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   "Darsbir Singh",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                 ),
//                 Text(
//                   "Adderss",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   "H.No-85, I-Block, Sarabha Nagar, Ludhiana",
//                   style: TextStyle(fontSize: 10),
//                 ),
//                 Text(
//                   "Contact Info",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                 ),
//                 Text(
//                   "+91 8557855866",
//                   style: TextStyle(fontSize: 10),
//                 ),
//                 Text(
//                   "darsbiritten@gmail.com",
//                   style: TextStyle(fontSize: 10),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
