import 'package:flutter/material.dart';
import 'package:resturant_ui/presentation/my_flutter_app_icons.dart';
import 'package:resturant_ui/presentation/size_config.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockSizeVertical * 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              // padding: EdgeInsets.all(8),

              decoration: BoxDecoration(
                  color: Color(0xFFD64A3B), shape: BoxShape.circle),
              child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(
                    MyFlutterApp.gplus,
                    size: 20,
                  ),
                  onPressed: () {})),
          SizedBox(
            width: 8,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFF1FA1F1), shape: BoxShape.circle),
              child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(MyFlutterApp.twitter),
                  onPressed: () {})),
          SizedBox(
            width: 8,
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFF215A82), shape: BoxShape.circle),
              child: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(MyFlutterApp.linkedin),
                  onPressed: () {})),
        ],
      ),
    );
  }
}
