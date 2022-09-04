import 'dart:convert';

import 'package:fake_store/Helper/Color.dart';
import 'package:fake_store/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:fake_store/Model/product.dart' as productModel;


class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<productModel.Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallusers().then((value){
      setState(() {
       _products.addAll(value);
      });
    });
  }

  Future<List<productModel.Product>> getallusers() async{
    String url = 'https://fakestoreapi.com/products';
    var response = await http.get(Uri.parse(url));
    List<productModel.Product> users = [];
    if(response.statusCode == 200){
      var list = json.decode(response.body);
      for(var value in list){
        users.add(productModel.Product.fromJson(value));
        setState(() {
          _isLoading = false;
        });
      }
    }
    return users;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100
          ),
          child: _isLoading ? const Center(
            child: CircularProgressIndicator(color: colors.primary,)
          ) :
          SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: _products.length,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.70),
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            ProductDetail(product: _products[index])
                        )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0),
                              spreadRadius: 5,
                              blurRadius: 100,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                child: Center(
                                    child: Image.network(_products[index].image,height: 115)),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                                  child: Text(_products[index].title.toString().length >= 20 ? _products[index].title.toString().substring(0,15) : _products[index].title ,style: TextStyle(fontSize:15,color: colors.primary_app.shade400,fontFamily: GoogleFonts.nunito().fontFamily),)),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: colors.primary
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Text("₹ "+_products[index].price.toString(),style: TextStyle(color: Colors.white,fontSize: 13),),
                                ),

                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RatingBarIndicator(
                                    rating: _products[index].rating["rate"]+.0,
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: 14.0,
                                    unratedColor: Colors.amber.withAlpha(50),
                                    direction: Axis.horizontal,
                                  ),
                                  Text(' ('+ _products[index].rating["rate"].toString()+')',style: TextStyle(fontSize: 10),)
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ),
      ),
    );
  }
}
