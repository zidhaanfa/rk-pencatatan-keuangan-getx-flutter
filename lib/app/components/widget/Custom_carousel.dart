import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/components/controller/base_controller.dart';

import 'widget_max_width.dart';

class CustomCarousel extends StatefulWidget {
  CustomCarousel({
    Key? key,
    // required this.infiniteController,
    required this.data,
    required this.height,
    required this.itemWidth,
    required this.selectedIndex,
    this.autoSlide,
  }) : super(key: key);

  // InfiniteScrollController infiniteController;
  List<String> data;
  double height;
  double itemWidth;
  int selectedIndex;
  bool? autoSlide;
  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  int selectedIndex = 0;
  int totalIndex = 0;

  // late InfiniteScrollController infiniteController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // infiniteController = widget.infiniteController;
    // infiniteController = InfiniteScrollController();
    setState(() {
      totalIndex = widget.data.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    BaseController controller = BaseController();
    return Obx(() {
      return Column(
        children: [
          Text(
            controller.count.value.toString(),
            style: TextStyle(fontSize: 1, color: Colors.transparent),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: widget.height,
            width: Get.width >= 600 ? 600 : widget.itemWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Visibility(
                visible: widget.data.isNotEmpty,
                replacement: Container(
                  height: widget.height,
                  width: Get.width >= 600 ? 600 : widget.itemWidth,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: kElevationToShadow[2],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/person1.png',
                          width: Get.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(150, 0, 0, 0),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: kElevationToShadow[2],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/person1.png',
                                width: 70,
                                height: 70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: widget.autoSlide ?? true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    height: widget.height,
                    viewportFraction: 1,
                    enlargeFactor: 1,
                    autoPlayInterval: const Duration(seconds: 5),
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  items: widget.data
                      .map((item) => Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(173, 255, 255, 255),
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: kElevationToShadow[2],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                item,
                                width:
                                    Get.width >= 600 ? 600 : widget.itemWidth,
                                height: widget.height + 20,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Text(
                                      'Image not found',
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
          WidgetMaxWidth(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                height: 20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: widget.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedIndex == index
                              ? Color(0xFFD9D9D9)
                              : Color.fromARGB(172, 187, 186, 186),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
