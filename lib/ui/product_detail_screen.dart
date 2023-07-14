import 'package:flutter/material.dart';
import 'package:foodie_app/core/models/product.dart';
import 'package:foodie_app/ui/cart_screen.dart';
import 'package:foodie_app/ui/widgets/app_button.dart';
import 'package:foodie_app/ui/widgets/custom_app_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Product product;

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    product = widget.product;
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),
      appBar: const CustomAppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 30, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(product.images.first))),
                  ),
                  const SizedBox(height: 15),
                  Text(product.title ?? "--"),
                  const SizedBox(height: 8),
                  Text(product.description ?? "No description"),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: AppButton(
                buttonTitle: "Add to cart",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
