import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_ui/models/dish.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/provider/categories.dart';

import '../../app_localization.dart';

class SpecialOffersGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    final local = AppLocalizations.of(context);
    final specialOffers =
        Provider.of<Categories>(context, listen: false).specialOffers;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
          height: SizeConfig.safeBlockVertical * 3,
          child: FittedBox(
              child: Text(
            local.translate('special_offers'),
            style: TextStyle(fontWeight: FontWeight.w600),
          )),
        ),
        Container(
            height: SizeConfig.safeBlockVertical * 40,
            child: GridView.builder(
              itemCount: specialOffers.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4 / 3,
                  // mainAxisSpacing: 16,
                  crossAxisSpacing: 16),
              itemBuilder: (context, i) => ChangeNotifierProvider.value(
                  value: specialOffers[i], child: DishItem()),
            ))
      ],
    );
  }
}

class DishItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dish = Provider.of<Dish>(context, listen: false);
    final local = AppLocalizations.of(context);
    return Container(
      margin: EdgeInsets.all(SizeConfig.safeBlockVertical),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[400],
              blurRadius: 5,
              // offset: Offset(0, 10)
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                child: Image.network(
                  dish.image,
                  height: SizeConfig.safeBlockVertical * 20,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  right: 0,
                  bottom: 0,
                  child: Chip(
                    backgroundColor: Colors.red[100],
                    label: Text(
                      (dish.discount * 100).toInt().toString() + "%",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(SizeConfig.safeBlockVertical),
            child: Column(
              children: [
                Container(
                  height: SizeConfig.safeBlockVertical * 5,
                  child: FittedBox(
                    child: Text(dish.title),
                  ),
                ), //
                Container(
                  height: SizeConfig.safeBlockVertical * 5,
                  child: Text(
                    dish.description,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
                // Expanded(child: SizedBox()),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          dish.price.toString(),
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey,
                              fontSize: 10),
                        ),
                        Text(
                          '\$' +
                              ((dish.price) - (dish.price * dish.discount))
                                  .toString(),
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 2,
                    ),
                    Expanded(
                      child: Container(
                          // height: SizeConfig
                          //         .safeBlockVertical *
                          //     6,
                          child: RaisedButton(
                        child: Text(local.translate('add_cart')),
                        onPressed: () {},
                      )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
