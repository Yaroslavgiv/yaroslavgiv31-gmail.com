import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:woocommerce_shop/resource/constants.dart';

class ImageCarouselPromo extends StatefulWidget {
  final List<String> list;

  const ImageCarouselPromo({Key? key, required this.list}) : super(key: key);

  @override
  _ImageCarouselPromoState createState() => _ImageCarouselPromoState();
}

class _ImageCarouselPromoState extends State<ImageCarouselPromo> {
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
              autoPlay: (list.length > 1) ? true : false,
              autoPlayInterval: const Duration(seconds: 6),
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              //enlargeCenterPage: true,
              //aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        (list.length > 1) ?
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                          color: Colors.white
                              .withOpacity(_current == entry.key ? 1 : 0.5)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        )
        :
        const SizedBox(),
      ],
    );
  }
}

class ElementSlider extends StatelessWidget {
  final String imageSliders;

  const ElementSlider({Key? key, required this.imageSliders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(imageSliders,
            fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Sale 50%',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
} // прокрутка верхнего экрана
