import 'package:fake_store/Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 100),
        SvgPicture.asset("assets/empty_cart.svg"),
        SizedBox(height: 50),
        Text('Empty Cart',style: TextStyle(fontSize: 18,color: colors.primary),)
        
      ],
    );
  }
}
