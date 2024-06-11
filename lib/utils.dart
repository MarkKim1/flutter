import 'package:name_app/category.dart';

class Utils {
  static List<Category> getMockedCategories() {
    return [ // default information, could be added more entities later on
      Category(
        name: "ZD411",
        describe: "ZD411 Trouble Shoot",
        imgName: "image/ZD411_img.png",
        subCategories: []
      ),
      Category(
          name: "ZT411",
          describe: "ZT411 Trouble Shoot",
          imgName: "image/ZT411_img.png",
          subCategories: []
      ),
      Category(
          name: "ZT410",
          describe: "ZT410 Trouble Shoot",
          imgName: "image/ZT410.jpg",
          subCategories: []
      ),
      Category(
          name: "ZT400",
          describe: "ZT400 Trouble Shoot" ,
          imgName: "image/logo.jpg",
          subCategories: []
      ),
      Category(
          name: "computer",
          describe: "Computer Trouble Shoot",
          imgName: "image/logo.jpg",
          subCategories: []
      ),
    ];
  }
}

