import 'package:flutter/material.dart';
import 'package:food_app/constants/colors.dart';
import 'package:food_app/constants/strings.dart';
import 'package:food_app/view_model/user_state.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Consumer<UserState>(
          builder: (context, value, child) {
            if (value.loading) {
              return const SizedBox();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  AppStrings.welcomeText,
                  style: TextStyle(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        value.user!.userName,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(value.user!.displayPicture),
                      ),
                    ],
                  ),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.search,
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
