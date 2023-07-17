import 'package:flutter/material.dart';
import '../../core/models/product.dart';
import '../product_detail_screen.dart';
import 'package:collection/collection.dart';


class FoodCard extends StatelessWidget {
  final Product product;
  const FoodCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailScreen(product: product),
        ),
      ),
      child: SizedBox(
        height: 270 + 42,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Card(
              color: Colors.white,
              elevation: 3,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: SizedBox(
                height: 270,
                width: 220,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 189 - 42),
                        Text(
                          product.title ?? "--",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "N${product.price ?? "--"}",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Image section
            Positioned(
              top: -20,
              height: 169,
              width: 158,
              child: Container(
              //  height: 189,
              //  width: 168,
                decoration: BoxDecoration(
                  image: hasImage ? DecorationImage(
                    image: NetworkImage(product.images!.first), fit: BoxFit.cover,
                  ) : null,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool get hasImage => product.images?.firstWhereOrNull != null;
}

