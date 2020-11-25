class TaxCode {
  String typeCode;
  String typeName;
  String goodsName;
  String taxRate;
  TaxCode({this.typeCode, this.typeName, this.goodsName, this.taxRate});

  TaxCode.fromJson(Map<String, dynamic> json) {
    typeCode = json['code'];
    typeName = json['name'];
    goodsName = json['goods'];
    taxRate = json['rate'];
  }
}