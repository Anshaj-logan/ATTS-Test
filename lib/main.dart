
import 'package:flutter/material.dart';

import 'package:listing_iteam/ApI.dart';
import 'package:listing_iteam/User_model.dart';

// Define a model class to represent each item in the list


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List',
      home: Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: FutureBuilder<List<User>>(
          future: fetchData(), // Your function to fetch data
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].name),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data![index].avatar),
                    ),
                    subtitle: Text('ID: ${snapshot.data![index].id}'),
                  );
                },
              );
            } else {
              return Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}


