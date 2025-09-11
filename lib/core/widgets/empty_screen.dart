import 'package:flutter/material.dart';
import 'package:grocery_app/core/helper/functions/global_methods.dart';
import 'package:grocery_app/core/widgets/custom_text.dart';
// import 'package:grocery_app/features/home/presentation/views/widgets/product_grid_view.dart';
import 'package:grocery_app/features/inner_screens/product_view.dart';

import '../utils/utils.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
  });
  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    // final Color color = Utils(context).color;
    // final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              const SizedBox(height: 10),
              const Text(
                'Whoops!',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              CustomText(text: title, color: Colors.cyan, fontSize: 20),
              const SizedBox(height: 20),
              CustomText(text: subtitle, color: Colors.cyan, fontSize: 20),
              SizedBox(height: size.height * 0.1),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.onPrimaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      // color: color,
                    ),
                  ),
                  // onPrimary: color,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                ),
                onPressed: () {
                  // Navigator.pushReplacementNamed(
                  //   context,
                  //   ProductsView.routeName,
                  // );
                  GlobalMethods.navigateTo(
                    ctx: context,
                    routeName: ProductsView.routeName,
                  );
                },
                child: CustomText(
                  text: buttonText,
                  fontSize: 20,
                  //color: const Color.fromARGB(255, 249, 249, 255),
                  // color:
                  //     themeState ? Colors.grey.shade300 : Colors.grey.shade800,
                  isTitle: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
