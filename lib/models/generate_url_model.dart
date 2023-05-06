class GenerateUrlModel{
  //request
  String email;
  String amount;
  String currency;
  String reference;
  String callback;


  GenerateUrlModel({
    required this.email,
    required this.amount,
    required this.currency,
    required this.reference,
    required this.callback,

  });

  //convert body from object to json so as to send
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["email"] = this.email;
    data["amount"] = this.amount;
    data["currency"] = this.currency;
    data["reference"] = this.reference;
    data["callback"] = this.callback;
    return data;
  }



  /// get json response
  factory GenerateUrlModel.fromJson(Map<String, dynamic> json){
    return GenerateUrlModel(
      email: json['email'],
      amount: json['amount'], // f_name is the name coming from the db
      currency: json['currency'], // f_name is the name coming from the db
      reference: json['reference'],
      callback: json['callback'],
    );
  }

}