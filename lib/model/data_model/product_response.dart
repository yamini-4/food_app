// ProductResponse productResponseFromJson(String str) =>
//     ProductResponse.fromJson(json.decode(str));
//
// String productResponseToJson(ProductResponse data) =>
//     json.encode(data.toJson());

class Popular {
  Popular({
    this.foodName,
    this.ingredients,
    this.imageUrl,
  });

  String? foodName;
  String? ingredients;
  String? imageUrl;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
        foodName: json["food_name"],
        ingredients: json["ingredients"],
        imageUrl: json["imageUrl"],
      );

  // Map<String, dynamic> toJson() => {
  //       "food_name": foodName,
  //       "ingredients": ingredients,
  //       "imageUrl": imageUrl,
  //     };
}

class Promotion {
  Promotion({
    this.titleText,
    this.content,
    this.posterImageurl,
  });

  String? titleText;
  String? content;
  String? posterImageurl;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
        titleText: json["title_text"],
        content: json["content"],
        posterImageurl: json["poster_imageurl"],
      );

  // Map<String, dynamic> toJson() => {
  //       "title_text": titleText,
  //       "content": content,
  //       "poster_imageurl": posterImageurl,
  //     };
}

class ProductResponse {
  ProductResponse({
    this.promotion,
    this.popular,
  });

  Promotion? promotion;
  List<Popular>? popular;

  // creates a instance of the popular response from the Map
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      ProductResponse(
        promotion: Promotion.fromJson(json["promotion"]),
        popular:
            List<Popular>.from(json["popular"].map((x) => Popular.fromJson(x))),
      );
  //
  // Map<String, dynamic> toJson() => {
  //       "promotion": promotion?.toJson(),
  //       "popular": List<dynamic>.from(popular!.map((x) => x.toJson())),
  //     };
}
