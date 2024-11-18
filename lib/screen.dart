import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo1/screen1.dart';
import 'package:demo1/toast%20massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final editpost = TextEditingController();
  final firestore = FirebaseFirestore.instance.collection("data").snapshots();
  final ref = FirebaseFirestore.instance.collection("data");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.deepPurple,
            title: Padding(
                padding: EdgeInsets.only(left: 45.w),
                child: Text(
                  "Fire store",
                  style: GoogleFonts.merriweather(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: firestore,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                Center(child: Text("error"));
              }
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: Colors.deepPurple,
                        title:
                            Text(snapshot.data!.docs[index]["title"].toString(),
                                style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ))),
                        trailing: Wrap(
                          children: [
                            GestureDetector(
                              onTap: () {
                                opendailoge(index: index, id: snapshot.data!.docs[index].id.toString(), snapshot: snapshot);
                              },
                              child: Icon(
                                BootstrapIcons.pencil,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            GestureDetector(onTap: (){
                              ref.doc(snapshot.data!.docs[index]["id"].toString()).delete();
                            },
                              child: Icon(
                                BootstrapIcons.trash,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              else {
                return SizedBox();
              }
            },
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => Screen1()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.sp,
        ),
      ),
    );
  }
  Future opendailoge(
      {required int index,
        required String id,
        required AsyncSnapshot<QuerySnapshot> snapshot}) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Here'),
        content: TextFormField(
          controller: editpost,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              filled: true,
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              fillColor: Color(0xFFF7F8F9),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              hintText: 'Type here',
              hintStyle:
              TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
              labelStyle: GoogleFonts.poppins(
                color: Color(0xFF7C7C7C),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 0.10,
              )),
          validator: (email) {
            if (email!.isEmpty) {
              return 'Enter something';
            }
            return null;
          },
        ),
        actions: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black)),
              onPressed: () {
                ref
                    .doc(snapshot.data!.docs[index]["id"].toString())
                    .update({"title": editpost.text.toString()})
                    .then(
                      (value) => {
                    ToastMessage()
                        .toastmessage(message: 'Edited Succesfull'),
                    editpost.clear(),
                    Navigator.pop(context),
                  },
                )
                    .onError(
                      (error, stackTrace) => ToastMessage()
                      .toastmessage(message: error.toString()),
                );
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
