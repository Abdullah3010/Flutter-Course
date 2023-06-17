import 'package:chat_app/core/naviagtion/route_names.dart';
import 'package:chat_app/core/utils/localization_services.dart';
import 'package:chat_app/core/widgets/form_field_widget.dart';
import 'package:chat_app/core/widgets/my_button.dart';
import 'package:chat_app/core/widgets/my_dialog.dart';
import 'package:chat_app/moduls/auth/models/user_model.dart';
import 'package:chat_app/moduls/auth/statemangment/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginError) {
            showDialog(
              context: context,
              builder: (_) {
                return MySimpleDialog(
                  title: 'Error',
                  content: state.error,
                );
              },
            );
          } else if (state is LoginSuccess) {
            Modular.to.pushNamed(AppRoute.chat.home);
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AuthCubit>(context);
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormFieldWidget(
                  controller: email,
                  hitText: tr(context).email,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: emailFocus,
                  validator: (value) {
                    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                    if (value!.isEmpty) {
                      return tr(context).emailIsRequiers;
                    } else if (!emailRegex.hasMatch(value)) {
                      return tr(context).emailIsNotValid;
                    }
                    return null;
                  },
                ),
                FormFieldWidget(
                  controller: password,
                  hitText: tr(context).password,
                  focusNode: passwordFocus,
                  obscureText: cubit.isRegisterPassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      cubit.changePasswordVisibleRegister();
                    },
                    icon: Icon(
                      cubit.isRegisterPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return tr(context).passwordIsRequiers;
                    } else if (value.length < 6) {
                      return tr(context).passwordIsTooShort;
                    }
                    return null;
                  },
                ),
                state is LoginLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : MyButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cubit.login(
                              email: email.text,
                              password: password.text,
                            );
                          }
                        },
                        text: tr(context).login,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
