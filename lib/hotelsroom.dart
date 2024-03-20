import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:oyo/Model/HotelsModels.dart';


class HotelsRoom extends StatefulWidget {
   const HotelsRoom({super.key});

  @override
  State<HotelsRoom> createState() => _HotelsRoomState();
}
class _HotelsRoomState extends State<HotelsRoom> {
  String? name;
  String? add;
  String? image;
  String? price;

  HotelModel? hotelsData;
  @override

  void initState() {
    super.initState();
    retriveData().then((value){
      setState(() {
      hotelsData = value;
      name = hotelsData?.name;
      add = hotelsData?.address;
      price=hotelsData?.price;
      });
    });
  }

  // final List<String> imageUrls = [
  //   'https://img.freepik.com/premium-photo/interior-living-room-wall-mockup-with-leather-sofa-decor-white-background-3d-rendering_41470-4035.jpg?w=2000', // Replace with your image assets or URLs
  //   'https://goodhomes.wwmindia.com/content/2022/dec/best-drawing-room-design-ideas.jpg',
  //   'https://img.freepik.com/premium-photo/interior-living-room-wall-mockup-with-leather-sofa-decor-white-background-3d-rendering_41470-4035.jpg?w=2000'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: SizedBox(
              height: 50,
              child: TextField(
                //controller: phoneController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.arrow_back),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    hintText: "Search"),
              ),
            ),
          ),

          Container(
            height: 280, // Adjust the height as needed
            child: Padding(
              padding: const EdgeInsets.only(top:10,),
              child: PageView.builder(
                itemCount: hotelsData?.imageUrl.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        hotelsData?.imageUrl[index]??"",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          Padding (
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SizedBox(
              height: 150,
              width: 200,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                       Text(
                        "$name",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                       const SizedBox(height: 6),
                       Text(
                        "$add",
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 6),

                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row( // New Row for third text and icon
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row( // New Row for third text and icon
                                children: const [
                                  Icon(Icons.location_on, size: 16, color: Colors.green,),
                                  SizedBox(width: 6),
                                  Text(
                                    "1 km from city center",
                                    style: TextStyle(fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Padding(
                              padding: EdgeInsets.only(left: 175),
                              child: Text("43%  ", style: TextStyle(fontSize: 14, color: Colors.grey),),
                            ),
                            const Text("0ff", style: TextStyle(fontSize: 16, color: Colors.green),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row( // New Row for third text and icon
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row( // New Row for third text and icon
                                children: const [
                                  Icon(Icons.check, size: 16, color: Colors.green,),
                                  SizedBox(width: 6),
                                  Text(
                                    "Free Cancellation",
                                    style: TextStyle(fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Padding(
                              padding: EdgeInsets.only(left: 170),
                              child: Text("₹5833  ", style: TextStyle(fontSize: 10, color: Colors.grey),),
                            ),
                             Text("₹  $price", style: TextStyle(fontSize: 16, color: Colors.black),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row( // New Row for third text and icon
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row( // New Row for third text and icon
                                children: const [
                                  Icon(Icons.check, size: 16, color: Colors.green,),
                                  SizedBox(width: 6),
                                  Text(
                                    "Pay @ Hotel",
                                    style: TextStyle(fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 150),
                              child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Image(image: NetworkImage("https://www.iconpacks.net/icons/2/free-icon-coin-2159.png"),)),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "Get 123+ Fab Credits",
                              style: TextStyle(fontSize: 12, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          // Container(
          //   height: 280, // Adjust the height as needed
          //   child: Padding(
          //     padding: const EdgeInsets.only(top:10,),
          //     child: PageView.builder(
          //       itemCount: imageUrls.length,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(10.0),
          //             child: Image.network(
          //               imageUrls[index],
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),

          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: SizedBox(
              height: 150,
              width: 200,
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "Dadi ki rasheyi ",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "Bheldi",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                      const SizedBox(height: 6),

                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row( // New Row for third text and icon
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row( // New Row for third text and icon
                                children: const [
                                  Icon(Icons.location_on, size: 16, color: Colors.green,),
                                  SizedBox(width: 6),
                                  Text(
                                    "0.534 km from city center",
                                    style: TextStyle(fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Padding(
                              padding: EdgeInsets.only(left: 150),
                              child: Text("43%  ", style: TextStyle(fontSize: 14, color: Colors.grey),),
                            ),
                            const Text("0ff", style: TextStyle(fontSize: 16, color: Colors.green),),
                          ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row( // New Row for third text and icon
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row( // New Row for third text and icon
                                children: const [
                                  Icon(Icons.check, size: 16, color: Colors.green,),
                                  SizedBox(width: 6),
                                  Text(
                                    "Free Cancellation",
                                    style: TextStyle(fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Padding(
                              padding: EdgeInsets.only(left: 170),
                              child: Text("₹5833  ", style: TextStyle(fontSize: 10, color: Colors.grey),),
                            ),
                            const Text("₹3,325", style: TextStyle(fontSize: 16, color: Colors.black),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row( // New Row for third text and icon
                          children:  [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row( // New Row for third text and icon
                                children: const [
                                  Icon(Icons.check, size: 16, color: Colors.green,),
                                  SizedBox(width: 6),
                                  Text(
                                    "Pay @ Hotel",
                                    style: TextStyle(fontSize: 12, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 150),
                              child: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: Image(image: NetworkImage("https://www.iconpacks.net/icons/2/free-icon-coin-2159.png"),)),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "Get 123+ Fab Credits",
                              style: TextStyle(fontSize: 12, color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<HotelModel?>retriveData() async{
    var user = await FirebaseFirestore.instance.collection("hotels").get();
    var userModel =user.docs.map((e) => HotelModel.fromJson(e.data())).toList();
    return userModel[0];
  }
}
