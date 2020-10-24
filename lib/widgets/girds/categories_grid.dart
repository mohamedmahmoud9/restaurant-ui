import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/provider/categories.dart';

import '../../app_localization.dart';

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final local = AppLocalizations.of(context);
    final _categories =
        Provider.of<Categories>(context, listen: false).categories;
    return Container(
      height: SizeConfig.safeBlockVertical * 15,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Container(
          margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
          padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  blurRadius: 5,
                  // offset: Offset(0, 10)
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(SizeConfig.blockSizeVertical),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    shape: BoxShape.circle),
                child: Icon(
                  _categories[i].icon,
                  color: Colors.white,
                  size: SizeConfig.safeBlockVertical * 5,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical,
              ),
              Container(
                height: SizeConfig.safeBlockVertical * 2,
                child: Text(
                  local.translate(_categories[i].title),
                  style:
                      TextStyle(fontWeight: FontWeight.w600, letterSpacing: .5),
                ),
              )
            ],
          ),
        ),
        itemCount: _categories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            // mainAxisSpacing: 8,
            crossAxisSpacing: 16,
            childAspectRatio: 1),
      ),
    );
  }
}
