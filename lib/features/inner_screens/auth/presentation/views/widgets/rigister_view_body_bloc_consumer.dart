import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/widgets/loading_manager.dart';

// import '../../../../../core/helper_functions/build_error_bar.dart';

import '../../../../../../core/helper/functions/build_error_bar.dart';
import '../../../../../../core/widgets/custom_progress_hud.dart';
import '../../cubits/signup_cubits/signup_cubit.dart';
import 'register_view_body.dart';

// class RegisterViewBodyBlocConsumer extends StatelessWidget {
//   const RegisterViewBodyBlocConsumer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SignupCubit, SignupState>(
//       listener: (context, state) {
//         if (state is SignupSuccess) {
//           Navigator.pop(context);
//         }
//         if (state is SignupFailure) {
//           showBar(context, state.message);
//         }
//       },
//       builder: (context, state) {
//         return CustomProgressHud(
//           isLoading: state is SignupLoading ? true : false,
//           child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: RigisterViewBody(),
//           ),
//           // child: const SignupViewBody(),
//         );
//       },
//     );
//   }
// }
class RegisterViewBodyBlocConsumer extends StatelessWidget {
  const RegisterViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pop(context);
        }
        if (state is SignupFailure) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return LoadingManager(
          isLoading: state is SignupLoading,
          child: const RigisterViewBody(), // <<< مافي ScrollView هون
        );
      },
    );
  }
}
