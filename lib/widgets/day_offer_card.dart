import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/provider/categories.dart';

import '../app_localization.dart';

class OfferOfDayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final local = AppLocalizations.of(context);
    final _datOffer = Provider.of<Categories>(context, listen: false).dishOfDay;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
          height: SizeConfig.safeBlockVertical * 3,
          child: FittedBox(
              child: Text(
            local.translate('day_offer'),
            style: TextStyle(fontWeight: FontWeight.w600),
          )),
        ),
        Container(
            height: SizeConfig.safeBlockVertical * 20,
            margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
            padding: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
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
            child: Row(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(22),
                      child: Image.network(
                        _datOffer.image,
                        width: SizeConfig.blockSizeHorizontal * 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        left: 0,
                        top: 0,
                        child: Chip(
                          backgroundColor: Colors.red[100],
                          label: Text(
                            (_datOffer.discount * 100).toInt().toString() + "%",
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  width: SizeConfig.safeBlockHorizontal * 2,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: SizeConfig.safeBlockVertical * 4,
                          child: FittedBox(
                            child: Text(
                              _datOffer.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )),

                      Chip(
                        label: Text(_datOffer.rate.toString()),
                        avatar: Icon(Icons.star, color: Colors.orangeAccent),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                _datOffer.price.toString(),
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey,
                                    fontSize: 10),
                              ),
                              Text(
                                '\$' +
                                    ((_datOffer.price) -
                                            (_datOffer.price *
                                                _datOffer.discount))
                                        .toString(),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ],
                          ),
                          RaisedButton(
                            onPressed: () {},
                            child: Text(local.translate('add_cart')),
                          )
                        ],
                      )
                      // Row(children: [
                      //   C
                      // ],)
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}
