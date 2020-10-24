import 'package:flutter/material.dart';
import 'package:resturant_ui/models/category.dart';
import 'package:resturant_ui/models/dish.dart';
import 'package:resturant_ui/presentation/my_flutter_app_icons.dart';

class Categories with ChangeNotifier {
  List<Category> _categories = [
    Category(
        id: '1',
        title: "chicken",
        icon: MyFlutterApp.roast_chicken,
        dishes: [
          Dish(
              id: '11',
              title: "Grilled Chicken Breast",
              description:
                  'This grilled chicken breast recipe is boneless skinless chicken breasts soaked in a flavorful garlic ...',
              image:
                  "https://www.dinneratthezoo.com/wp-content/uploads/2015/08/grilled-chicken-breast-5.jpg",
              price: 60,
              rate: 4.8,
              discount: .10),
          Dish(
              id: '12',
              title: "Chicken Florentine",
              description:
                  'This grilled chicken breast recipe is boneless skinless chicken breasts soaked in a flavorful garlic ...',
              image:
                  "https://www.dinneratthezoo.com/wp-content/uploads/2015/08/grilled-chicken-breast-5.jpg",
              price: 70,
              rate: 4.8,
              discount: .25)
        ]),
    Category(
        id: '2',
        title: "fast_food",
        icon: MyFlutterApp.fast_food,
        dishes: [
          Dish(
              id: '21',
              title: "The Worcestershire Burger",
              description: "Hellmann's Sandwich Mayonnaise (4x3.4Kg)",
              image:
                  "https://www.readersdigest.ca/wp-content/uploads/2015/11/gourmet-burger-scaled.jpg",
              price: 20,
              rate: 4.3,
              discount: .10),
        ]),
    Category(id: '3', title: "pizza", icon: MyFlutterApp.pizza_slice, dishes: [
      Dish(
          id: '31',
          title: 'Cheese Pizza',
          description:
              "Delicious grain free, gluten free, almond flour cheese pizza. Made with whole milk mozzarella cheese. Buy online now or find it at a grocery store ...",
          image:
              "https://cdn.shopify.com/s/files/1/0808/5563/products/061819_Cheese_Full_800x.jpg?v=1560819711",
          price: 20,
          rate: 4.9,
          discount: .50)
    ]),
    Category(id: '4', title: "soup", icon: MyFlutterApp.food, dishes: [
      Dish(
          id: '41',
          title: 'Carrot Soup',
          description:
              "Have you ever met a kid who didn't like carrots? This naturally sweet veggie shines in this easy, ...",
          image:
              "https://www.simplyrecipes.com/wp-content/uploads/2019/04/Easy-Carrot-Soup-long2.jpg",
          price: 20,
          rate: 4.9,
          discount: .50)
    ]),
    Category(id: '5', title: "fish", icon: MyFlutterApp.fish, dishes: [
      Dish(
          id: '51',
          title: 'Salmon with Root Vegetables',
          description:
              "This cozy hash is loaded with protein and healthy fats that keep you going on busy days. We've been ...",
          image:
              "https://www.tasteofhome.com/wp-content/uploads/2018/01/Salmon-with-Root-Vegetables_EXPS_THD17_188340_B08_11_6b-696x696.jpg",
          price: 60,
          rate: 4.3,
          discount: .10)
    ]),
    Category(id: '6', title: "beef", icon: MyFlutterApp.meat, dishes: [
      Dish(
          id: '61',
          title: 'Steak',
          description:
              "Here's how cook steak in the oven perfectly every time, including how long to cook for, what ...",
          image:
              "https://thestayathomechef.com/wp-content/uploads/2018/06/How-to-Cook-Steak-1-small.jpg",
          price: 30,
          rate: 4.3,
          discount: .15),
    ]),
    Category(id: '7', title: "drinks", icon: MyFlutterApp.cafe, dishes: [
      //
      Dish(
          id: '71',
          title: 'Coffee',
          description: "",
          image:
              "https://economictimes.indiatimes.com/thumb/msid-74722501,width-1200,height-900,resizemode-4,imgsize-165133/today-in-a-market-crowded-with-fancy-concoctions-the-fate-of-the-indigenous-pheta-beaten-coffee-is-not-encouraging-.jpg?from=mdr",
          price: 10,
          rate: 4.3,
          discount: .15),
    ]),
  ];
  List<Dish> _specialOffers = [
    Dish(
        id: '1',
        title: 'Steak',
        description:
            "Here's how cook steak in the oven perfectly every time, including how long to cook for, what ...",
        image:
            "https://thestayathomechef.com/wp-content/uploads/2018/06/How-to-Cook-Steak-1-small.jpg",
        price: 30,
        rate: 4.3,
        discount: .15),
    Dish(
        id: '1',
        title: "The Worcestershire Burger",
        description: "Hellmann's Sandwich Mayonnaise (4x3.4Kg)",
        image:
            "https://www.readersdigest.ca/wp-content/uploads/2015/11/gourmet-burger-scaled.jpg",
        price: 20,
        rate: 4.3,
        discount: .10),
    Dish(
        id: '1',
        title: 'Salmon with Root Vegetables',
        description:
            "This cozy hash is loaded with protein and healthy fats that keep you going on busy days. We've been ...",
        image:
            "https://www.tasteofhome.com/wp-content/uploads/2018/01/Salmon-with-Root-Vegetables_EXPS_THD17_188340_B08_11_6b-696x696.jpg",
        price: 60,
        rate: 4.3,
        discount: .10)
  ];
  Dish _dishOfDay = Dish(
      id: '1',
      title: 'Cheese Pizza',
      description:
          "Delicious grain free, gluten free, almond flour cheese pizza. Made with whole milk mozzarella cheese. Buy online now or find it at a grocery store ...",
      image:
          "https://cdn.shopify.com/s/files/1/0808/5563/products/061819_Cheese_Full_800x.jpg?v=1560819711",
      price: 20,
      rate: 4.9,
      discount: .50);
  List<Category> get categories {
    return _categories;
  }

  Dish get dishOfDay {
    return _dishOfDay;
  }

  List<Dish> get specialOffers {
    return _specialOffers;
  }

  List<Dish> fetchDishesByCategoryId(String id) {
    Category category = _categories.firstWhere((element) => element.id == id);
    return category.dishes;
  }
}
