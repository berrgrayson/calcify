// lib/screens/calculator_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/calc_state.dart';
import '../widgets/calc_button.dart';
import '../widgets/display_area.dart';

class CalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calcState = Provider.of<CalcState>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calcify', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          DisplayArea(
            equation: calcState.equation,
            result: calcState.result,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 5, // Adjusted to accommodate new buttons
              padding: const EdgeInsets.all(10),
              children: [
                // Row 1: Basic numbers and operators
                CalcButton(text: '7', onTap: () => calcState.appendValue('7')),
                CalcButton(text: '8', onTap: () => calcState.appendValue('8')),
                CalcButton(text: '9', onTap: () => calcState.appendValue('9')),
                CalcButton(text: '/', onTap: () => calcState.appendOperator('/')),
                CalcButton(text: 'nCr', onTap: () => calcState.appendCombination()),

                // Row 2: More numbers
                CalcButton(text: '4', onTap: () => calcState.appendValue('4')),
                CalcButton(text: '5', onTap: () => calcState.appendValue('5')),
                CalcButton(text: '6', onTap: () => calcState.appendValue('6')),
                CalcButton(text: '*', onTap: () => calcState.appendOperator('*')),
                CalcButton(text: 'nPr', onTap: () => calcState.appendPermutation()),

                // Row 3: Advanced functions
                CalcButton(text: 'sin', onTap: () => calcState.appendAdvancedFunction('sin')),
                CalcButton(text: 'cos', onTap: () => calcState.appendAdvancedFunction('cos')),
                CalcButton(text: 'log', onTap: () => calcState.appendAdvancedFunction('log')),
                CalcButton(text: '^', onTap: () => calcState.appendOperator('^')),
                CalcButton(text: '!', onTap: () => calcState.appendFactorial()),

                // Row 4: Continue with advanced
                CalcButton(text: 'tan', onTap: () => calcState.appendAdvancedFunction('tan')),
                CalcButton(text: 'sqrt', onTap: () => calcState.appendAdvancedFunction('sqrt')),
                CalcButton(text: '(', onTap: () => calcState.appendValue('(')),
                CalcButton(text: ')', onTap: () => calcState.appendValue(')')),
                CalcButton(text: 'C', onTap: () => calcState.clear()),

                // Row 5: Numbers and more operators
                CalcButton(text: '0', onTap: () => calcState.appendValue('0')),
                CalcButton(text: '.', onTap: () => calcState.appendValue('.')),
                CalcButton(text: '=', onTap: calcState.calculateResult),
                CalcButton(text: '+', onTap: () => calcState.appendOperator('+')),
                CalcButton(text: '⌫', onTap: () => calcState.backspace()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
