import 'package:clean_architecture/core/constants/enum/alert_type.dart';
import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/router/route_name.dart';
import 'package:clean_architecture/core/utils/app_dialog.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/core/utils/extension/form_state_extension.dart';
import 'package:clean_architecture/features/login/presentation/cubit/login_cubit.dart';
import 'package:clean_architecture/features/login/presentation/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return previous.status != current.status;
      },
      listener: (context, state) {
        if (state.status == StateStatus.success) {
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
          body: Center(
            child: state.status == StateStatus.loading
                ? const CircularProgressIndicator()
                : FormBuilder(
                    key: loginCubit.formKey,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "REGISTER ACCOUNT",
                            style: context.textTheme.titleLarge?.copyWith(
                              color: Colors.blue,
                              fontSize: 30,
                            ),
                          ),
                          const Gap(40),
                          FormBuilderTextField(
                            name: "email",
                            decoration:
                                const InputDecoration(hintText: "email"),
                            validator: (value) {
                              if (value != null) {
                                return null;
                              }
                              return "Enter email";
                            },
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                          const Gap(20),
                          FormBuilderTextField(
                            name: "password",
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "password",
                            ),
                            validator: (value) {
                              if (value != null) {
                                return null;
                              }
                              if ({value ?? ""}.length < 6) {
                                return "Password must be more then 6 digit";
                              }

                              return "Enter password !";
                            },
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                          const Gap(20),
                          FormBuilderTextField(
                            name: "confirm_password",
                            obscureText: true,
                            decoration: const InputDecoration(
                              hintText: "confirm password",
                            ),
                            validator: (confirmPassword) {
                              if (confirmPassword != null) {
                                return null;
                              }
                              final String? password =
                                  loginCubit.formKey.formData?["password"];

                              if (confirmPassword != password) {
                                return "Password was not match !";
                              }

                              return "Enter confirm password !";
                            },
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                          const Gap(40),
                          ElevatedButton(
                            onPressed: loginCubit.onRegisterWithFirebase,
                            child: Text(
                              "Register",
                              style: context.textTheme.bodyLarge
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                          const Gap(40),
                          Text(
                            "Already have account",
                            style: context.textTheme.bodyMedium,
                          ),
                          const Gap(10),
                          OutlinedButton(
                            onPressed: () {
                              AppNavigator.pop();
                            },
                            child: const Text("Login"),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
