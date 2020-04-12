import 'package:flutter/material.dart';
import 'package:tourism_ui/widgets/carousel_elements.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CarouselHeader(link: 'See All', title: 'Top Destinations'),
        CarouselBody(),
      ],
    );
  }
}
