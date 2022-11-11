import 'package:cryptotest/internal/app.dart';
import 'package:cryptotest/internal/dependencies/register.dart';
import 'package:flutter/material.dart';

void main() {
  Dependency.init();
  runApp(const CryptoTest());
}
