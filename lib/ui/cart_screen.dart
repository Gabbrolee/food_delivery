import 'package:flutter/material.dart';
import 'package:foodie_app/ui/widgets/app_button.dart';
import 'package:foodie_app/ui/widgets/cart_plus_and_minus.dart';
import 'package:foodie_app/ui/widgets/custom_app_bar.dart';
import '../core/constant/constant/image_path.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E4E4),
      appBar: const CustomAppBar(title: "Cart"),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(ImagePath.productImage),
                            radius: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Veggie tomato mix"),
                              SizedBox(
                                height: 11,
                              ),
                              Text(
                                "#1,900",
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const PlusAndMinusCart()
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                padding: const EdgeInsets.only(left: 30, right: 20),
                child:
                    AppButton(buttonTitle: "Complete order", onPressed: () {})),
          )
        ],
      ),
    );
  }
}
