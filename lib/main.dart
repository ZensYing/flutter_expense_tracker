import 'package:expense_tracker_app/app.dart';
import 'package:expense_tracker_app/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
