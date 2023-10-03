import 'package:ecommerce_finalproject/model/product_model.dart';
import 'package:flutter/material.dart';

class ProductWishListCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final bool  isWishlist;

  const ProductWishListCard({
    super.key,
    required this.product,
    required this.widthFactor,
    this.isWishlist = false,


  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context,'/product', arguments: product,
        );
      },

      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 60,
            left: 5,

            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 5,


            child: Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    isWishlist ?
                    Expanded(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ):
                    SizedBox(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
