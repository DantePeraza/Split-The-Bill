import 'package:flutter/material.dart';

// Splash Screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6B73FF),
              Color(0xFF9B59B6),
              Color(0xFFE74C3C),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Icon with shadow and animation
              Hero(
                tag: 'app-icon',
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.receipt_long,
                    size: 60,
                    color: Color(0xFF4CAF50),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // App Title with better typography
              const Text(
                'Split the',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              const Text(
                'Bill',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),

              const SizedBox(height: 20),
              Text(
                'Calculate tips and split bills with ease',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 60),

              // Enhanced Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnterTotalScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF6B73FF),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Enter Total Screen
class EnterTotalScreen extends StatefulWidget {
  const EnterTotalScreen({super.key});

  @override
  State<EnterTotalScreen> createState() => _EnterTotalScreenState();
}

class _EnterTotalScreenState extends State<EnterTotalScreen> {
  final TextEditingController _totalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6B73FF),
              Color(0xFF9B59B6),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Enter Total',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Balance the back button
                  ],
                ),
              ),

              // Main Content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Title
                      const Text(
                        'Enter Total\nAmount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 16),

                      Text(
                        'Enter the total bill amount to get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),

                      const SizedBox(height: 48),

                      // Enhanced Input Field
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _totalController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '0.00',
                            hintStyle: TextStyle(
                              color: Color(0xFFBBBBBB),
                              fontSize: 24,
                            ),
                            prefixText: '\$ ',
                            prefixStyle: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF4CAF50),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 48),

                      // Enhanced Continue Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_totalController.text.isNotEmpty) {
                              double? total =
                                  double.tryParse(_totalController.text);
                              if (total != null && total > 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TipPercentageScreen(totalAmount: total),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                        'Please enter a valid amount'),
                                    backgroundColor: Colors.red.shade400,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                      'Please enter the total amount'),
                                  backgroundColor: Colors.orange.shade400,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF6B73FF),
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 8,
                            shadowColor: Colors.black.withOpacity(0.3),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Tip Percentage Screen
class TipPercentageScreen extends StatefulWidget {
  final double totalAmount;

  const TipPercentageScreen({super.key, required this.totalAmount});

  @override
  State<TipPercentageScreen> createState() => _TipPercentageScreenState();
}

class _TipPercentageScreenState extends State<TipPercentageScreen> {
  final TextEditingController _tipController =
      TextEditingController(text: '15');

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: Colors.red),
    );
  }

  void _onContinue() {
    final text = _tipController.text.trim();
    if (text.isEmpty) {
      _showError('Please enter a tip percentage');
      return;
    }
    final value = double.tryParse(text.replaceAll('%', ''));
    if (value == null || value < 0) {
      _showError('Enter a valid tip percentage');
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PartySizeScreen(
          totalAmount: widget.totalAmount,
          tipPercentage: value,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // match the visual style of the first two screens (gradient, hero, centered card)
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6B73FF),
              Color(0xFF9B59B6),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'app-icon',
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 8),
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.percent,
                        size: 48,
                        color: Color(0xFF6B73FF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text(
                    'Tip Percentage',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Set the tip percentage to add to the bill',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 36),

                  // Input card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _tipController,
                              keyboardType:
                                  const TextInputType.numberWithOptions(decimal: true),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '15',
                              ),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Color(0xFF6B73FF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const Text(
                            '%',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF6B73FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),

                  ElevatedButton(
                    onPressed: _onContinue,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF6B73FF),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.25),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Party Size Screen
class PartySizeScreen extends StatefulWidget {
  final double totalAmount;
  final double tipPercentage;

  const PartySizeScreen({
    super.key,
    required this.totalAmount,
    required this.tipPercentage,
  });

  @override
  State<PartySizeScreen> createState() => _PartySizeScreenState();
}

class _PartySizeScreenState extends State<PartySizeScreen> {
  int? selectedPartySize;

  @override
  Widget build(BuildContext context) {
    // match the first two screens' look & feel
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6B73FF),
              Color(0xFF9B59B6),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'app-icon',
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 8),
                            blurRadius: 18,
                            color: Colors.black.withOpacity(0.18),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.group,
                        size: 44,
                        color: Color(0xFF6B73FF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Party Size',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'How many people are splitting the bill?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Dropdown card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<int>(
                          isExpanded: true,
                          value: selectedPartySize,
                          hint: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Select number of people',
                              style: TextStyle(
                                color: Color(0xFF6B73FF),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF6B73FF),
                          ),
                          items: List.generate(
                            10,
                            (index) => DropdownMenuItem<int>(
                              value: index + 1,
                              child: Text(
                                index + 1 == 1
                                    ? '1 person'
                                    : '${index + 1} people',
                                style: const TextStyle(
                                    color: Color(0xFF6B73FF),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          onChanged: (int? newValue) {
                            setState(() {
                              selectedPartySize = newValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),

                  ElevatedButton(
                    onPressed: selectedPartySize != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TotalPerPersonScreen(
                                  totalAmount: widget.totalAmount,
                                  tipPercentage: widget.tipPercentage,
                                  partySize: selectedPartySize!,
                                ),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          selectedPartySize != null ? Colors.white : Colors.grey,
                      foregroundColor:
                          selectedPartySize != null ? const Color(0xFF6B73FF) : Colors.white,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 48, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.2),
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: selectedPartySize != null
                            ? const Color(0xFF6B73FF)
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Total Per Person Screen
class TotalPerPersonScreen extends StatelessWidget {
  final double totalAmount;
  final double tipPercentage;
  final int partySize;

  const TotalPerPersonScreen({
    super.key,
    required this.totalAmount,
    required this.tipPercentage,
    required this.partySize,
  });

  @override
  Widget build(BuildContext context) {
    double tipAmount = totalAmount * (tipPercentage / 100);
    double totalWithTip = totalAmount + tipAmount;
    double perPerson = totalWithTip / partySize;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6B73FF),
              Color(0xFF9B59B6),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'app-icon',
                    child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 8),
                            blurRadius: 18,
                            color: Colors.black.withOpacity(0.18),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.monetization_on,
                        size: 44,
                        color: Color(0xFF6B73FF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Total Per Person',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // Main amount card
                  Container(
                    width: 220,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 14,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '\$${perPerson.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6B73FF),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 22),

                  // Breakdown card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildBreakdownRow('Subtotal', '\$${totalAmount.toStringAsFixed(2)}'),
                        const SizedBox(height: 8),
                        _buildBreakdownRow('Tip (${tipPercentage.toStringAsFixed(0)}%)',
                            '\$${tipAmount.toStringAsFixed(2)}'),
                        const Divider(height: 20, thickness: 1),
                        _buildBreakdownRow('Total',
                            '\$${totalWithTip.toStringAsFixed(2)}', isBold: true),
                        const SizedBox(height: 8),
                        _buildBreakdownRow('Split between', '$partySize people'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 26),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const SplashScreen()),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF6B73FF),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                      shadowColor: Colors.black.withOpacity(0.25),
                    ),
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBreakdownRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

// Keep the original Screen class for backward compatibility
class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
