import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker_app/services/auth.dart';

class SignInManager {
  SignInManager({@required this.auth, @required this.isLoading});

  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<User> _singIn(Future<User> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<User> signInAnonymously() async =>
      await _singIn(auth.signInAnonymously);

  Future<User> signInWithGoogle() async => await _singIn(auth.signInWithGoogle);

  Future<User> signInWithFacebook() async =>
      await _singIn(auth.signInWithFacebook);
}
