import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/features/inner_screens/auth/presentation/views/widgets/register_view_body_app_bar.dart';
import 'package:grocery_app/features/inner_screens/auth/presentation/views/widgets/register_view_body_form.dart';

import '../../../../../../core/constants/app_constants.dart';
// import '../../../../../../core/helper/functions/global_methods.dart';
// import '../../../forget_pass.dart';
import '../../../signin_view.dart';

// class RigisterViewBody extends StatelessWidget {
//   const RigisterViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand, // <-
//         children: <Widget>[
//           Swiper(
//             duration: 800,
//             autoplayDelay: 6000,
//             itemBuilder: (BuildContext context, int index) {
//               return Image.asset(
//                 AppConstants.authImagesPaths[index],
//                 fit: BoxFit.cover,
//               );
//             },
//             autoplay: true,
//             itemCount: AppConstants.authImagesPaths.length,
//           ),
//           Positioned.fill(
//             child: Container(color: Colors.black.withOpacity(0.7)),
//           ),
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               // crossAxisAlignment: CrossAxisAlignment.start,
//               // mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 const SizedBox(height: 60.0),
//                 RegisterViewBodyAppBar(),
//                 RegisterViewBodyForm(),
//                 const SizedBox(height: 5.0),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {
//                       GlobalMethods.navigateTo(
//                         ctx: context,
//                         routeName: ForgetPasswordView.routeName,
//                       );
//                     },
//                     child: const Text(
//                       'Forget password?',
//                       maxLines: 1,
//                       style: TextStyle(
//                         color: Colors.lightBlue,
//                         fontSize: 18,
//                         decoration: TextDecoration.underline,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 RichText(
//                   text: TextSpan(
//                     text: 'Already a user?',
//                     style: const TextStyle(color: Colors.white, fontSize: 18),
//                     children: <TextSpan>[
//                       TextSpan(
//                         text: ' Sign in',
//                         style: const TextStyle(
//                           color: Colors.lightBlue,
//                           fontSize: 18,
//                         ),
//                         recognizer: TapGestureRecognizer()
//                           ..onTap = () {
//                             Navigator.pushReplacementNamed(
//                               context,
//                               SigninView.routeName,
//                             );
//                           },
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class RigisterViewBody extends StatelessWidget {
  const RigisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SizedBox(
          height: screenHeight,
          child: Swiper(
            duration: 800,
            autoplayDelay: 6000,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                AppConstants.authImagesPaths[index],
                fit: BoxFit.cover,
              );
            },
            autoplay: true,
            itemCount: AppConstants.authImagesPaths.length,
          ),
        ),
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.7))),
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60.0),
              const RegisterViewBodyAppBar(),
              const RegisterViewBodyForm(),

              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  text: 'Already a user?',
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Sign in',
                      style: const TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 18,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(
                            context,
                            SigninView.routeName,
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
