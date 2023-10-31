import 'package:flutter/material.dart';
import 'package:tugas2_httprequest_124210001/details_page.dart';
import 'package:tugas2_httprequest_124210001/users_model.dart';
import 'api_data_source.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Users"),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: ApiDataSource.instance.loadUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(" Error ");
            }
            if (snapshot.hasData) {
              UsersModel users = UsersModel.fromJson(snapshot.data!);
              return ListView.builder(
                  itemCount: users.data!.length,
                  itemBuilder: (context, index) {
                    var user = users.data![index];
                    return ListTile(
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(user.avatar!),
                      ),
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text('${user.email}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(id: user.id!),
                          ),
                        );
                      },
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
