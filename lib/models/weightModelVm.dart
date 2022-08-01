
class WeightModelVm {
  WeightModelVm({
    this.userId,
    this.createdTime,
    this.weight,
  });
DateTime ?createdTime;
String? userId;
String ?weight;


  factory WeightModelVm.fromJson(Map<String, dynamic> json) => WeightModelVm(
    createdTime: json["createddate"],
    userId: json["userid"],
    weight: json["weightvalue"],

  );

  Map<String, dynamic> toJson() => {
    "createddate": createdTime,
    "userid": userId,
    "weightvalue": weight,
  };
}

