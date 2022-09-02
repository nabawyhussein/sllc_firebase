
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/FireBase_Authentication/provider/signin_controller.dart';
import '../features/FireBase_Authentication/screens/google_signin_screen.dart';
import '../models/weightModelVm.dart';

Future<void> deleteField(String id) {
  final deleteWeight = FirebaseFirestore.instance.collection('weight').doc(id);
  return deleteWeight
      .update({
    'createddate': FieldValue.delete(),
    'userid': FieldValue.delete(),
    'weightvalue': FieldValue.delete(),

  })
      .then((value) => print("User's Property Deleted"))
      .catchError((error) => print("Failed to delete user's property: $error"));
}


void createWeight(String text) {
  final sendWeight = FirebaseFirestore.instance.collection('weight').doc();
  final weightModelVm = WeightModelVm(
    userId: FirebaseAuth.instance.currentUser!.uid,
    createdTime: DateTime.now(),
    weight: text,
  );
  sendWeight.set(weightModelVm.toJson());
}

logout(BuildContext context) async {
  final logout = Provider.of<SignInGoogleProvider>(context, listen: false);
  await logout.googleLogOut();
  if (logout.user == null) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignIn()),
    );
  }
}