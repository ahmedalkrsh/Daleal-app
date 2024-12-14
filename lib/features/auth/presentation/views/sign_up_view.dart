import 'package:dalel/core/functions/custom_navigate.dart';
import 'package:dalel/core/routes/app_router.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_sign_up_form.dart';
import '../widgets/have_an_account.dart';
import '../widgets/welcom_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15)),
            const SliverToBoxAdapter(
                child: WelcomeTextWidget(text: AppStrings.welcome)),
            SliverToBoxAdapter(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03)),
            const SliverToBoxAdapter(
              child: CustomSignUpForm(),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02)),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
                onTap: () {
                  customNavigate(context, RouterNames.SignInView);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
