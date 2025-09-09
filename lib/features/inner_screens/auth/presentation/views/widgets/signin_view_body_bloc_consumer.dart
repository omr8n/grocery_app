import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../../core/helper_functions/build_error_bar.dart';

import '../../../../../../core/helper/functions/build_error_bar.dart';
import '../../../../../../core/widgets/custom_progress_hud.dart';
import '../../../../../root/presentation/views/root_view.dart';
import '../../cubits/signin_cubit/signin_cubit.dart';
import 'signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, RootView.routeName);
        }

        if (state is SigninFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: const SigninViewBody(),
        );
      },
    );
  }
}
