import 'dart:io';

import 'package:chat_app/core/naviagtion/route_names.dart';
import 'package:chat_app/core/utils/localization_services.dart';
import 'package:chat_app/core/widgets/form_field_widget.dart';
import 'package:chat_app/core/widgets/my_button.dart';
import 'package:chat_app/core/widgets/my_dialog.dart';
import 'package:chat_app/moduls/auth/models/user_model.dart';
import 'package:chat_app/moduls/auth/statemangment/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
          ),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterError) {
                showDialog(
                  context: context,
                  builder: (_) {
                    return MySimpleDialog(
                      title: 'Error',
                      content: state.error,
                    );
                  },
                );
              } else if (state is RegisterSuccess) {
                Modular.to.pushNamed(AppRoute.chat.home);
              }
            },
            builder: (context, state) {
              final cubit = BlocProvider.of<AuthCubit>(context);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            showMyDialog(context, cubit);
                          },
                          child: CircleAvatar(
                            radius: 60.r,
                            child: cubit.image == null
                                ? Icon(
                                    Icons.person,
                                    size: 60.r,
                                  )
                                : ClipOval(
                                    child: Image.file(
                                      File(cubit.image!.path),
                                      fit: BoxFit.fill,
                                      width: 110,
                                      height: 110,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Icon(
                                          Icons.error,
                                          size: 60.r,
                                        );
                                      },
                                    ),
                                  ),
                          ),
                        )
                      ],
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          FormFieldWidget(
                            controller: name,
                            hitText: tr(context).username,
                            focusNode: nameFocus,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return tr(context).usernameIsRequiers;
                              }
                              return null;
                            },
                          ),
                          FormFieldWidget(
                            controller: phone,
                            hitText: tr(context).phone,
                            textInputAction: TextInputAction.next,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(11),
                            ],
                            keyboardType: TextInputType.phone,
                            focusNode: phoneFocus,
                            validator: (value) {
                              final RegExp phoneNumberRegex = RegExp(r'^(010|011|012|015)\d{8}$');
                              if (!phoneNumberRegex.hasMatch(value!)) {
                                return tr(context).phoneIsNotValid;
                              }
                              return null;
                            },
                          ),
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
                          state is RegisterLoading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : MyButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      final user = UserModel(
                                        name: name.text,
                                        phone: phone.text,
                                        email: email.text,
                                        password: password.text,
                                      );
                                      cubit.register(
                                        user: user,
                                      );
                                    }
                                  },
                                  text: tr(context).register,
                                ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Modular.to.pushNamed(AppRoute.auth.login);
                      },
                      child: Text(
                        tr(context).haveAccount,
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void showMyDialog(BuildContext context, AuthCubit cubit) {
    showDialog(
      context: context,
      builder: (context) {
        return MySimpleDialog(
          title: 'Pick Image',
          content: 'Chose From',
          actions: [
            TextButton(
              onPressed: () {
                cubit.pikeUserImage(ImageSource.camera);
                Modular.to.pop();
              },
              child: const Text('Camera'),
            ),
            TextButton(
              onPressed: () {
                cubit.pikeUserImage(ImageSource.gallery);
                Modular.to.pop();
              },
              child: const Text('Gallery'),
            ),
          ],
        );
      },
    );
  }
}
