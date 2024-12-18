import 'package:clean_architecture/core/constants/enum/alert_type.dart';
import 'package:clean_architecture/core/constants/enum/state_status.dart';
import 'package:clean_architecture/core/router/app_navigator.dart';
import 'package:clean_architecture/core/utils/app_dialog.dart';
import 'package:clean_architecture/core/utils/extension/context_extension.dart';
import 'package:clean_architecture/core/utils/extension/double_extension.dart';
import 'package:clean_architecture/features/post/domain/entities/post.dart';
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
    final title = postCubit.post == null ? "Create" : "Update";
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) async {
        if (state.status == StateStatus.error) {
          AppDialog.alert(
            type: AlertType.error,
            title: state.error?.title ?? "",
            desc: state.error?.msg ?? "",
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("$title Post"),
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
                    validator: (value) {
                      if(value != null){
                        return null;
                      }
                      return "Enter title";
                    },
                  ),
                  const Gap(10),
                  FormBuilderTextField(
                    name: "body",
                    maxLines: 4,
                    decoration: const InputDecoration(hintText: "body"),
                    validator: (value) {
                      if(value != null){
                        return null;
                      }
                      return "Enter body";
                    },
                  ),
                  const Gap(40),
                  ElevatedButton(
                    onPressed: () async {
                      Post? newPost = await postCubit.onCreatePost();
                      if (newPost != null) {
                        await AppDialog.alert(
                          title: "Success",
                          desc: "$title post completed.",
                        );
                        AppNavigator.pop(newPost);
                      }
                    },
                    child: Container(
                      width: 100.width,
                      height: 48,
                      alignment: Alignment.center,
                      child: Text(
                        title,
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
