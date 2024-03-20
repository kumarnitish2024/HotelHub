import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class YourWidgetWithStreamBuilder extends StatelessWidget {
  const YourWidgetWithStreamBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('states').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          if (snapshot.hasError) {
            return const Text('Error occurred!');
          }
          final data = snapshot.data!.docs;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar( backgroundImage:
                      NetworkImage(data[index].id ?? "No Image"),
                          radius: 36),
                      Text(
                        data[index].id ?? "No Data",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },);

        },
      ),
    );
  }
}
