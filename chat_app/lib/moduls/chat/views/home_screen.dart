import 'package:chat_app/core/naviagtion/route_names.dart';
import 'package:chat_app/core/utils/localization_services.dart';
import 'package:chat_app/core/widgets/my_button.dart';
import 'package:chat_app/moduls/chat/statemangment/cubit/chat_cubit.dart';
import 'package:chat_app/moduls/chat/views/widget/main_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = BlocProvider.of<ChatCubit>(context);
        if (cubit.chats == null) {
          cubit.getAllChats();
        }
        return Scaffold(
          body: SafeArea(
            child: (cubit.chats == null || cubit.chats!.isEmpty)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr(context).dontHaveFrinds,
                      ),
                      MyButton(
                        onPressed: () {
                          Modular.to.pushNamed(AppRoute.addFrind.addFrind);
                        },
                        text: tr(context).addSomeFrinds,
                      )
                    ],
                  )
                : ListView.builder(
                    itemCount: cubit.chats?.length ?? 0,
                    itemBuilder: (context, index) {
                      return MainChatWidget(
                        user: cubit.chats![index],
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
