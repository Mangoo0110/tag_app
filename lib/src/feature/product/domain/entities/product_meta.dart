class ProductMeta {
  const ProductMeta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? barcode;
  final String? qrCode;
}
