class SignupBody{
  String name;
  String phoneNumber;
  String password;
  String verificationCode;

  SignupBody({
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.verificationCode,
  });

  //convert body from object to json
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["name"] = this.name; /// data["name"] "name" should be the same as the one coming from the endpoint
    data["phoneNumber"] = this.phoneNumber;
    data["password"] = this.password;
    data["verificationCode"] = this.verificationCode;
    return data;
  }

  /// get json response
  factory SignupBody.fromJson(Map<String, dynamic> json){
    return SignupBody(
        name: json['name'],
        phoneNumber: json['phoneNumber'], // f_name is the name coming from the db
        password: json['password'],
        verificationCode: json['verificationCode'],
        // verificationCode: json['verificationCode']
    );
  }
}