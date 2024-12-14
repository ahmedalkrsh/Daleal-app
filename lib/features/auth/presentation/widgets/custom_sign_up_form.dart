import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condtions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/custom_toast.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_botton.dart';
import 'custom_text_form_field.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is SignUpSuccessState) {
        showToast("Successed, Check your email to verfiy your account");
        customReplacementNavigate(context, RouterNames.SignInView);
      } else if (state is SignUpFailuerState) {
        showToast(state.errMessage);
      } else {}
    }, builder: (context, state) {
      AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

      return Form(
        key: authCubit.signUpFormKey,
        child: Column(
          children: [
            CustomTextField(
              labelText: AppStrings.fristName,
              onChanged: (fristName) {
                authCubit.firstName = fristName;
              },
            ),
            CustomTextField(
              labelText: AppStrings.lastName,
              onChanged: (lastName) {
                authCubit.lastName = lastName;
              },
            ),
            CustomTextField(
              labelText: AppStrings.emailAddress,
              onChanged: (emailAddress) {
                authCubit.emailAddress = emailAddress;
              },
            ),
            CustomTextField(
              suffixIcon: IconButton(
                onPressed: () {
                  authCubit.obscurePasswordText();
                },
                icon: Icon(
                  authCubit.obscurePasswordTextValue == true
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
              labelText: AppStrings.password,
              obscureText: authCubit.obscurePasswordTextValue,
              onChanged: (password) {
                authCubit.password = password;
              },
            ),
            const TermsAndCondtionsWidget(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            state is SignUpLoadingState
                ? const CircularProgressIndicator()
                : CustomBotton(
                    buttonColor:
                        authCubit.termsAndCondtionCheckBoxValue == false
                            ? AppColors.lightGrey
                            : null,
                    text: AppStrings.signUp,
                    onPressed: () async {
                      if (authCubit.termsAndCondtionCheckBoxValue == true) {
                        if (authCubit.signUpFormKey.currentState!.validate()) {
                          await authCubit.signUpWithEmailAndPassword();
                        }
                      }
                    }),
          ],
        ),
      );
    });
  }
}
