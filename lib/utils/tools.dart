class Tools {
  // Add tip to a total amount.
  // total must be > 0, tipPercent >= 0
  static double totalWithTip(double total, int tipPercent, {int decimals = 2}) {
    if (total <= 0) throw ArgumentError("Total must be greater than 0");
    if (tipPercent < 0) throw ArgumentError("Tip percent cannot be negative");
    final withTip = total * (1 + tipPercent / 100.0);
    return double.parse(withTip.toStringAsFixed(decimals));
  }

  // Divide a bill (with tip) among party members.
  // partySize must be >= 1
  static double perPersonTotal(double total, int tipPercent, int partySize,
      {int decimals = 2}) {
    if (total <= 0) throw ArgumentError("Total must be greater than 0");
    if (tipPercent < 0) throw ArgumentError("Tip percent cannot be negative");
    if (partySize <= 0) throw ArgumentError("Party size must be at least 1");

    final totalWithTips = totalWithTip(total, tipPercent, decimals: decimals);
    final each = totalWithTips / partySize;
    return double.parse(each.toStringAsFixed(decimals));
  }
}
