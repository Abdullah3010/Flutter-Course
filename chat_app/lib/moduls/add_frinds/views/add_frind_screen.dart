import 'package:chat_app/core/utils/constants.dart';
import 'package:chat_app/moduls/add_frinds/statemangment/cubit/add_frind_cubit.dart';
import 'package:chat_app/moduls/add_frinds/views/widget/add_frind_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFrindScreen extends StatelessWidget {
  AddFrindScreen({super.key});
  final Constants currentUser = Modular.get<Constants>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFrindCubit, AddFrindState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<AddFrindCubit>(context);
        if (state is AddFrindInitial || cubit.users == null) {
          cubit.getAllUsers();
        }
        if (state is GetAllUseresLoading) {
          return CircularProgressIndicator();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Add Frinds',
            ),
            leading: IconButton(
              onPressed: () {
                cubit.users = null;
                Modular.to.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              child: ListView.builder(
                itemCount: cubit.users?.length ?? 0,
                itemBuilder: (context, index) {
                  if (cubit.users![index].uId == currentUser.user?.uid) {
                    return const SizedBox();
                  }
                  return AddFrindWidget(
                    user: cubit.users![index],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
