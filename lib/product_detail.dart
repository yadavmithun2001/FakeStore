import 'package:fake_store/Helper/Color.dart';
import 'package:flutter/material.dart';
import 'package:fake_store/Model/product.dart' as productModel;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  final productModel.Product product;
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: colors.primary,
          borderRadius: BorderRadius.circular(100)
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: Text('Buy Now',style: TextStyle(fontSize:18,color: Colors.white,fontWeight: FontWeight.bold),),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 30, 80, 20),
                    child: Image.network(widget.product.image),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                    child: Text("₹ "+widget.product.price.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: colors.primary),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                    child: Text(widget.product.title.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10, 0, 0),
                    child: Text('Description',style: TextStyle(color: Colors.grey.shade600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                    child: Text(widget.product.description.toString(),style: TextStyle(fontSize: 15,color: Colors.black),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,10, 0, 0),
                    child: Text('Ratings and Reviews',style: TextStyle(color: Colors.grey.shade600),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 5, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBarIndicator(
                          rating: widget.product.rating["rate"]+.0,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.amber.withAlpha(50),
                          direction: Axis.horizontal,
                        ),
                        Text(' ('+ widget.product.rating["rate"].toString()+')',style: TextStyle(fontSize: 14),)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                    child: Text('Total Reviews: '+widget.product.rating['count'].toString(),style: TextStyle(fontSize: 14,color: Colors.black),),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      iconTheme: IconThemeData(
        color: colors.primary
      ),
      title:  Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: SizedBox()),
          Text('FakeStore',style: TextStyle(color: colors.primary,fontSize: 19,fontWeight: FontWeight.bold,fontFamily: GoogleFonts.nunito().fontFamily)),
          Expanded(child: SizedBox())
        ],
      ),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(
              "assets/search.svg",
              height: 17,
              color: colors.primary,
            ),
            onPressed: () {
            }),
      ],

      backgroundColor: Colors.white,
    );
  }

}
