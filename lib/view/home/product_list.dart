import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/model/data_model/product_response.dart';

class ProductList extends StatelessWidget {
  final List<Popular> popularItems;

  const ProductList({Key? key, required this.popularItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 26.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              AppStrings.popular,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: popularItems.length,
            shrinkWrap: true,
            //to occupy min space acc to no of items
            itemBuilder: (BuildContext context, int index) {
              Popular item = popularItems[index];

              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(item.imageUrl!),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.primaries[
                            Random().nextInt(Colors.primaries.length)],
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.foodName!,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              item.ingredients!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.6)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
