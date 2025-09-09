import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_app/features/inner_screens/auth/presentation/views/widgets/rigister_view_body_bloc_consumer.dart';

import '../../../core/services/init_getit.dart';

import 'domain/repos/auth_repo.dart';

import 'presentation/cubits/signup_cubits/signup_cubit.dart';

class RegisterView extends StatelessWidget {
  static const routeName = '/RegisterScreen';
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepo>()),
        child: Scaffold(body: RegisterViewBodyBlocConsumer()),
      ),

      //  const Scaffold(
      //   // body: Padding(
      //   //   padding: EdgeInsets.all(8.0),
      //   //   child: SingleChildScrollView(
      //   //     child: RigisterViewBody(),
      //   //   ),
      //   // ),
      // ),
    );
  }
}
