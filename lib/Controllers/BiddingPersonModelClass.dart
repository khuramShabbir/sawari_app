class BiddingPersons {
  String? name;
  double rating;
  int? totals;
  String? startTime;
  String? endTime;
  String? beginningCity;
  String? destinationCity;

  BiddingPersons(
      {this.name = "",
      this.rating = 0.0,
      this.totals,
      this.startTime,
      this.endTime,
      this.beginningCity,
      this.destinationCity});
}

//
//
//
//
// import 'dart:convert';
//
//
//  Bidding biddingFromJson(String str){
//    return Bidding.fromJson(json.decode(str));
//
//  }
//
//
// class Bidding {
//   final String name;
//   final double rating;
//   final int totals;
//   final String startTime;
//   final String endTime;
//   final String beginningCity;
//   final String destinationCity;
//
//   Bidding({
//     required this.name,
//     required this.rating,
//     required this.totals,
//     required this.startTime,
//     required this.endTime,
//     required this.beginningCity,
//     required this.destinationCity,
//   });
//
//   factory Bidding.fromRawJson(String str){
//
//     return Bidding.fromJson(json.decode(str));
//
//
//   }
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Bidding.fromJson(Map<String, dynamic> json) => Bidding(
//     name: json["name"],
//     rating: json["rating"]?.toDouble(),
//     totals: json["totals"],
//     startTime: json["startTime"],
//     endTime: json["endTime"],
//     beginningCity: json["beginningCity"],
//     destinationCity: json["destinationCity"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "rating": rating,
//     "totals": totals,
//     "startTime": startTime,
//     "endTime": endTime,
//     "beginningCity": beginningCity,
//     "destinationCity": destinationCity,
//   };
// }

List<BiddingPersons> biddingPersonsData = <BiddingPersons>[
  BiddingPersons(
      name: "Ahsan Ali",
      rating: 4.5,
      totals: 2000,
      startTime: "10.20",
      endTime: "14.60",
      beginningCity: "LHR",
      destinationCity: "RWP"),
  BiddingPersons(
      name: "Zain Danish",
      rating: 3.7,
      totals: 2999,
      startTime: "09.20",
      endTime: "14.60",
      beginningCity: "LHR",
      destinationCity: "ISL"),
  BiddingPersons(
      name: "Ali. Ahmad",
      rating: 2.9,
      totals: 3015,
      startTime: "11.20",
      endTime: "14.60",
      beginningCity: "QUE",
      destinationCity: "RWP"),
];
