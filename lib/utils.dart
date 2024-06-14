import 'package:name_app/category.dart';

class Utils {
  static List<Category> getMockedCategories() {
    // Define the category hierarchy using a map
    final categoryData = [
      {
        'name': 'ZD411',
        'troubleShootName': 'ZD411 Trouble Shoot',
        'describe': 'ZD411 Trouble Shoot',
        'imgName': 'image/ZD411_img.png',
        'subCategories' : [
          'When Label is Not Printing Properly',
          'How to Change the darkness of printer',
          'How to Perform a Manual Width Adjustment',
          'Printer Setup',
          'How to Replace the PrintHead',
        ],
        'troubleShootDescribe': [
          {
            "error": "When Label is Not Printing Properly",
            "solution" : "Press pause button and cancel button simultaneously. "
                " Once printer prints the label then it is running calibration. "
                " then try to print again",
            "videoUrl" : "https://www.youtube.com/watch?v=-V8UfRF3e2o",
          },
          {
            "error" : "How to Change the darkness of printer",
            "solution" : "Hold down pause button, LED starts to blink press feed button twice"
                " then press pause again. The printer then will print out the darkness"
                " press feed again once the darkness is 16",
            "videoUrl" : "https://www.youtube.com/watch?v=xVyVUAW_nI0"
          },
          {
            "error" : "How to Perform a Manual Width Adjustment",
            "solution" : "Hold down pause button, LED starts to blink press feed button once"
                " then press pause again. The printer then will print out the width adjustments"
                " press feed again to set the width of the label",
            "videoUrl" : "https://www.youtube.com/watch?v=AUxtg4HIXfg"
          },
          {
            "error" : "How to Factory reset the ZD411",
            "solution" : "When the machine is on, press the Pause and Feed buttons simultaneously, then press the Power button. "
                " The LED indicators will blink as it shuts down. "
                " Press the Power button again to turn on the printer. "
                " Make sure to set the darkness and width after the reset.",
            "videoUrl" : "https://www.youtube.com/watch?v=SKlwz0T_h-o"
          },
          {
            "error" : "Printer Setup",
            "solution" : "Video is provided",
            "videoUrl" : "https://www.youtube.com/watch?v=3PiB4-73mg0&list=PLDcxrY419mSmUCL8DtFExmGrwANeP5Tca"
          },
          {
            "error" : "How to Replace the PrintHead",
            "solution" : "Video is provided",
            "videoUrl" : "https://www.youtube.com/watch?v=URh4kmKHe10&list=PLDcxrY419mSmUCL8DtFExmGrwANeP5Tca&index=9"
          },
        ]
      },
      {
        'name': 'ZT411',
        'describe': 'ZT411 Trouble Shoot',
        'imgName': 'image/ZT411_img.png',

        'subCategories': [
          'Printhead Open Error',
          'How to replace the Printhead',
          'Media Out Error',
          'How to run Auto Calibration',
          'Ribbon In and Out Error',
          'Indicator Lights',
          'How to change the Print Type',
          'How to change the Darkness',
          'When you changed media type or ribbon, Ribbon Out Or Media Out Error',
          'How to adjust the Printhead Pressure',
          'How to replace the platen roller',
          'How to Calibrate RFID Media',
          'How to Use the USB Thumb Drive',
        ],

        'troubleShootDescribe': [
          {
            "error" : "Printhead Open Error",
            "solution" : "Ensure the printhead is completely closed",
            "videoUrl" : ""
          },
          {
            "error" : "How to replace the Printhead",
            "solution" : "If the label prints with blank lines or unused space, the printhead my need to be replaced."
                " Please contact IT further assist",
            "videoUrl" : "https://www.youtube.com/watch?v=DIPiunE3r1g"
          },
          {
            "error" : "Media Out Error",
            "solution" : "Ensure the sensor label is properly located and that no debirs is blocking it."
                " If it still doesn't work, run the calibration",
            "videoUrl" : "https://www.youtube.com/watch?v=jBpfgIoR2U8"
          },
          {
            "error" : "How to run Auto Calibration",
            "solution" : "Video is provided",
            "videoUrl" : "https://www.youtube.com/watch?v=bFKELwxgKyE"
          },
          {
            "error" : "Ribbon In and Out Error",
            "solution" : "Recalibrate the printer and verify the correct loading of the ribbon."
                " If Ribbon is loaded make suret he printer is on Thermal Transfer Mode",
            "videoUrl" : "https://www.youtube.com/watch?v=qgcdmejldps"
          },
          {
            "error" : "Indicator Lights",
            "solution" : "Green: The printer is ready"
                "Yello: The printer is paused"
                "Red: The printer needs attention, such as media supply running out",
            "videoUrl" : ""
          },
          {
            "error" : "How to change the Print Type",
            "solution" : "Navigate to Settings → Print → Print Type, and change the Print Type. "
                " Thermal Transfer requires a loaded ribbon, while Direct Thermal does not. "
                " If the Print Type is set to Direct Thermal and a ribbon is loaded, a 'Ribbon in error' message will occur.",
            "videoUrl" : ""
          },
          {
            "error" : "How to change the Darkness",
            "solution" : " Menu → click Printer icon → Print Quality → click Darkness → set Darkness to 15",
            "videoUrl" : "https://www.youtube.com/watch?v=UVqQEzweGb4&t=31s"
          },
          {
            "error" : "When you changed media type or ribbon, Ribbon Out Or Media Out Error",
            "solution" : "Press down Pause and Cancel button simultaneously. Follow through the manual calibration",
            "videoUrl" : "https://www.youtube.com/watch?v=jBpfgIoR2U8"
          },
          {
            "error" : "How to adjust the Printhead Pressure",
            "solution" : "When label is printing inconsistently try to adjust the Printhead pressure",
            "videoUrl" : "https://www.youtube.com/watch?v=RfcXQi3CuK"
          },
          {
            "error" : "How to replace the platen roller",
            "solution" : "Whenever the printer has significantly poorer performance, print quality or media handling replace the platen roller",
            "videoUrl" : "https://www.youtube.com/watch?v=6-33npa3_2o&t=6s"
          },
          {
            "error" : "How to Calibrate RFID Media",
            "solution" : "The printer moves the media, calibrates the RFID tag position, and determines the optimal settings for the RFID media being used",
            "videoUrl" : "https://www.youtube.com/watch?v=kHyKbAqYa6k"
          },
          {
            "error" : "How to Use the USB Thumb Drive",
            "solution" : "Video is provided",
            "videoUrl" : "https://www.youtube.com/watch?v=lYrh4BRjTdI"
          },
        ]
      },
      {
        'name': 'ZT410',
        'describe': 'ZT410 Trouble Shoot',
        'imgName': 'image/ZT410.jpg',
        'subCategories': [
          'Printhead Open Error',
          'Media Out Error',
          'How to change Darkness',
          'How to run Calibration',
        ],
        'troubleShootDescribe': [
          {
            "error" : "Printhead Open Error",
            "solution" : "The printhead is not fully closed. "
          " Ensure the printhead is completely closed.",
            "videoUrl" : "https://www.youtube.com/watch?v=rNj3ulG1yVE"
          },
          {
            "error" : "Media Out Error",
            "solution" : "Media is not loaded or is loaded incorrectly."
                " Properly load the media and ensure the media sensor is correctly positioned",
            "videoUrl" : "https://www.youtube.com/watch?v=KpGb9rVZUxQ"
          },
          {
            "error" : "Ribbon Out Error",
            "solution" : "The ribbon is not loaded, "
          }
        ]
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

