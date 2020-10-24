import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resturant_ui/presentation/size_config.dart';
import 'package:resturant_ui/provider/categories.dart';
import 'package:resturant_ui/widgets/girds/special_offers_grid.dart';

import '../../app_localization.dart';

class CategoryDishesGrid extends StatelessWidget {
  static String routeName = 'category-dishes-grid';
  final String categoryId;
  final String categoryTitle;

  const CategoryDishesGrid({Key key, this.categoryId, this.categoryTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    final local = AppLocalizations.of(context);

    final categoryDishes = Provider.of<Categories>(context, listen: false)
        .fetchDishesByCategoryId(categoryId);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(SizeConfig.safeBlockVertical * 1),
          height: SizeConfig.safeBlockVertical * 3,
          child: FittedBox(
              child: Text(
            local.translate(categoryTitle),
            style: TextStyle(fontWeight: FontWeight.w600),
          )),
        ),
        Container(
            height: SizeConfig.safeBlockVertical * 40,
            child: GridView.builder(
              itemCount: categoryDishes.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 4 / 3,
                  // mainAxisSpacing: 16,
                  crossAxisSpacing: 16),
              itemBuilder: (context, i) => ChangeNotifierProvider.value(
                  value: categoryDishes[i], child: DishItem()),
            ))
      ],
    );
  }
}
