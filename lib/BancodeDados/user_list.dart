// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/BancodeDados/etapa1.dart';
import 'package:flutter_application_1/BancodeDados/user_provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    List<User> users = userProvider.users;

    int usersLength = users.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista tarefas'),
        leading: BackButton(
          onPressed: () {
            userProvider.indexUser = null;
            Navigator.popAndPushNamed(context, "/create");
          },
        ),
      ),
      body: ListView.builder(
        itemCount: usersLength,
        itemBuilder: (BuildContext contextBuilder, indexBuilder) => Container(
          child: ListTile(
            title: Text(users[indexBuilder].name),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      userProvider.userSelected = users[indexBuilder];
                      userProvider.indexUser = indexBuilder;
                      Navigator.popAndPushNamed(context, "/create");
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      userProvider.indexUser = null;
                      userProvider.users.removeAt(indexBuilder);
                      Navigator.popAndPushNamed(context, "/list");
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ))
              ],
            ),
          ),
          decoration:
              BoxDecoration(border: Border(bottom: BorderSide(width: 0.4))),
        ),
      ),
    );
  }
}
