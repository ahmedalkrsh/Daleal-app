import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_botton.dart';
import 'custom_text_form_field.dart';
import 'forget_password_text_widget.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is SignInSuccessState) {
        // FirebaseAuth.instance.currentUser!.emailVerified?
        customReplacementNavigate(context, RouterNames.HomeNavBarWidget);
        // : showToast("Please Verfiy Your Email");
      } else if (state is SignInFailuerState) {
        showToast(state.errMessage);
      }
    }, builder: (context, state) {
      AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

      return Form(
        key: authCubit.signInFormKey,
        child: Column(
          children: [
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
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: ForgetPassWordTextWidget(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            state is SignInLoadingState
                ? const CircularProgressIndicator()
                : CustomBotton(
                    text: AppStrings.signIn,
                    onPressed: () async {
                      if (authCubit.signInFormKey.currentState!.validate()) {
                        await authCubit.sigInWithEmailAndPassword();
                      }
                    },
                  ),
          ],
        ),
      );
    });
  }
}
