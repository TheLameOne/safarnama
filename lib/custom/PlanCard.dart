import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlanCard extends StatelessWidget {
  String? heading;
  String? description;
  String? duration;
  double? rating;
  double? price;
  double? discount;
  String? image;

  PlanCard(
      {this.duration,
      this.heading,
      this.description,
      this.rating,
      this.price,
      this.discount,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Image
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image!), fit: BoxFit.fill),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              height: 100,
              width: 100,
            ),
            SizedBox(width: 8),
            // Data
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    duration!,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    heading!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description!,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            (i < rating!)
                                ? Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.star_outline,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                        ],
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.share_rounded, size: 22)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // Rate
        Container(
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        IconData(0xf05db, fontFamily: 'MaterialIcons'),
                        size: 16,
                      ),
                      Text(price!.toInt().toString(),
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text('per person',
                      style: TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
              if (discount! > 0)
                Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2, bottom: 2, left: 8, right: 8),
                    child: Text('${discount?.truncate()}% OFF',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              SizedBox(height: 4),
            ],
          ),
        )
      ]),
    );
  }
}
