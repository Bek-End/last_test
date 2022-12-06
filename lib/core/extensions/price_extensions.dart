extension PriceExtension on int {
  ///Example: 1500.toDoublePrice = "1,500.00"
  String get toDoublePrice {
    final bigPrice = (this / 1000).floor();
    if (bigPrice != 0) {
      int remainder = this - bigPrice * 1000;
      String other = _toString(remainder);
      return '$bigPrice,$other.00';
    }
    return '$this.00';
  }

  ///Example: 1500.toIntPrice = "1,500"
  String get toIntPrice {
    final bigPrice = (this / 1000).floor();
    if (bigPrice != 0) {
      int remainder = this - bigPrice * 1000;
      String other = _toString(remainder);
      return '$bigPrice,$other';
    }
    return toString();
  }
}

String _toString(int remainder) {
  return remainder > 99
      ? remainder.toString()
      : remainder > 9
          ? '0$remainder'
          : '00$remainder';
}
