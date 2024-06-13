import 'package:name_app/category.dart';

class Utils {
  static List<Category> getMockedCategories() {
    // Define the category hierarchy using a map
    final categoryData = [
      {
        'name': 'ZD411',
        'describe': 'ZD411 Trouble Shoot',
        'imgName': 'image/ZD411_img.png',
        'subCategories' : [
          'Indicator Lights',
          'How to Change Darkness',
          'Manual Width Adjustment'
        ],
        'troubleShootName': 'ZD411 Trouble Shoot',
      },
      {
        'name': 'ZT411',
        'describe': 'ZT411 Trouble Shoot',
        'imgName': 'image/ZT411_img.png',
        'subCategories': [
          'Ribbon Out Error',
          'Media Out Error',
          'How to change Darkness',
          'How to run Calibration',
        ],
      },
      {
        'name': 'ZT410',
        'describe': 'ZT410 Trouble Shoot',
        'imgName': 'image/ZT410.jpg',
        'subCategories': [
          'Ribbon Out Error',
          'Media Out Error',
          'How to change Darkness',
          'How to run Calibration',
        ],
      },
      {
        'name': 'ZT400',
        'describe': 'ZT400 Trouble Shoot',
        'imgName': 'image/logo.jpg',
        'subCategories': [
          'Ribbon Out Error',
          'Media Out Error',
          'How to change Darkness',
          'How to run Calibration',
        ],
      },
      {
        'name': 'ZT230',
        'describe': 'ZT230 Trouble Shoot',
        'imgName': 'image/ZD411_img.png',
        'subCategories': [
          'Ribbon Out Error',
          'Media Out Error',
          'How to change Darkness',
          'How to run Calibration',
        ],
      },
      {
        'name': 'computer',
        'describe': 'Computer Trouble Shoot',
        'imgName': 'image/logo.jpg',
        'subCategories': [
          'When Computer Does Not Turn on',
          'When Computer Freezes',
          'When Screen Does Not Turn on',
          'When Wifi is Not Connected'
        ],
      },
      {
        'name': 'MES',
        'describe': 'MES Trouble Shoot',
        'imgName': 'image/logo.jpg',
      },
    ];

    // Convert the map to a list of Category instances
    return categoryData.map((categoryMap) => Category.fromMap(categoryMap)).toList();
  }
}

