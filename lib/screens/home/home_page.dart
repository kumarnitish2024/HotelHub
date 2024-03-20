import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oyo/models/state_model.dart';
import 'package:oyo/screens/home/widgets/home_widget.dart';
import '../drawer/drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var view = HomeWidget(context: context);
    TextEditingController name = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: const Text(
          "HotelHub",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          view.textField(name, "Search"),
          SizedBox(
            height: 120,
            child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: FirebaseFirestore.instance.collection('states').get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                var data = snapshot.data?.docs.map((e) => StateModels.fromJson(e.data())).toList() ??
                    List<StateModels>.empty();
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading...');
                }
                if (snapshot.hasError) {
                  return const Text('Error occurred!');
                }
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return SizedBox (
                      width: 90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar( backgroundImage:
                                  NetworkImage(data[index].image ?? "No Image"),
                              radius: 36),
                          Text(
                            data[index].name ?? "No Data",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                );
              },
            ),
          ),
          const Text(
            "Handpicked for you",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
