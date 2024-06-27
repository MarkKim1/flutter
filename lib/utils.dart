import 'package:name_app/category.dart';
import 'package:flutter/material.dart';

Widget loadImage(String path) {
  return Image.asset(
    path,
    fit: BoxFit.cover, // This makes the image cover the available space
  );
}

class Utils {
  static List<String> searchTerms = [
    'ZD411: When Label is Not Printing Properly',
    'ZD411: How to Change the darkness of printer',
    'ZD411: How to Perform a Manual Width Adjustment',
    'ZD411: How to Factory reset the ZD411',
    'ZD411: Printer Setup',
    'ZD411: How to Replace the PrintHead',
    'ZT411: Printhead Open Error',
    'ZT411: How to replace the Printhead',
    'ZT411: Media Out Error',
    'ZT411: How to run Auto Calibration',
    'ZT411: Ribbon In and Out Error',
    'ZT411: Indicator Lights',
    'ZT411: How to change the Print Type',
    'ZT411: How to change the Darkness',
    'ZT411: When you changed media type or ribbon, Ribbon Out Or Media Out Error',
    'ZT411: How to Adjust the Printhead Pressure',
    'ZT411: How to Replace the Platen Roller',
    'ZT411: How to Calibrate RFID Media',
    'ZT411: How to Use the USB Thumb Drive',
    'ZT411: How to clean the Media Sensor and Exterior on the ZT411',
    'ZT410: Printhead Open Error',
    'ZT410: Media Out Error',
    'ZT410: How to Run Manual Calibration',
    'ZT410: How to Reset the Printer',
    'ZT410: How to Run Auto Calibration',
    'ZT410: How to Reset The Printer',
    'ZT410: How to Change The Darkness',
    'ZT410: How to Adjust The Print Speed',
    'ZT410: How to Adjust Printhead Pressure',
    'ZT410: How to Replace The Printhead',
    'ZT410: How to Change the Platen Roller',
    'ZT410: How to Install Ribbon',
    'ZT230: Ribbon Out Error',
    'ZT230: Media Out Error',
    'ZT230: Faded print, smudges, or uneven printing',
    'ZT230: How to Run Manual Calibration',
    'ZT230: How to Replace the Platen Roller'
  ];

  static List<Category> getMockedCategories() {
    // Define the category hierarchy using a map
    var categoryData = [
      {
        'name': 'ZD411',
        'troubleShootName': 'ZD411 Trouble Shoot',
        'describe': 'ZD411 Trouble Shoot',
        //'imgName': 'image/ZD411.png',

        'subCategories': [
          'ZD411: When Label is Not Printing Properly',
          'ZD411: How to Change the darkness of printer',
          'ZD411: How to Perform a Manual Width Adjustment',
          'ZD411: How to Factory reset the ZD411',
          'ZD411: Printer Setup',
          'ZD411: How to Replace the PrintHead'
        ],

        'troubleShootDescribe': [
          {
            "error": "ZD411: When Label is Not Printing Properly",
            "solution": "Press pause button and cancel button simultaneously. "
                " Once printer prints the label then it is running calibration. "
                " then try to print again",
            "videoUrl": "https://www.youtube.com/watch?v=-V8UfRF3e2o",
          },
          {
            "error": "ZD411: How to Change the darkness of printer",
            "solution":
                "Hold down pause button, LED starts to blink press feed button twice"
                    " then press pause again. The printer then will print out the darkness"
                    " press feed again once the darkness is 16",
            "videoUrl": "https://www.youtube.com/watch?v=xVyVUAW_nI0"
          },
          {
            "error": "ZD411: How to Perform a Manual Width Adjustment",
            "solution":
                "Hold down pause button, LED starts to blink press feed button once"
                    " then press pause again. The printer then will print out the width adjustments"
                    " press feed again to set the width of the label",
            "videoUrl": "https://www.youtube.com/watch?v=AUxtg4HIXfg"
          },
          {
            "error": "ZD411: How to Factory reset the ZD411",
            "solution":
                "When the machine is on, press the Pause and Feed buttons simultaneously, then press the Power button. "
                    " The LED indicators will blink as it shuts down. "
                    " Press the Power button again to turn on the printer. "
                    " Make sure to set the darkness and width after the reset.",
            "videoUrl": "https://www.youtube.com/watch?v=SKlwz0T_h-o"
          },
          {
            "error": "ZD411: Printer Setup",
            "solution": "Video is provided",
            "videoUrl":
                "https://www.youtube.com/watch?v=3PiB4-73mg0&list=PLDcxrY419mSmUCL8DtFExmGrwANeP5Tca"
          },
          {
            "error": "ZD411: How to Replace the PrintHead",
            "solution": "Video is provided",
            "videoUrl":
                "https://www.youtube.com/watch?v=URh4kmKHe10&list=PLDcxrY419mSmUCL8DtFExmGrwANeP5Tca&index=9"
          },
        ]
      },
      {
        'name': 'ZT411',
        'describe': 'ZT411 Trouble Shoot',
        'imgName': 'image/ZT411.png',
        'subCategories': [
          'ZT411: Printhead Open Error',
          'ZT411: How to replace the Printhead',
          'ZT411: Media Out Error',
          'ZT411: How to run Auto Calibration',
          'ZT411: Ribbon In and Out Error',
          'ZT411: Indicator Lights',
          'ZT411: How to change the Print Type',
          'ZT411: How to change the Darkness',
          'ZT411: When you changed media type or ribbon, Ribbon Out Or Media Out Error',
          'ZT411: How to Adjust the Printhead Pressure',
          'ZT411: How to Replace the Platen Roller',
          'ZT411: How to Calibrate RFID Media',
          'ZT411: How to Use the USB Thumb Drive',
          'ZT411: How to clean the Media Sensor and Exterior on the ZT411',
        ],
        'troubleShootDescribe': [
          {
            "error": "ZT411: Printhead Open Error",
            "solution": "Ensure the printhead is completely closed",
            "videoUrl": ""
          },
          {
            "error": "ZT411: How to replace the Printhead",
            "solution":
                "If the label prints with blank lines or unused space, the printhead my need to be replaced."
                    " Please contact IT further assist",
            "videoUrl": "https://www.youtube.com/watch?v=DIPiunE3r1g"
          },
          {
            "error": "ZT411: Media Out Error",
            "solution":
                "Ensure the sensor label is properly located and that no debirs is blocking it."
                    " If it still doesn't work, run the calibration",
            "videoUrl": "https://www.youtube.com/watch?v=jBpfgIoR2U8"
          },
          {
            "error": "ZT411: How to run Auto Calibration",
            "solution": "Video is provided",
            "videoUrl": "https://www.youtube.com/watch?v=bFKELwxgKyE"
          },
          {
            "error": "ZT411: Ribbon In and Out Error",
            "solution":
                "Recalibrate the printer and verify the correct loading of the ribbon."
                    " If Ribbon is loaded make sure the printer is on Thermal Transfer Mode",
            "videoUrl": "https://www.youtube.com/watch?v=qgcdmejldps"
          },
          {
            "error": "ZT411: Indicator Lights",
            "solution": "Green: The printer is ready"
                " Yellow: The printer is paused"
                " Red: The printer needs attention, such as media supply running out",
            "videoUrl": ""
          },
          {
            "error": "ZT411: How to change the Print Type",
            "solution": "Navigate to Settings → Print → Print Type, and change the Print Type. "
                " Thermal Transfer requires a loaded ribbon, while Direct Thermal does not. "
                " If the Print Type is set to Direct Thermal and a ribbon is loaded, a 'Ribbon in error' message will occur.",
            "videoUrl": ""
          },
          {
            "error": "ZT411: How to change the Darkness",
            "solution":
                " Menu → click Printer icon → Print Quality → click Darkness → set Darkness to 15",
            "videoUrl": "https://www.youtube.com/watch?v=UVqQEzweGb4&t=31s"
          },
          {
            "error":
                "ZT411: When you changed media type or ribbon, Ribbon Out Or Media Out Error",
            "solution":
                "Press down Pause and Cancel button simultaneously. Follow through the manual calibration",
            "videoUrl": "https://www.youtube.com/watch?v=jBpfgIoR2U8"
          },
          {
            "error": "ZT411: How to Adjust the Printhead Pressure",
            "solution":
                "When label is printing inconsistently try to adjust the Printhead pressure",
            "videoUrl": "https://www.youtube.com/watch?v=RfcXQi3CuKk"
          },
          {
            "error": "ZT411: How to Replace the Platen Roller",
            "solution":
                "Whenever the printer has significantly poorer performance, print quality or media handling replace the platen roller",
            "videoUrl": "https://www.youtube.com/watch?v=6-33npa3_2o&t=6s"
          },
          {
            "error": "ZT411: How to Calibrate RFID Media",
            "solution":
                "The printer moves the media, calibrates the RFID tag position, and determines the optimal settings for the RFID media being used",
            "videoUrl": "https://www.youtube.com/watch?v=kHyKbAqYa6k"
          },
          {
            "error": "ZT411: How to Use the USB Thumb Drive",
            "solution": "Video is provided",
            "videoUrl": "https://www.youtube.com/watch?v=lYrh4BRjTdI"
          },
          {
            "error":
                "ZT411: How to clean the Media Sensor and Exterior on the ZT411",
            "solution": "Video is provided",
            "videoUrl": "https://www.youtube.com/watch?v=xBsQEfQX2Sk",
          },
          {
            "error": "ZT411: Printhead Open Error",
            "solution":
                "The printhead is not fully closed. Ensure the printhead is completely closed",
            "videoUrl": "https://www.youtube.com/watch?v=rNj3ulG1yVE",
          },
          {
            "error": "ZT411: Media Out Error",
            "solution": "Media is not loaded or is loaded incorrectly",
            "videoUrl": "https://www.youtube.com/watch?v=KpGb9rVZUxQ",
          },
        ]
      },
      {
        'name': 'ZT410',
        'describe': 'ZT410 Trouble Shoot',
        'imgName': 'image/ZT410.png',
        'subCategories': [
          'ZT410: Printhead Open Error',
          'ZT410: Media Out Error',
          'ZT410: How to Run Manual Calibration',
          'ZT410: How to Reset the Printer',
          'ZT410: How to Run Auto Calibration',
          'ZT410: How to Reset The Printer',
          'ZT410: How to Change The Darkness',
          'ZT410: How to Adjust The Print Speed',
          'ZT410: How to Adjust Printhead Pressure',
          'ZT410: How to Replace The Printhead',
          'ZT410: How to Change the Platen Roller',
          'ZT410: How to Install Ribbon',
        ],
        'troubleShootDescribe': [
          {
            "error": "ZT410: Printhead Open Error",
            "solution": "The printhead is not fully closed. "
                " Ensure the printhead is completely closed.",
            "videoUrl": "https://www.youtube.com/watch?v=rNj3ulG1yVE"
          },
          {
            "error": "ZT410: Media Out Error",
            "solution": "Media is not loaded or is loaded incorrectly."
                " Properly load the media and ensure the media sensor is correctly positioned",
            "videoUrl": "https://www.youtube.com/watch?v=KpGb9rVZUxQ"
          },
          {
            "error": "ZT410: How to Run Manual Calibration",
            "solution":
                "When Media is changed or alignment of the label is off, run calibration",
            "videoUrl": "https://www.youtube.com/watch?v=RzG3vOom0Dk"
          },
          {
            "error": "ZT410: How to Reset the Printer",
            "solution": "Video is Provided",
            "videoUrl": "https://www.youtube.com/watch?v=GjpR7uIVY7U"
          },
          {
            "error": "ZT410: How to Run Auto Calibration",
            "solution": "Video is provided",
            "videoUrl": "https://www.youtube.com/watch?v=4p0qgcrQRGk"
          },
          {
            "error": "ZT410: How to Reset The Printer",
            "solution":
                "After troubleshooting, if the issue persists, reset the printer.",
            "videoUrl": "https://www.youtube.com/watch?v=GjpR7uIVY7U"
          },
          {
            "error": "ZT410: How to Change The Darkness",
            "solution": "Video is provided",
            "videoUrl": "https://www.youtube.com/watch?v=XXiwuugyluM"
          },
          {
            "error": "ZT410: How to Adjust The Print Speed",
            "solution": "Press the menu button at the top-left."
                " Navigate to the Print Speed setting. Select the print speed and save",
            "videoUrl": ""
          },
          {
            "error": "ZT410: How to Adjust Printhead Pressure",
            "solution":
                "When label is not printing properly. Consider adjusting printhead pressure",
            "videoUrl": "https://www.youtube.com/watch?v=2zVa-glgbug",
          },
          {
            "error": "ZT410: How to Replace The Printhead",
            "solution":
                "When the print quality is poor or prints have empty spots, the printhead needs to be changed.",
            "videoUrl": "https://www.youtube.com/watch?v=NjNpJfXYzw0"
          },
          {
            "error": "ZT410: How to Change the Platen Roller",
            "solution":
                "If label is not printing properly see if the platen roller is damaged",
            "videoUrl": "https://www.youtube.com/watch?v=9WjQAnqZ1dw",
          },
          {
            "error": "ZT410: How to Install Ribbon",
            "solution": "Video is provided",
            "videoUrl": "https://www.youtube.com/watch?v=uUSkAL8W2rA",
          }
        ]
      },
      {
        'name': 'ZT230',
        'describe': 'ZT230 Trouble Shoot',
        'imgName': 'image/ZT230.png',
        'subCategories': [
          'ZT230: Ribbon Out Error',
          'ZT230: Media Out Error',
          'ZT230: Faded print, smudges, or uneven printing',
          'ZT230: How to Run Manual Calibration',
          'ZT230: How to Replace the Platen Roller'
        ],
        'troubleShootDescribe': [
          {
            "error": "ZT230: Ribbon Out Error",
            "solution": "In Thermal Transfer Mode:"
                "* The ribbon is loaded incorrectly."
                "* The ribbon sensor is not detecting the ribbon."
                "* Media is blocking the ribbon sensor.",
            "videoUrl" : "https://support.zebra.com/cpws/docs/ztseries/Setup/Video/ZT_Media_RibbonLoading/ZT_Media_RibbonLoading.html"
          },
          {
            "error" : "ZT230: Media Out Error",
            "solution" : "Verify the correct sensor is selected. The reflective sensor is used for most media"
                " Verify the movable Reflective Sensor is correctly positioned",
            "videoUrl" : "https://www.youtube.com/watch?v=HDbuXYtx4TM"
          },
          {
            "error" : "ZT230: Faded print, smudges, or uneven printing",
            "solution" : "Check the printhead for dirt or damage. Clean the printhead with isopropyl alcohol and a lint-free cloth."
                " Ensure the media and ribbon ar compatible and properly loaded.",
            "videoUrl" : "https://www.youtube.com/watch?v=8_Hj2AWsJd4"
          },
          {
            "error" : "ZT230: Faded print, smudges, or uneven printing",
            "solution" : "Adjust printhead pressure",
            "videoUrl" : "https://www.youtube.com/watch?v=ClBk6oSb8uw"
          },
          {
            "error" : "ZT230: How to Run Manual Calibration",
            "solution" : "Video is provided",
            "videoUrl" : "https://www.youtube.com/watch?v=MOdyTRMu2XI"
          },
          {
            "error" : "ZT230: Ribbon Out Error",
            "solution" : "The ribbon is loaded, but the printer is set for the direct thermal method."
                " Remove the ribbon or change the printer to thermal transfer method.",
            "videoUrl" : "https://www.youtube.com/watch?v=_ukd-LQZ-A4&t=16s"
          },
          {
            "error" : "ZT230: How to Replace the Platen Roller",
            "solution" : "A damaged platen roller can decrease the print quality.",
            "videoUrl" : "https://www.youtube.com/watch?v=01jpUgOgiX4&list=PLrcZVTwQp0ldxmDa_E8g1zTux854FOArd&index=57"
          }
        ]
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
    return categoryData
        .map((categoryMap) => Category.fromMap(categoryMap))
        .toList();
  }
}
