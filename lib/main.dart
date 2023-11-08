import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dars/a/networking_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => NetworkingBloc(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NetworkingBloc>(context).add(NetworkLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Network+bloc"),
      ),
      body: RefreshIndicator(onRefresh: () async {
        BlocProvider.of<NetworkingBloc>(context).add(NetworkLoad());
      }, child: BlocBuilder<NetworkingBloc, NetworkingState>(
        builder: (context, state) {
          if (state is NetworkingLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NetworkingError) {
            return Center(
              child: Text(
                state.message,
              ),
            );
          } else if (state is NetworkingSuccess) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(10),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 50,
                    color: Colors.green,
                    child: Text(state.posts[index].title ?? "bosh"),
                  );
                });
          }
          else {
            return Container();
          }
        },
      )),
    );
  }
}
