import 'package:calrie_tracker_app/widgets/evening_plan.dart';
import 'package:calrie_tracker_app/widgets/morning_plan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../constants/constants.dart';

class PlansScreen extends StatefulWidget {
  PlansScreen({Key? key}) : super(key: key);

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          const Text(
            'Add your plan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(
            height: 20,
          ),
          MorningPlan(),
         
          EveningPlan(),
        ],
      ),
    );
  }
}
