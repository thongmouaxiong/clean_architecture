import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/core/utils/extension/double_extension.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_cubit.dart';
import 'package:clean_architecture/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final postCubit = context.read<PostCubit>();
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state.status == StateStatus.success) {
          AppNavigator.pop();
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Create Post"),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 20,
            ),
            child: FormBuilder(
              key: postCubit.formKey,
              initialValue: postCubit.formInitial,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: "title",
                    decoration: const InputDecoration(hintText: "title"),
                  ),
                  const Gap(10),
                  FormBuilderTextField(
                    name: "body",
                    maxLines: 4,
                    decoration: const InputDecoration(hintText: "body"),
                  ),
                  const Gap(40),
                  ElevatedButton(
                    onPressed: postCubit.onCreatePost,
                    child: Container(
                      width: 100.width,
                      height: 48,
                      alignment: Alignment.center,
                      child: Text(
                        "Create",
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
