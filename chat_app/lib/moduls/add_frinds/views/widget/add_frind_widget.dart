import 'package:chat_app/moduls/add_frinds/models/add_frind_model.dart';
import 'package:chat_app/moduls/add_frinds/statemangment/cubit/add_frind_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddFrindWidget extends StatelessWidget {
  const AddFrindWidget({
    super.key,
    required this.user,
  });

  final AddFrindModel user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddFrindCubit, AddFrindState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<AddFrindCubit>(context);
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.grey[300],
          ),
          child: Row(
            children: [
              user.image!.isEmpty
                  ? const CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    )
                  : CircleAvatar(
                      radius: 30.r,
                      backgroundImage: NetworkImage(user.image ?? ''),
                    ),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              state is AddFrindLoading
                  ? const CircularProgressIndicator()
                  : InkWell(
                      onTap: () {
                        cubit.addFrind(user);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: Colors.blue,
                        ),
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}
