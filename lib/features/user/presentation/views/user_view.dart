import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/features/inner_screens/auth/forget_pass.dart';

import 'package:grocery_app/features/user/presentation/views/widgets/custom_list_tile.dart';

import '../../../../core/cubits/theme_cubit/theme_cubit.dart';
import '../../../../core/cubits/theme_cubit/theme_state.dart';
import '../../../../core/helper/functions/global_methods.dart';

import '../../../../core/helper/get_user.dart';
// import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/widgets/custom_text.dart';

import '../../../inner_screens/auth/signin_view.dart';
import '../../../inner_screens/orders/orders_view.dart';

import '../../../inner_screens/viewed_recently/viewed_recently_view.dart';
import '../../../inner_screens/wishlist/wishlist_view.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  //  late FirebaseAuthService firebaseAuthService;

  late TextEditingController _addressTextController;

  @override
  void initState() {
    _addressTextController = TextEditingController(text: "");
    //    firebaseAuthService = FirebaseAuthService();

    getUserData();
    super.initState();
  }

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  final isLoggedIn = FirebaseAuthService.isLoggedIn();
  String get userName => isLoggedIn ? getUser().name : "Guest User";

  String get userEmail => isLoggedIn ? getUser().email : "guest@example.com";
  String? address;
  //  bool _isLoading = false;
  Future<void> getUserData() async {
    // setState(() {
    //   _isLoading = true;
    // });
    // if (user == null) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   return;
    // }
    // try {
    //   String _uid = user!.uid;

    //   final DocumentSnapshot userDoc =
    //       await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    //   if (userDoc == null) {
    //     return;
    //   } else {
    //     _email = userDoc.get('email');
    //     _name = userDoc.get('name');
    //     address = userDoc.get('shipping-address');
    //     _addressTextController.text = userDoc.get('shipping-address');
    //   }
    // } catch (error) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   GlobalMethods.errorDialog(subtitle: '$error', context: context);
    // } finally {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final ThemeProvider themeProvider = Provider.of<ThemeProvider>(
    //   context,
    //   listen: true,
    // );
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                text: 'Hi,  ',
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: userName,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('My name is pressed');
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            CustomText(
              text: userEmail,

              fontSize: 18,
              // isTitle: true,
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 20),
            CustomListTile(
              title: 'Address 2',
              subtitle: address,
              icon: IconlyLight.profile,
              onTap: () async {
                await GlobalMethods.showAddressDialog(
                  onChanged: (value) {
                    _addressTextController.text = value;
                    log(
                      '_addressTextController.text ${_addressTextController.text}',
                    );
                  },
                  controller: _addressTextController,
                  context: context,
                  onPressed: () async {
                    // String _uid = user!.uid;
                    // try {
                    //   await FirebaseFirestore.instance
                    //       .collection('users')
                    //       .doc(_uid)
                    //       .update({
                    //     'shipping-address': _addressTextController.text,
                    //   });
                    address = _addressTextController.text;
                    Navigator.pop(context);
                    //   setState(() {

                    //   });
                    // } catch (err) {
                    //   GlobalMethods.errorDialog(
                    //       subtitle: err.toString(), context: context);
                    // }
                  },
                );
              },
            ),
            CustomListTile(
              title: 'Orders',
              icon: IconlyLight.bag,
              onTap: () async {
                GlobalMethods.navigateTo(
                  ctx: context,
                  routeName: OrdersView.routeName,
                );
              },
            ),
            CustomListTile(
              title: 'Wishlist',
              icon: IconlyLight.heart,
              onTap: () async {
                GlobalMethods.navigateTo(
                  ctx: context,
                  routeName: WishlistView.routeName,
                );
              },
              //subtitle: '',
            ),
            CustomListTile(
              title: 'Viewed',
              icon: IconlyLight.show,
              onTap: () async {
                GlobalMethods.navigateTo(
                  ctx: context,
                  routeName: ViewedRecentlyView.routeName,
                );
              },
            ),
            CustomListTile(
              title: 'Forget password',
              icon: IconlyLight.unlock,
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const ForgetPasswordScreen(),
                //   ),
                // );
                Navigator.pushNamed(context, ForgetPasswordView.routeName);
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //    const TitlesTextWidget(label: "Settings"),
                const SizedBox(height: 7),
                BlocBuilder<ThemeCubit, ThemeState>(
                  builder: (context, state) {
                    final isDark = state is DarkThemeState;
                    return SwitchListTile(
                      secondary: Icon(
                        isDark
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                      ),
                      // secondary: Image.asset(Assets.imagesProfileTheme),
                      title: Text(isDark ? "Dark mode" : "Light mode"),
                      value: isDark,
                      onChanged: (value) {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    );
                  },
                ),
                // SwitchListTile(
                //   title: CustomText(
                //     text: themeProvider.getIsDarkTheme
                //         ? 'Dark mode'
                //         : 'Light mode',

                //     fontSize: 18,
                //     // isTitle: true,
                //   ),
                //   secondary: Icon(themeProvider.getIsDarkTheme
                //       ? Icons.dark_mode_outlined
                //       : Icons.light_mode_outlined),
                //   onChanged: (bool value) {
                //     themeProvider.setDarkTheme(themeValue: value);
                //   },
                //   value: themeProvider.getIsDarkTheme,
                // ),
                CustomListTile(
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  // title: user == null ? 'Login' : 'Logout',
                  // icon: user == null ? IconlyLight.login : IconlyLight.logout,
                  onTap: () async {
                    // if (user == null) {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) => const LoginScreen(),
                    //     ),
                    //   );
                    //   return;
                    // }
                    Navigator.pushNamed(context, SigninView.routeName);
                    GlobalMethods.warningDialog(
                      title: 'Sign out',
                      subtitle: 'Do you wanna sign out?',
                      fct: () async {
                        // await authInstance.signOut();
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => const Scaffold(),
                        //   ),
                        // );
                      },
                      context: context,
                    );
                  },
                  // subtitle: '',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
