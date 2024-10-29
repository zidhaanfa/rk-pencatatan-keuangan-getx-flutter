import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../components/config/config.dart';
import '../../../../components/widget/Custom_text.dart';
import '../../../../components/widget/Custom_text2.dart';

class InfoWallet extends StatelessWidget {
  const InfoWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: theme.primaryColor,
        elevation: 0,
        child: Stack(
          children: [
            // position widget with icon, position on top right
            Positioned(
              top: 10,
              right: 10,
              child: Icon(
                FontAwesomeIcons.wallet,
                size: 100,
                color:
                    theme.buttonTheme.colorScheme!.onPrimary.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wallet,
                        size: 30,
                        color: theme.buttonTheme.colorScheme!.onPrimary,
                      ),
                      10.horizontalSpace,
                      CustomText(
                        text: 'Your Wallet',
                        fontType: FontType.bodyLarge,
                        weight: FontWeight.bold,
                        colorText: theme.buttonTheme.colorScheme!.onPrimary,
                      ),
                    ],
                  ),
                  5.verticalSpace,
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          CustomText2(
                            text: 'Today ',
                            fontType: FontType.titleMedium,
                            weight: FontWeight.bold,
                            colorText: theme.buttonTheme.colorScheme!.primary,
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          10.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width * 0.40,
                                padding: const EdgeInsets.only(
                                  right: 16,
                                  left: 16,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.rupiahSign,
                                          size: 20,
                                          color: Colors.green,
                                        ),
                                        10.horizontalSpace,
                                        CustomText(
                                          text: 'Balance',
                                          fontType: FontType.bodyMedium,
                                          weight: FontWeight.bold,
                                          colorText: Colors.green,
                                        ),
                                      ],
                                    ),
                                    5.verticalSpace,
                                    CustomText(
                                      text: 'Rp 1.000.000',
                                      fontType: FontType.bodyMedium,
                                      colorText: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: theme.shadowColor.withOpacity(0.3),
                                width: 1,
                                height: 30,
                              ),
                              Container(
                                width: Get.width * 0.40,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.percent,
                                          size: 20,
                                          color: Colors.blue,
                                        ),
                                        10.horizontalSpace,
                                        CustomText(
                                          text: 'Percentage',
                                          fontType: FontType.bodyMedium,
                                          weight: FontWeight.bold,
                                          colorText: Colors.blue,
                                        ),
                                      ],
                                    ),
                                    5.verticalSpace,
                                    CustomText(
                                      text: '10%',
                                      fontType: FontType.bodyMedium,
                                      colorText: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Get.width * 0.40,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.moneyBillWave,
                                          size: 20,
                                          color: Colors.orange,
                                        ),
                                        10.horizontalSpace,
                                        CustomText(
                                          text: 'Cash In',
                                          fontType: FontType.bodyMedium,
                                          weight: FontWeight.bold,
                                          colorText: Colors.orange,
                                        ),
                                      ],
                                    ),
                                    5.verticalSpace,
                                    CustomText(
                                      text: 'Rp 500.000',
                                      fontType: FontType.bodyMedium,
                                      colorText: Colors.orange,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: theme.shadowColor.withOpacity(0.3),
                                width: 1,
                                height: 30,
                              ),
                              Container(
                                width: Get.width * 0.40,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.moneyBillTransfer,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                        10.horizontalSpace,
                                        CustomText(
                                          text: 'Cash Out',
                                          fontType: FontType.bodyMedium,
                                          weight: FontWeight.bold,
                                          colorText: Colors.red,
                                        ),
                                      ],
                                    ),
                                    5.verticalSpace,
                                    CustomText(
                                      text: 'Rp 500.000',
                                      fontType: FontType.bodyMedium,
                                      colorText: Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Card(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       InkWell(
                  //         onTap: () {},
                  //         child: Container(
                  //           width: Get.width * 0.40,
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 16,
                  //             vertical: 20,
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Icon(
                  //                 FontAwesomeIcons.signInAlt,
                  //                 size: 20,
                  //                 color: MyTheme
                  //                     .theme.buttonTheme.colorScheme!.secondary,
                  //               ),
                  //               10.horizontalSpace,
                  //               CustomText(
                  //                 text: 'Check In',
                  //                 fontType: FontType.bodyMedium,
                  //                 weight: FontWeight.bold,
                  //                 colorText: MyTheme
                  //                     .theme.buttonTheme.colorScheme!.secondary,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       Container(
                  //         color: Colors.black.withOpacity(0.3),
                  //         width: 1,
                  //         height: 30,
                  //       ),
                  //       InkWell(
                  //         onTap: () {},
                  //         child: Container(
                  //           width: Get.width * 0.40,
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 16,
                  //             vertical: 20,
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Icon(
                  //                 FontAwesomeIcons.signOutAlt,
                  //                 size: 20,
                  //                 color: MyTheme
                  //                     .theme.buttonTheme.colorScheme!.secondary,
                  //               ),
                  //               10.horizontalSpace,
                  //               CustomText(
                  //                 text: 'Check Out',
                  //                 fontType: FontType.bodyMedium,
                  //                 weight: FontWeight.bold,
                  //                 colorText: MyTheme
                  //                     .theme.buttonTheme.colorScheme!.secondary,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
