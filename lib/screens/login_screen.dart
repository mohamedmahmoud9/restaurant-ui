import 'package:flutter/material.dart';
import 'package:resturant_ui/app_localization.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/widgets/curve_cliper.dart';
import 'package:resturant_ui/widgets/social_row.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  final bool isLogin;

  const LoginScreen({Key key, @required this.isLogin}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin;
  @override
  void initState() {
    super.initState();
    isLogin = widget.isLogin;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final local = AppLocalizations.of(context);
    return Scaffold(
        body: Column(
      children: [
        //30
        ClipPath(
          clipper: CurveCliper(),
          child: Stack(
            children: [
              Container(
                child: Image.asset('assets/images/food.jpg', fit: BoxFit.cover),
                height: SizeConfig.blockSizeVertical * 30,
                width: SizeConfig.blockSizeHorizontal * 100,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.white38),
                height: SizeConfig.blockSizeVertical * 30,
                width: SizeConfig.blockSizeHorizontal * 100,
              ),
              Positioned(
                top: SizeConfig.blockSizeVertical * 5,
                left: 0,
                right: 0,
                // bottom: 0,
                child: Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: SizeConfig.blockSizeVertical * 15,
                    width: SizeConfig.blockSizeHorizontal * 80,
                  ),
                ),
              ),
            ],
          ),
        ),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 400),
          firstChild: Column(
            children: [
              //10
              Container(
                height: SizeConfig.safeBlockVertical * 10,
                child: Column(
                  children: [
                    Text(
                      local.translate('welcome_back'),
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black54),
                    ),
                    Container(
                      height: SizeConfig.blockSizeVertical * 5,
                      child: FittedBox(
                        child: Text(
                          local.translate('login'),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //22.5
              Container(
                height: SizeConfig.blockSizeVertical * 22.5,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockVertical),
                child: Column(
                  children: [
                    Container(
                      // height: SizeConfig.blockSizeVertical * 7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: local.translate('username'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 1.5,
                    ),
                    Container(
                      // height: SizeConfig.blockSizeVertical * 7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: local.translate('password'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                    //7
                    Container(
                      height: SizeConfig.blockSizeVertical * 7,
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.safeBlockVertical),
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          Expanded(child: Text(local.translate('remember_me'))),
                          Text(
                            local.translate('forget_pass'),
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //5
              Container(
                height: SizeConfig.safeBlockVertical * 6,
                width: SizeConfig.safeBlockHorizontal * 80,
                child: RaisedButton(
                  textColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 5)),
                  child: Text(
                    local.translate('login'),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
              ),
            ],
          ),
          secondChild: Column(
            children: [
              //10
              Container(
                height: SizeConfig.safeBlockVertical * 10,
                child: Column(
                  children: [
                    Text(
                      local.translate('hello'),
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.black54),
                    ),
                    Container(
                      height: SizeConfig.safeBlockVertical * 5,
                      child: FittedBox(
                        child: Text(
                          AppLocalizations.of(context).translate('sign_up'),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //40
              Container(
                height: SizeConfig.safeBlockVertical * 40,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.blockSizeVertical),
                child: Column(
                  children: [
                    Container(
                      // height: SizeConfig.safeBlockVertical * 7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: local.translate('username'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1.5,
                    ),
                    Container(
                      // height: SizeConfig.safeBlockVertical * 7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: local.translate('email'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1.5,
                    ),
                    Container(
                      // height: SizeConfig.safeBlockVertical * 7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: local.translate('password'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 1.5,
                    ),
                    Container(
                      // height: SizeConfig.safeBlockVertical * 7,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black87,
                          ),
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            hintText: local.translate('confirm_pass'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: SizeConfig.safeBlockVertical * 5,
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          Expanded(
                              child: Text(local.translate('accept_terms'))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //7
              Container(
                height: SizeConfig.safeBlockVertical * 6,
                width: SizeConfig.safeBlockHorizontal * 80,
                margin:
                    EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 1),
                child: RaisedButton(
                  textColor: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          SizeConfig.blockSizeVertical * 5)),
                  child: Text(
                    local.translate('sign_up'),
                  ),
                  onPressed: () {},
                ),
              ),
              //10
              SocialRow(),
              //3
              Container(
                height: SizeConfig.blockSizeVertical * 3,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: local.translate('have_account'),
                            style: TextStyle(color: Colors.black54)),
                        TextSpan(
                            text: local.translate('login'),
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                decoration: TextDecoration.underline))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          crossFadeState:
              isLogin ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        )
      ],
    ));
  }
}
