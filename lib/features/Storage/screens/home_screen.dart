import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../controllers/fun.dart';
import '../../../shared/widgets/build_button.dart';
import '../../../shared/widgets/build_text_field.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  final TextEditingController newWeight = TextEditingController();
  final formWeightKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          InkWell(
            onTap: (){
              logout(context);
            },
            child: Row(
              children: [
                const Text("Logout"),
                SizedBox(width: size.width*0.02,),
                const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                SizedBox(width: size.width*0.02,),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formWeightKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: size.height*0.05,),
                BuildTextField(
                    labelTxt: "Enter new weight", textController: newWeight),
                InkWell(
                  onTap: () async {
                    if (formWeightKey.currentState!.validate() == true) {
                      createWeight(newWeight.text);
                    }
                  },
                  child: BuildDecoratedContainer(
                    btnText: "Save",
                    btnColor: Colors.green,
                  ),
                ),

                SizedBox(height: size.height*0.02,),

                Text("Swipe left to delete weight",
                style: TextStyle(
                  fontSize: size.width*0.05
                ),
                ),

                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('weight').orderBy("createddate",descending: true).snapshots(),
                    builder: (context, snapshot) {


                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }

                      return ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          return weightItemBuilder(document, size, data);
                        }).toList(),
                      );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Dismissible weightItemBuilder(DocumentSnapshot<Object?> document, Size size, Map<String, dynamic> data) {
    return Dismissible(
                          key: ValueKey(document.id),
                          background: Container(
                              width: size.width,
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              child: const Icon(Icons.delete_forever,color: Colors.black,)),
                          onDismissed: (u){
                            deleteField(document.id);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: ListTile(

                              title: const Text("Weight"),
                              subtitle: Text(data['weightvalue']),
                            ),
                          ),
                        );
  }

}
