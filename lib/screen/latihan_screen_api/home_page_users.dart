import 'package:flutter/material.dart';
import 'package:flutter_learn_parse/model/user.dart';
import 'package:flutter_learn_parse/services/user_services.dart';

class HomePageApiScreen extends StatelessWidget {
  const HomePageApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api Statefull"),
      ),
      body: const HomePageApiBody(),
    );
  }
}

class HomePageApiBody extends StatefulWidget {
  const HomePageApiBody({super.key});

  @override
  State<HomePageApiBody> createState() => _HomePageApiBodyState();
}

class _HomePageApiBodyState extends State<HomePageApiBody> {
  List<User> users = [];
  bool isLoading = true;

  void fetchUser() async {
    isLoading = true;
    final result = await UserService.fetchUsers();
    users = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  title: Text('${user.firstName} ${user.lastName}'),
                  subtitle: Text(user.email),
                ),
              );
            },
          );
  }
}
