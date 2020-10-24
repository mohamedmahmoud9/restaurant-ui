import 'package:flutter/material.dart';
import 'package:resturant_ui/app_localization.dart';
import 'package:resturant_ui/presentation/my_flutter_app_icons.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/screens/login_screen.dart';
import 'package:resturant_ui/widgets/social_row.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final local = AppLocalizations.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //40
              Container(
                height: SizeConfig.safeBlockVertical * 40,
                width: SizeConfig.safeBlockHorizontal * 70,
                child: Center(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                ),
              ),
              //20
              Container(
                width: double.infinity,
                height: SizeConfig.safeBlockVertical * 20,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: SizeConfig.blockSizeVertical * 10,
                      child: FittedBox(
                        child: Text(
                          local.translate('sign_up'),
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              height: 2),
                        ),
                      ),
                    ),
                    Text(
                      local.translate('sign_up_easy'),
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              //20
              Container(
                height: SizeConfig.safeBlockVertical * 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: SizeConfig.safeBlockHorizontal * 80,
                      child: RaisedButton.icon(
                        icon: Icon(
                          MyFlutterApp.facebook_1,
                        ),
                        textColor: Theme.of(context).primaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeVertical * 5)),
                        label: Text(
                          local.translate('with_facebook'),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: SizeConfig.safeBlockHorizontal * 70,
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen(
                                    isLogin: false,
                                  )));
                        },
                        padding:
                            EdgeInsets.symmetric(horizontal: 42, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                SizeConfig.blockSizeVertical * 5)),
                        child: Text(local.translate("email_or_phone")),
                        textColor: Colors.black54,
                        borderSide: BorderSide(width: 2, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
              ),
              //10
              SocialRow(),
              //5
              Container(
                width: double.infinity,
                height: SizeConfig.blockSizeVertical * 5,
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(
                            isLogin: true,
                          ))),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: local.translate("have_account"),
                            style: TextStyle(color: Colors.black54)),
                        TextSpan(
                            text: local.translate("login"),
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                decoration: TextDecoration.underline))
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
