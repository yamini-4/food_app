import 'package:flutter/material.dart';
import 'package:food_app/view/home/header.dart';
import 'package:food_app/view/home/menu_bar.dart';
import 'package:food_app/view/home/product_list.dart';
import 'package:food_app/view/home/promo_poster.dart';
import 'package:food_app/view_model/product_state.dart';
import 'package:food_app/view_model/user_state.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<ProductState>(context, listen: false).getProducts();
    Provider.of<UserState>(context, listen: false).getUserdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Header(),
          Expanded(
            child: Row(
              children: [
                const MenuBar(),
                Expanded(
                  child: Consumer<ProductState>(
                    builder: (context, value, child) {
                      // shows the loader till the json read completes
                      if (value.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            PromoPoster(
                              promotion: value.promotion!,
                            ),
                            ProductList(
                              popularItems: value.popularItems!,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
