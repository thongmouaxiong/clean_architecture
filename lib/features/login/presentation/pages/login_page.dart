import 'package:clean_architecture/core/constants/enum/alert_type.dart';
import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/route_name.dart';
import 'package:clean_architecture/core/utils/app_dialog.dart';
import 'package:clean_architecture/features/login/presentation/cubit/login_cubit.dart';
import 'package:clean_architecture/features/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == StateStatus.success || state.alreadLogined) {
          AppNavigator.pushNamed(routeName: RouteName.homePage);
        } else if (state.status == StateStatus.error) {
          AppDialog.alert(
            type: AlertType.error,
            title: state.error?.title,
            desc: state.error?.msg,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
            leading: const SizedBox.shrink(),
          ),
          body: Center(
            child: state.status == StateStatus.loading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: loginCubit.onLoginWithGoogle,
                        child: const Text("Login with Google"),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
