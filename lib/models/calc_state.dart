// lib/models/calc_state.dart
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'dart:math';

class CalcState with ChangeNotifier {
  String _equation = '';
  String _result = '';
  List<String> _history = [];

  String get equation => _equation;
  String get result => _result;
  List<String> get history => _history;

  // Append numerical value
  void appendValue(String value) {
    _equation += value;
    notifyListeners();
  }

  // Append operator
  void appendOperator(String operator) {
    _equation += operator;
    notifyListeners();
  }

  // Append advanced function (e.g., sin, cos)
  void appendAdvancedFunction(String function) {
    _equation += '$function(';
    notifyListeners();
  }

  // Append factorial
  void appendFactorial() {
    _equation += '!';
    notifyListeners();
  }

  // Append permutation
  void appendPermutation() {
    _equation += 'nPr(';
    notifyListeners();
  }

  // Append combination
  void appendCombination() {
    _equation += 'nCr(';
    notifyListeners();
  }

  // Clear all
  void clear() {
    _equation = '';
    _result = '';
    notifyListeners();
  }

  // Backspace
  void backspace() {
    if (_equation.isNotEmpty) {
      _equation = _equation.substring(0, _equation.length - 1);
      notifyListeners();
    }
  }

  // Factorial helper
  int factorial(int n) {
    if (n < 0) return -1; // Indicate error for negative numbers
    if (n == 0 || n == 1) return 1;
    return n * factorial(n - 1);
  }

  // Permutation (nPr)
  int permutation(int n, int r) {
    if (n < 0 || r < 0 || r > n) return -1; // Indicate error
    return factorial(n) ~/ factorial(n - r);
  }

  // Combination (nCr)
  int combination(int n, int r) {
    if (n < 0 || r < 0 || r > n) return -1; // Indicate error
    return permutation(n, r) ~/ factorial(r);
  }

  // Calculate result
  void calculateResult() {
    try {
      String expression = _equation;

      // Handle factorials
      expression = expression.replaceAllMapped(RegExp(r'(\d+)!'), (match) {
        int num = int.parse(match.group(1)!);
        int fact = factorial(num);
        if (fact == -1) throw FormatException('Invalid factorial');
        return fact.toString();
      });

      // Handle nPr and nCr
      expression = expression.replaceAllMapped(RegExp(r'nPr\((\d+),(\d+)\)'), (match) {
        int n = int.parse(match.group(1)!);
        int r = int.parse(match.group(2)!);
        int pr = permutation(n, r);
        if (pr == -1) throw FormatException('Invalid permutation');
        return pr.toString();
      });

      expression = expression.replaceAllMapped(RegExp(r'nCr\((\d+),(\d+)\)'), (match) {
        int n = int.parse(match.group(1)!);
        int r = int.parse(match.group(2)!);
        int cr = combination(n, r);
        if (cr == -1) throw FormatException('Invalid combination');
        return cr.toString();
      });

      // Parse and evaluate the expression
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      _result = eval.toString();

      // Add to history
      _history.add('$_equation = $_result');

    } catch (e) {
      _result = 'Error';
    }
    notifyListeners();
  }
}
