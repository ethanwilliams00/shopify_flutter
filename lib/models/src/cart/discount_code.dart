class DiscountCode {
  DiscountCode({
    required bool applicable,
    required String code,
  });

  static DiscountCode fromGraphJson(Map<String, dynamic> json) {
    return DiscountCode(
      applicable: (json['node'] ?? {})['applicable'] ?? false,
      code: (json['node'] ?? {})['code'] ?? "",
    );
  }
}
