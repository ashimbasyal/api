import 'dart:convert';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
    Image({
        this.odataContext,
        this.value,
    });

    String odataContext;
    String value;

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        odataContext: json["@odata.context"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "@odata.context": odataContext,
        "value": value,
    };
}

