import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:woocommerce_shop/resource/constants.dart';

class ImageCarouselProduct extends StatefulWidget {
  final List<String> list;

  const ImageCarouselProduct({Key? key, required this.list}) : super(key: key);

  @override
  _ImageCarouselProductState createState() => _ImageCarouselProductState();
}

class _ImageCarouselProductState extends State<ImageCarouselProduct> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  late final List<Widget> list;

  @override
  void initState() {
    super.initState();
    list = widget.list
        .map((e) => ElementSlider(
              imageSliders: e,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider(
          items: list,
          carouselController: _controller,
          options: CarouselOptions(
              height: 260,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context)
                              .primaryColor
                              .withOpacity(_current == entry.key ? 1 : 0.5)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ElementSlider extends StatelessWidget {
  final String imageSliders;

  const ElementSlider({Key? key, required this.imageSliders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageSliders,
        fit: BoxFit.contain, width: MediaQuery.of(context).size.width);
  }
}
