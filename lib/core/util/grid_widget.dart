import 'package:city_way/core/util/item_grid_widget.dart';
import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final double childAspectRatio;
  final List myList;
  final VoidCallback onTap;
  final bool isPoint;

  const GridViewWidget({
    super.key,
    required this.myList,
    required this.childAspectRatio,
    required this.onTap,
    required this.isPoint,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
        child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: childAspectRatio,
            children: List.generate(myList.length, (index) {
              return GestureDetector(
                onTap: onTap,
                child: Column(
                  children: [
                    ItemGridWidget(
                      isPoint: isPoint,
                      serviceType: myList[index].serviceType,
                      images: myList[index].images,
                      myHeight:
                          isPoint ? size.height * 0.15 : size.height * 0.25,
                      myWidth: size.width * 0.4,
                      numOfPoints: isPoint ? myList[index].numOfPoints : null,
                    ),
                  ],
                ),
              );
            })));
  }
}
