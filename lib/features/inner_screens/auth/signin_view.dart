import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/init_getit.dart';
import 'domain/repos/auth_repo.dart';
import 'presentation/cubits/signin_cubit/signin_cubit.dart';
import 'presentation/views/widgets/signin_view_body_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  static const routeName = '/LoginScreen';
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) => SigninCubit(getIt<AuthRepo>()),
        child: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
