import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tourism_ui/models/destination_model.dart';

class CarouselHeader extends StatelessWidget {
  final String title;
  final String link;

  CarouselHeader({@required this.title, @required this.link});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          GestureDetector(
            onTap: () => print('See All'),
            child: Text(
              link,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselBody extends StatelessWidget {
  final double containerHeight;
  final double cardWidth;
  final double detailsHeight;
  final double detailsWidth;
  final double imageHeight;
  final double imageWidth;

  CarouselBody({
    this.containerHeight = 300.0,
    this.cardWidth = 210.0,
    this.detailsHeight = 120.0,
    this.detailsWidth = 200.0,
    this.imageHeight = 180.0,
    this.imageWidth = 180.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      // color: Colors.blue,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          Destination destination = destinations[index];
          return Container(
            margin: const EdgeInsets.all(10.0),
            width: cardWidth,
            // color: Colors.red,
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                _CardBody(destination, detailsWidth, detailsHeight),
                _CardImage(destination, imageWidth, imageHeight),
              ],
            ),
          );
        },
        itemCount: destinations.length,
      ),
    );
  }
}

class _CardBody extends StatelessWidget {
  final Destination destination;
  final double detailsWidth;
  final double detailsHeight;

  _CardBody(this.destination, this.detailsWidth, this.detailsHeight);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 5.0,
      child: Container(
        width: detailsWidth,
        height: detailsHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '${destination.activities.length} activities',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                destination.description,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CardImage extends StatelessWidget {
  final Destination destination;
  final double imageWidth;
  final double imageHeight;

  _CardImage(this.destination, this.imageWidth, this.imageHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              height: imageHeight,
              width: imageWidth,
              image: AssetImage(destination.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  destination.city,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.locationArrow,
                      size: 10.0,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      destination.country,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
