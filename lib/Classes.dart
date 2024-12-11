



class Contruc_Time{
  String? c_name;
  int? c_time;
  String? c_date;
  String? ex_date;
  Contruc_Time({required this.c_name,required this.c_time,required this.c_date,required this.ex_date});

  factory Contruc_Time.fromjson(Map<String,dynamic>json)=>Contruc_Time(
      c_name: json['t_name'],
      c_time: json['time'],
      c_date: json['dat'],
      ex_date: json['ex_date']);

  Map<String,dynamic> tojson(){
    return {
      't_name':c_name,
      'time':c_time,
      'date':c_date,
      'ex_date':ex_date,
    };
  }


}



class Free_Time{
  String? name;
  int? time;
  String? date;
  int? price;
  Free_Time({required this.name,required this.time,required this.date,required this.price});

  factory Free_Time.fromjson(Map<String,dynamic>json)=> Free_Time(
      name: json['t_name'],
      time: json['time'],
      date: json['date'],
      price: json['price']
  );

  Map<String,dynamic> tojson()=>{
    't_name':name,
    'time':time,
    'date':date,
    'price':price,
  };
}



class Login{
  String? user_name ;
  String? password ;
  Login({required this.password,required this.user_name});


  factory Login.fromjson(Map<String,dynamic>json)=>Login(
      password: json['password'],
      user_name: json['user_name'],
  );


  Map<String,dynamic> tojson()=>{
    'password': password,
    'user_name': user_name,
  };


}