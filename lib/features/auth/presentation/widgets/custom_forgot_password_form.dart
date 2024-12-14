import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_botton.dart';
import 'custom_text_form_field.dart';


class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is ResetPasswordSuccessState) {
        showToast("Check Your Email To Reset Your Password");
        customReplacementNavigate(context, RouterNames.SignInView);
      } else if (state is ResetPasswordFailuerState) {
        showToast(state.errMessage);
      }
    }, builder: (context, state) {
      AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

      return Form(
        key: authCubit.forgotPasswordFormKey,
        child: Column(
          children: [
            CustomTextField(
              labelText: AppStrings.emailAddress,
              onChanged: (emailAddress) {
                authCubit.emailAddress = emailAddress;
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
            state is ResetPasswordLoadingState
                ? const CircularProgressIndicator()
                : CustomBotton(
                    text: AppStrings.sendResetPasswordLink,
                    onPressed: () async {
                      if (authCubit.forgotPasswordFormKey.currentState!
                          .validate()) {
                        await authCubit.resetPasswordWithLink();
                      }
                    },
                  ),
          ],
        ),
      );
    });
  }
}
