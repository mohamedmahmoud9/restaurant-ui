import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_ui/app_localization.dart';
import 'package:resturant_ui/models/category.dart';
import 'package:resturant_ui/models/dish.dart';
import 'package:resturant_ui/presentation/my_flutter_app_icons.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/provider/categories.dart';
import 'package:resturant_ui/widgets/day_offer_card.dart';
import 'package:resturant_ui/widgets/girds/categories_grid.dart';
import 'package:resturant_ui/widgets/girds/category_dishes_h.dart';
import 'package:resturant_ui/widgets/girds/special_offers_grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<Categories>(context, listen: false).categories;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: SizedBox(),
        title: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: 50,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 1,
                  ),
                  CategoriesGrid(),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical * 1,
                  ),
                  OfferOfDayCard(),
                  SpecialOffersGrid(),
                ] +
                categories
                    .map((e) => CategoryDishesGrid(
                        categoryId: e.id, categoryTitle: e.title))
                    .toList(),
          ),
        ),
      ),
    );
  }
}
