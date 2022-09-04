import 'package:connectivity/connectivity.dart';
import 'package:fake_store/Helper/Color.dart';
import 'package:flutter/material.dart';


Future<bool> isNetworkAvailable() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

setSnackbar(String msg, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      msg,
      textAlign: TextAlign.center,
      style: TextStyle(color: Theme.of(context).colorScheme.black),
    ),
    backgroundColor: Theme.of(context).colorScheme.white,
    elevation: 1.0,
  ));
}