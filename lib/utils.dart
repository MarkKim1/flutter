// import 'package:name_app/category.dart';
// import 'package:flutter/material.dart';
//
// class Utils {
//   static List<Category> getMockedCategories() {
//     // Define the category hierarchy using a map
//     var categoryData = [
//       {
//         'name': 'ZD411',
//         'troubleShootName': 'ZD411 Trouble Shoot',
//         'describe': 'ZD411 Trouble Shoot',
//         'subCategories': [
//           // 서브카테고리 제목과 에러 문구는 동일해야함
//           'ZD411: When Label is Not Printing Properly',
//           'ZD411: How to Change the darkness of printer',
//           'ZD411: How to Perform a Manual Width Adjustment',
//           'ZD411: How to Factory reset the ZD411',
//           'ZD411: Printer Setup',
//           'ZD411: How to Replace the PrintHead'
//         ],
//         'troubleShootDescribe': [
//           {
//             "error":
//                 "ZD411: When Label is Not Printing Properly", // 서브카테고리 제목과 에러 문구는 동일해야함
//             "solutions": [
//               {
//                 "solution": "Press pause button and cancel button simultaneously. "
//                     " Once printer prints the label then it is running calibration. "
//                     " then try to print again",
//                 "image": null, // 사진이 없을 경우 null 로 표시해야함
//               },
//             ],
//             "videoUrl":
//                 "https://www.youtube.com/watch?v=-V8UfRF3e2o", // 비디오가 없을 경우 "" 로 표시해야함
//           },
//           {
//             "error": "ZD411: How to Change the darkness of printer",
//             "solutions": [
//               {
//                 "solution":
//                     "Hold down pause button, LED starts to blink press feed button twice"
//                         " then press pause again. The printer then will print out the darkness"
//                         " press feed again once the darkness is 16",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=xVyVUAW_nI0"
//           },
//           {
//             "error": "ZD411: How to Perform a Manual Width Adjustment",
//             "solutions": [
//               {
//                 "solution":
//                     "Hold down pause button, LED starts to blink press feed button once"
//                         " then press pause again. The printer then will print out the width adjustments"
//                         " press feed again to set the width of the label",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=AUxtg4HIXfg"
//           },
//           {
//             "error": "ZD411: How to Factory reset the ZD411",
//             "solutions": [
//               {
//                 "solution":
//                     "When the machine is on, press the Pause and Feed buttons simultaneously, then press the Power button. "
//                         " The LED indicators will blink as it shuts down. "
//                         " Press the Power button again to turn on the printer. "
//                         " Make sure to set the darkness and width after the reset.",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=SKlwz0T_h-o"
//           },
//           {
//             "error": "ZD411: Printer Setup",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl":
//                 "https://www.youtube.com/watch?v=3PiB4-73mg0&list=PLDcxrY419mSmUCL8DtFExmGrwANeP5Tca"
//           },
//           {
//             "error": "ZD411: How to Replace the PrintHead",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl":
//                 "https://www.youtube.com/watch?v=URh4kmKHe10&list=PLDcxrY419mSmUCL8DtFExmGrwANeP5Tca&index=9"
//           },
//         ]
//       },
//       {
//         'name': 'ZT411',
//         'describe': 'ZT411 Trouble Shoot',
//         'subCategories': [
//           'ZT411: Printhead Open Error',
//           'ZT411: How to replace the Printhead',
//           'ZT411: Media Out Error',
//           'ZT411: How to run Auto Calibration',
//           'ZT411: Ribbon In and Out Error',
//           'ZT411: Indicator Lights',
//           'ZT411: How to change the Print Type',
//           'ZT411: How to change the Darkness',
//           'ZT411: When you changed media type or ribbon, Ribbon Out Or Media Out Error',
//           'ZT411: How to Adjust the Printhead Pressure',
//           'ZT411: How to Replace the Platen Roller',
//           'ZT411: How to Calibrate RFID Media',
//           'ZT411: How to Use the USB Thumb Drive',
//           'ZT411: How to clean the Media Sensor and Exterior on the ZT411',
//           'ZT411: How to replace the Platen Roller'
//         ],
//         'troubleShootDescribe': [
//           {
//             "error": "ZT411: How to replace the Platen Roller",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=kxQnKGHqYxA"
//           },
//           {
//             "error": "ZT411: Printhead Open Error",
//             "solutions": [
//               {
//                 "solution": "Ensure the printhead is completely closed",
//                 "image": null,
//               }
//             ],
//             "videoUrl": null
//           },
//           {
//             "error": "ZT411: How to replace the Printhead",
//             "solutions": [
//               {
//                 "solution":
//                     "If the label prints with blank lines or unused space, the printhead my need to be replaced."
//                         " Please contact IT further assist",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=DIPiunE3r1g"
//           },
//           {
//             "error": "ZT411: Media Out Error",
//             "solutions": [
//               {
//                 "solution":
//                     "Ensure the sensor label is properly located and that no debris is blocking it."
//                         " If it still doesn't work, run the calibration",
//                 "image": "assets/ZT411sensor.png",
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=jBpfgIoR2U8"
//           },
//           {
//             "error": "ZT411: How to run Auto Calibration",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=bFKELwxgKyE"
//           },
//           {
//             "error": "ZT411: Ribbon In and Out Error",
//             "solutions": [
//               {
//                 "solution":
//                     "Recalibrate the printer and verify the correct loading of the ribbon."
//                         " If Ribbon is loaded make sure the printer is on Thermal Transfer Mode",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=qgcdmejldps"
//           },
//           {
//             "error": "ZT411: Indicator Lights",
//             "solutions": [
//               {
//                 "solution": "Green: The printer is ready"
//                     " Yellow: The printer is paused"
//                     " Red: The printer needs attention, such as media supply running out",
//                 "image": null,
//               }
//             ],
//             "videoUrl": null,
//           },
//           {
//             "error": "ZT411: How to change the Print Type",
//             "solutions": [
//               {
//                 "solution": "Navigate to Settings → Print → Print Type, and change the Print Type. "
//                     " Thermal Transfer requires a loaded ribbon, while Direct Thermal does not. "
//                     " If the Print Type is set to Direct Thermal and a ribbon is loaded, a 'Ribbon in error' message will occur.",
//                 "image": null,
//               }
//             ],
//             "videoUrl": null,
//           },
//           {
//             "error": "ZT411: How to change the Darkness",
//             "solutions": [
//               {
//                 "solution":
//                     " Menu → click Printer icon → Print Quality → click Darkness → set Darkness to 15",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=UVqQEzweGb4&t=31s"
//           },
//           {
//             "error":
//                 "ZT411: When you changed media type or ribbon, Ribbon Out Or Media Out Error",
//             "solutions": [
//               {
//                 "solution":
//                     "Press down Pause and Cancel button simultaneously. Follow through the manual calibration",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=jBpfgIoR2U8"
//           },
//           {
//             "error": "ZT411: How to Adjust the Printhead Pressure",
//             "solutions": [
//               {
//                 "solution":
//                     "When label is printing inconsistently try to adjust the Printhead pressure",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=RfcXQi3CuKk"
//           },
//           {
//             "error": "ZT411: How to Replace the Platen Roller",
//             "solutions": [
//               {
//                 "solution":
//                     "Whenever the printer has significantly poorer performance, print quality or media handling replace the platen roller",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=6-33npa3_2o&t=6s"
//           },
//           {
//             "error": "ZT411: How to Calibrate RFID Media",
//             "solutions": [
//               {
//                 "solution":
//                     "The printer moves the media, calibrates the RFID tag position, and determines the optimal settings for the RFID media being used",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=kHyKbAqYa6k"
//           },
//           {
//             "error": "ZT411: How to Use the USB Thumb Drive",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=lYrh4BRjTdI"
//           },
//           {
//             "error":
//                 "ZT411: How to clean the Media Sensor and Exterior on the ZT411",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=xBsQEfQX2Sk",
//           },
//         ]
//       },
//       {
//         'name': 'ZT410',
//         'describe': 'ZT410 Trouble Shoot',
//         'subCategories': [
//           'ZT410: Printhead Open Error',
//           'ZT410: Media Out Error',
//           'ZT410: How to Run Manual Calibration',
//           'ZT410: How to Reset the Printer',
//           'ZT410: How to Run Auto Calibration',
//           'ZT410: How to Reset The Printer',
//           'ZT410: How to Change The Darkness',
//           'ZT410: How to Adjust The Print Speed',
//           'ZT410: How to Adjust Printhead Pressure',
//           'ZT410: How to Replace The Printhead',
//           'ZT410: How to Change the Platen Roller',
//           'ZT410: How to Install Ribbon',
//           'ZT410: How to replace the Platen Roller'
//         ],
//         'troubleShootDescribe': [
//           {
//             "error": "ZT410: How to replace the Platen Roller",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=kxQnKGHqYxA"
//           },
//           {
//             "error": "ZT410: Printhead Open Error",
//             "solutions": [
//               {
//                 "solution": "The printhead is not fully closed. "
//                     " Ensure the printhead is completely closed.",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=rNj3ulG1yVE"
//           },
//           {
//             "error": "ZT410: Media Out Error",
//             "solutions": [
//               {
//                 "solution": "Media is not loaded or is loaded incorrectly."
//                     " Properly load the media and ensure the media sensor is correctly positioned",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=KpGb9rVZUxQ"
//           },
//           {
//             "error": "ZT410: How to Run Manual Calibration",
//             "solutions": [
//               {
//                 "solution":
//                     "When Media is changed or alignment of the label is off, run calibration",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=RzG3vOom0Dk"
//           },
//           {
//             "error": "ZT410: How to Reset the Printer",
//             "solutions": [
//               {
//                 "solution": "Video is Provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=GjpR7uIVY7U"
//           },
//           {
//             "error": "ZT410: How to Run Auto Calibration",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=4p0qgcrQRGk"
//           },
//           {
//             "error": "ZT410: How to Change The Darkness",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=XXiwuugyluM"
//           },
//           {
//             "error": "ZT410: How to Adjust The Print Speed",
//             "solutions": [
//               {
//                 "solution": "Press the menu button at the top-left."
//                     " Navigate to the Print Speed setting. Select the print speed and save",
//                 "image": null,
//               }
//             ],
//             "videoUrl": null,
//           },
//           {
//             "error": "ZT410: How to Adjust Printhead Pressure",
//             "solutions": [
//               {
//                 "solution":
//                     "When label is not printing properly. Consider adjusting printhead pressure",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=2zVa-glgbug"
//           },
//           {
//             "error": "ZT410: How to Replace The Printhead",
//             "solutions": [
//               {
//                 "solution":
//                     "When the print quality is poor or prints have empty spots, the printhead needs to be changed.",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=NjNpJfXYzw0"
//           },
//           {
//             "error": "ZT410: How to Change the Platen Roller",
//             "solutions": [
//               {
//                 "solution":
//                     "If label is not printing properly see if the platen roller is damaged",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=9WjQAnqZ1dw"
//           },
//           {
//             "error": "ZT410: How to Install Ribbon",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=uUSkAL8W2rA"
//           }
//         ]
//       },
//       {
//         'name': 'Scanner',
//         'describe': 'Scanner Trouble Shoot',
//         'subCategories': [
//           'Scanner: Nothing appears on MES after scanning',
//           'Scanner: Scanner indicating light',
//           'Scanner: how to connect scanner to RS232'
//         ],
//         'troubleShootDescribe': [
//           {
//             "error": "Scanner: Nothing appears on MES after scanning",
//             "solutions": [
//               {
//                 "solution": "Open up ComportTest Software from desktop",
//                 "image": "assets/comport1.png"
//               },
//               {
//                 "solution": "refresh port first by touching 'refresh port list'. "
//                     " Choose the 'COM' to test which comport scanner connected to."
//                     " After choosing the comport press 'comScanner'."
//                     " If you see a blue letters try scan with scanner",
//                 "image": "assets/comport2.png"
//               },
//               {
//                 "solution":
//                     "If scanner properly scans, you should see the result below 'Column1'"
//                         " If problem insists notice IT",
//                 "image": "assets/comport3.png"
//               },
//             ],
//           },
//           {
//             "error": "Scanner: Scanner indicating light",
//             "solutions": [
//               {
//                 "solution":
//                     "Green light indicates scanner is connected and fully charged",
//                 "image": "assets/scannerlight01.png",
//               },
//               {
//                 "solution":
//                     "Yellow light indicates scanner is connected and charging",
//                 "image": "assets/scannerlight02.png",
//               },
//               {
//                 "solution":
//                     "If no LED indicator is on then make sure scanner is plugged",
//                 "image": null,
//               }
//             ]
//           },
//           {
//             "error": "Scanner: how to connect scanner to RS232",
//             "solutions": [
//               {
//                 "solution": "above image shows how to install scanner",
//                 "image": "assets/scannerinstall01.png"
//               }
//             ]
//           }
//         ],
//       },
//       {
//         'name': 'ZT230',
//         'describe': 'ZT230 Trouble Shoot',
//         'subCategories': [
//           'ZT230: Ribbon Out Error',
//           'ZT230: Media Out Error',
//           'ZT230: Faded print, smudges, or uneven printing',
//           'ZT230: How to Run Manual Calibration',
//           'ZT230: How to Replace the Platen Roller'
//         ],
//         'troubleShootDescribe': [
//           {
//             "error": "ZT230: Ribbon Out Error",
//             "solutions": [
//               {
//                 "solution": "In Thermal Transfer Mode:"
//                     "* The ribbon is loaded incorrectly."
//                     "* The ribbon sensor is not detecting the ribbon."
//                     "* Media is blocking the ribbon sensor.",
//                 "image": null,
//               }
//             ],
//             "videoUrl":
//                 "https://support.zebra.com/cpws/docs/ztseries/Setup/Video/ZT_Media_RibbonLoading/ZT_Media_RibbonLoading.html"
//           },
//           {
//             "error": "ZT230: Media Out Error",
//             "solutions": [
//               {
//                 "solution":
//                     "Verify the correct sensor is selected. The reflective sensor is used for most media"
//                         " Verify the movable Reflective Sensor is correctly positioned",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=HDbuXYtx4TM"
//           },
//           {
//             "error": "ZT230: Faded print, smudges, or uneven printing",
//             "solutions": [
//               {
//                 "solution":
//                     "Check the printhead for dirt or damage. Clean the printhead with isopropyl alcohol and a lint-free cloth."
//                         " Ensure the media and ribbon are compatible and properly loaded.",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=8_Hj2AWsJd4"
//           },
//           {
//             "error": "ZT230: Faded print, smudges, or uneven printing",
//             "solutions": [
//               {
//                 "solution": "Adjust printhead pressure",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=ClBk6oSb8uw"
//           },
//           {
//             "error": "ZT230: How to Run Manual Calibration",
//             "solutions": [
//               {
//                 "solution": "Video is provided",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=MOdyTRMu2XI"
//           },
//           {
//             "error": "ZT230: Ribbon Out Error",
//             "solutions": [
//               {
//                 "solution":
//                     "The ribbon is loaded, but the printer is set for the direct thermal method."
//                         " Remove the ribbon or change the printer to thermal transfer method.",
//                 "image": null,
//               }
//             ],
//             "videoUrl": "https://www.youtube.com/watch?v=_ukd-LQZ-A4&t=16s"
//           },
//           {
//             "error": "ZT230: How to Replace the Platen Roller",
//             "solutions": [
//               {
//                 "solution":
//                     "A damaged platen roller can decrease the print quality.",
//                 "image": null,
//               }
//             ],
//             "videoUrl":
//                 "https://www.youtube.com/watch?v=01jpUgOgiX4&list=PLrcZVTwQp0ldxmDa_E8g1zTux854FOArd&index=57"
//           }
//         ]
//       },
//       {
//         'name': 'Computer',
//         'describe': 'Computer Trouble Shoot',
//         'subCategories': [
//           'Computer: When Computer Does Not Turn on',
//           'Computer: When Computer Freezes',
//           'Computer: When Screen Does Not Turn on',
//           'Computer: When Wifi is Not Connected',
//           'Computer: What is HDMI cable'
//         ],
//         'troubleShootDescribe': [
//           {
//             "error": "Computer: When Computer Does Not Turn on",
//             "solutions": [
//               {
//                 "solution": "Make sure power cord is plugged in properly",
//                 "image": null,
//               }
//             ],
//             "videoUrl" : null,
//           },
//           {
//             "error": "Computer: When Computer Freezes",
//             "solutions": [
//               {
//                 "solution": "DO NOT FORCE QUIT THE COMPUTER."
//                     "* Check if keyboard is pressed if keyboard is connected"
//                     " Otherwise call IT",
//                 "image": null,
//               }
//             ],
//           },
//           {
//             "error": "Computer: When Screen Does Not Turn on",
//             "solutions": [
//               {
//                 "solution":
//                     "Make sure HDMI is properly plugged into the computer."
//                         " Check if power cord is properly plugged"
//                         "Above picture shows HDMI cable installed into monitor",
//                 "image": "assets/hdmi02.png" ,
//               },
//               {
//                 "solution": "above picture shows HDMI cable installed into computer",
//                 "image": "assets/hdmi01.png",
//               }
//             ],
//           },
//           {
//             "error": "Computer: When WIFI is Not Connected",
//             "solutions": [
//               {
//                 "solution": "Check if computer is has Wifi USB module connected"
//                     "Some MES desktop does not have a Wifi feature so Wifi USB is needed",
//                 "image": "assets/wifiusb.png",
//               }
//             ],
//           },
//           {
//             "error": "Computer: What is HDMI cable",
//             "solutions" : [
//               {
//                 "solution" : "HDMI stands for 'High Definition Multimedia Interface"
//                     " It is used both in the commercial AV sector and is the most used cable in homes connecting devices."
//                 " such as digital TV, DVD player, computer monitor and more",
//                 "image": "assets/hdmishape01.png"
//               }
//             ]
//           }
//         ]
//       },
//       {
//         'name': 'MES',
//         'describe': 'MES Trouble Shoot',
//         'subCategories': [
//           'MES: (WINDOW 10) When MES Freezes', // (1) 이름 같아야함
//           'MES: (WINDOW 11) When MES Freezes',
//           'MES: Barcode printer Failure: Check the printer power or cable connection'
//         ],
//         'troubleShootDescribe': [
//           {
//             "error": "MES: (WINDOW 10) When MES Freezes", //(1) 이름 같아야함
//             "solutions": [
//               {
//                 "solution": "Place your finger left side of the screen",
//                 "image": "assets/MESfreeze01.png",
//               },
//               {
//                 "solution":
//                     "Slide the finger to the right to open virtual desktop",
//                 "image": "assets/MESfreeze02.png",
//               },
//               {
//                 "solution": "touch window icon at left corner",
//                 "image": "assets/MESfreeze03.png",
//               },
//               {
//                 "solution":
//                     "restart the computer. If still having a trouble notice IT",
//                 "image": "assets/MESfreeze04.png",
//               }
//             ],
//           },
//           {
//             "error": "MES: (WINDOW 11) When MES Freezes",
//             "solutions": [
//               {
//                 "solution": "Place your finger bottom side of the screen",
//                 "image": "assets/MESfreezewin1101.png"
//               },
//               {
//                 "solution": "Slide the finger to the up to open window bar",
//                 "image": "assets/MESfreezewin1102.png",
//               },
//               {
//                 "solution":
//                     "restart the computer. If still having a trouble notice IT",
//                 "image": "assets/MESfreezewin1103.png",
//               }
//             ]
//           },
//           {
//             "error": "MES: Barcode printer Failure: Check the printer power or cable connection",
//             "solutions": [
//               {
//                 "solution" : "Above picture shows the error",
//                 "image": "assets/MESprinterpoweroff01.png"
//               },
//               {
//                 "solution" : "Make sure printer power is on and power cord is properly plugged",
//                 "image": "assets/printerpowercable01.png"
//               },
//               {
//                 "solution": "Make sure printer power is on",
//                 "image": "assets/MESprinterpoweroff02.png"
//               }
//             ]
//           }
//         ]
//       },
//       {
//         'name': 'Precautions',
//         'describe': 'Precautions for Use',
//         'subCategories': ['Precautions: Damage on Platen Roller'],
//         'troubleShootDescribe': [
//           {
//             "error": "Precautions: Damage on Platen Roller",
//             "solutions": [
//               {
//                 "solution": "Above picture is un-damaged platen roller",
//                 "image": "assets/plattenroller03.png",
//               },
//               {
//                 "solution":
//                     "Above picture is un-damaged platen roller installed into printer",
//                 "image": "assets/plattenroller01.png",
//               },
//               {
//                 "solution": "Above picture is damaged platen rollers"
//                     " Using knife to remove rolled up label can degrade printer quality leading"
//                     " uneven print with empty spot or blank lines in between barcode.",
//                 "image": "assets/plattenroller02.png",
//               }
//             ],
//           }
//         ]
//       }
//     ];
//
//     // Convert the map to a list of Category instances
//     return categoryData
//         .map((categoryMap) => Category.fromMap(categoryMap))
//         .toList();
//   }
//
//   static List<String> searchTerms = [
//     // 유저가 설치엔진에서 검색할수 있는 범위
//     'ZD411: When Label is Not Printing Properly',
//     'ZD411: How to Change the darkness of printer',
//     'ZD411: How to Perform a Manual Width Adjustment',
//     'ZD411: How to Factory reset the ZD411',
//     'ZD411: Printer Setup',
//     'ZD411: How to Replace the PrintHead',
//     'ZT411: Printhead Open Error',
//     'ZT411: How to replace the Printhead',
//     'ZT411: Media Out Error',
//     'ZT411: How to run Auto Calibration',
//     'ZT411: Ribbon In and Out Error',
//     'ZT411: Indicator Lights',
//     'ZT411: How to change the Print Type',
//     'ZT411: How to change the Darkness',
//     'ZT411: When you changed media type or ribbon, Ribbon Out Or Media Out Error',
//     'ZT411: How to Adjust the Printhead Pressure',
//     'ZT411: How to Replace the Platen Roller',
//     'ZT411: How to Calibrate RFID Media',
//     'ZT411: How to Use the USB Thumb Drive',
//     'ZT411: How to clean the Media Sensor and Exterior on the ZT411',
//     'ZT410: Printhead Open Error',
//     'ZT410: Media Out Error',
//     'ZT410: How to Run Manual Calibration',
//     'ZT410: How to Reset the Printer',
//     'ZT410: How to Run Auto Calibration',
//     'ZT410: How to Reset The Printer',
//     'ZT410: How to Change The Darkness',
//     'ZT410: How to Adjust The Print Speed',
//     'ZT410: How to Adjust Printhead Pressure',
//     'ZT410: How to Replace The Printhead',
//     'ZT410: How to Change the Platen Roller',
//     'ZT410: How to Install Ribbon',
//     'ZT230: Ribbon Out Error',
//     'ZT230: Media Out Error',
//     'ZT230: Faded print, smudges, or uneven printing',
//     'ZT230: How to Run Manual Calibration',
//     'ZT230: How to Replace the Platen Roller',
//     'Scanner: Nothing appears on MES after scanning',
//     'MES: (WINDOW10) When MES Freezes',
//     'MES: (WINDOW 11) When MES Freezes',
//     'MES: Barcode printer Failure: Check the printer power or cable connection',
//     'Precautions: Damage on Platen Roller',
//     'Computer: When Computer Does Not Turn on',
//     'Computer: When Computer Freezes',
//     'Computer: When Screen Does Not Turn on',
//     'Computer: When Wifi is Not Connected',
//     'Computer: What is HDMI cable'
//   ];
// }
