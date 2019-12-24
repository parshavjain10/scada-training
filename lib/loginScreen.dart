
import 'package:flutter/material.dart';
import 'appTheme.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconanimationController;
  Animation<double> _iconAnimation;
  ScrollController _scrollController = new ScrollController();
  final _login = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _iconanimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconanimationController, curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconanimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.buildLightTheme(),
      child: Container(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: NestedScrollView(
                        controller: _scrollController,
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return Column(
                                  children: <Widget>[],
                                );
                              }, childCount: 1),
                            ),
                          ];
                        },
                        body: Container(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 150.0),
                                ),
                                Image.asset(
                                  'assets/images/mpptcllogo.png',
                                  width: 100.0,
                                  height: 100.0,
                                ),
                                Form(
                                  key: _login,
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50.0),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0, right: 18.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.verified_user),
                                              hintText: 'Employee Id',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                            ),
                                            keyboardType:TextInputType.text,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please enter correct employee id ';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18.0,
                                              right: 18.0,
                                              top: 20.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                              hintText: 'Password',
                                              contentPadding:
                                                  EdgeInsets.fromLTRB(
                                                      20.0, 15.0, 20.0, 15.0),
                                            ),
                                            obscureText: true,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Please enter correct password';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 80,
                                              right: 80,
                                              bottom: 16,
                                              top: 40.0),
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                  0, 181, 255, 1),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(24.0)),
                                              boxShadow: <BoxShadow>[
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                  blurRadius: 8,
                                                  offset: Offset(4, 4),
                                                ),
                                              ],
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50.0)),
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () {
                                                 
                                                },
                                                child: Center(
                                                  child: Text(
                                                    "Login ",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
