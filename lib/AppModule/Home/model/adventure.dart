// To parse this JSON data, do
//
//     final adventure = adventureFromJson(jsonString);

import 'dart:convert';

Adventure adventureFromJson(String str) => Adventure.fromJson(json.decode(str));

String adventureToJson(Adventure data) => json.encode(data.toJson());

class Adventure {
  int? count;
  String? next;
  String? previous;
  List<Datum>? data;

  Adventure({
    this.count,
    this.next,
    this.previous,
    this.data,
  });

  factory Adventure.fromJson(Map<String, dynamic> json) => Adventure(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  int? pk;
  String? status;
  String? title;
  Location? areaLocation;
  Location? startingLocation;
  List<String>? tags;
  String? activity;
  int? activityId;
  String? primaryImage;
  String? primaryVideo;
  String? thumbnail;
  String? activityIcon;
  List<Badge>? badges;
  int? bucketListCount;
  List<Content>? contents;
  SupplyInfo? supplyInfo;
  List<GridInfo>? gridInfo;
  bool? ticketOptional;
  List<dynamic>? bucketListedByFollowing;
  String? primaryDescription;
  String? description;
  List<Fact>? facts;

  Datum({
    this.id,
    this.pk,
    this.status,
    this.title,
    this.areaLocation,
    this.startingLocation,
    this.tags,
    this.activity,
    this.activityId,
    this.primaryImage,
    this.primaryVideo,
    this.thumbnail,
    this.activityIcon,
    this.badges,
    this.bucketListCount,
    this.contents,
    this.supplyInfo,
    this.gridInfo,
    this.ticketOptional,
    this.bucketListedByFollowing,
    this.primaryDescription,
    this.description,
    this.facts,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        pk: json["pk"],
        status: json["status"],
        title: json["title"],
        areaLocation: json["area_location"] == null
            ? null
            : Location.fromJson(json["area_location"]),
        startingLocation: json["starting_location"] == null
            ? null
            : Location.fromJson(json["starting_location"]),
        tags: json["tags"] == null
            ? []
            : List<String>.from(json["tags"]!.map((x) => x)),
        activity: json["activity"],
        activityId: json["activity_id"],
        primaryImage: json["primary_image"],
        primaryVideo: json["primary_video"],
        thumbnail: json["thumbnail"],
        activityIcon: json["activity_icon"],
        badges: json["badges"] == null
            ? []
            : List<Badge>.from(json["badges"]!.map((x) => Badge.fromJson(x))),
        bucketListCount: json["bucket_list_count"],
        contents: json["contents"] == null
            ? []
            : List<Content>.from(
                json["contents"]!.map((x) => Content.fromJson(x))),
        supplyInfo: json["supply_info"] == null
            ? null
            : SupplyInfo.fromJson(json["supply_info"]),
        gridInfo: json["grid_info"] == null
            ? []
            : List<GridInfo>.from(
                json["grid_info"]!.map((x) => GridInfo.fromJson(x))),
        ticketOptional: json["ticket_optional"],
        bucketListedByFollowing: json["bucket_listed_by_following"] == null
            ? []
            : List<dynamic>.from(
                json["bucket_listed_by_following"]!.map((x) => x)),
        primaryDescription: json["primary_description"],
        description: json["description"],
        facts: json["facts"] == null
            ? []
            : List<Fact>.from(json["facts"]!.map((x) => Fact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pk": pk,
        "status": status,
        "title": title,
        "area_location": areaLocation?.toJson(),
        "starting_location": startingLocation?.toJson(),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "activity": activity,
        "activity_id": activityId,
        "primary_image": primaryImage,
        "primary_video": primaryVideo,
        "thumbnail": thumbnail,
        "activity_icon": activityIcon,
        "badges": badges == null
            ? []
            : List<dynamic>.from(badges!.map((x) => x.toJson())),
        "bucket_list_count": bucketListCount,
        "contents": contents == null
            ? []
            : List<dynamic>.from(contents!.map((x) => x.toJson())),
        "supply_info": supplyInfo?.toJson(),
        "grid_info": gridInfo == null
            ? []
            : List<dynamic>.from(gridInfo!.map((x) => x.toJson())),
        "ticket_optional": ticketOptional,
        "bucket_listed_by_following": bucketListedByFollowing == null
            ? []
            : List<dynamic>.from(bucketListedByFollowing!.map((x) => x)),
        "primary_description": primaryDescription,
        "description": description,
        "facts": facts == null
            ? []
            : List<dynamic>.from(facts!.map((x) => x.toJson())),
      };
}

class Location {
  String? name;
  dynamic subtitle;
  dynamic distance;
  dynamic imageUrl;

  Location({
    this.name,
    this.subtitle,
    this.distance,
    this.imageUrl,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        subtitle: json["subtitle"],
        distance: json["distance"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subtitle": subtitle,
        "distance": distance,
        "image_url": imageUrl,
      };
}

class Badge {
  String? title;
  String? icon;
  String? colorScheme;

  Badge({
    this.title,
    this.icon,
    this.colorScheme,
  });

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        title: json["title"],
        icon: json["icon"],
        colorScheme: json["color_scheme"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "icon": icon,
        "color_scheme": colorScheme,
      };
}

class Content {
  String? id;
  ContentType? contentType;
  ContentMode? contentMode;
  String? contentUrl;
  ContentSource? contentSource;
  bool? isHeaderForThePlan;
  bool? isPrivate;

  Content({
    this.id,
    this.contentType,
    this.contentMode,
    this.contentUrl,
    this.contentSource,
    this.isHeaderForThePlan,
    this.isPrivate,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        contentType: contentTypeValues.map[json["content_type"]],
        contentMode: contentModeValues.map[json["content_mode"]],
        contentUrl: json["content_url"],
        contentSource: json["content_source"] == null
            ? null
            : ContentSource.fromJson(json["content_source"]),
        isHeaderForThePlan: json["is_header_for_the_plan"],
        isPrivate: json["is_private"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content_type": contentTypeValues.reverse[contentType],
        "content_mode": contentModeValues.reverse[contentMode],
        "content_url": contentUrl,
        "content_source": contentSource?.toJson(),
        "is_header_for_the_plan": isHeaderForThePlan,
        "is_private": isPrivate,
      };
}

enum ContentMode {
  ADVENTURE_PRIMARY_IMAGE,
  ADVENTURE_GALLERY,
  ADVENTURE_PRIMARY_VIDEO
}

final contentModeValues = EnumValues({
  "ADVENTURE_GALLERY": ContentMode.ADVENTURE_GALLERY,
  "ADVENTURE_PRIMARY_IMAGE": ContentMode.ADVENTURE_PRIMARY_IMAGE,
  "ADVENTURE_PRIMARY_VIDEO": ContentMode.ADVENTURE_PRIMARY_VIDEO
});

class ContentSource {
  String? id;
  Title? title;
  String? author;
  String? name;
  dynamic icon;
  String? url;
  dynamic creator;

  ContentSource({
    this.id,
    this.title,
    this.author,
    this.name,
    this.icon,
    this.url,
    this.creator,
  });

  factory ContentSource.fromJson(Map<String, dynamic> json) => ContentSource(
        id: json["id"],
        title: titleValues.map[json["title"]],
        author: json["author"],
        name: json["name"],
        icon: json["icon"],
        url: json["url"],
        creator: json["creator"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": titleValues.reverse[title],
        "author": author,
        "name": name,
        "icon": icon,
        "url": url,
        "creator": creator,
      };
}

enum Title { EXPERIENCE_BANK }

final titleValues = EnumValues({"Experience Bank": Title.EXPERIENCE_BANK});

enum ContentType { IMAGE, VIDEO }

final contentTypeValues =
    EnumValues({"IMAGE": ContentType.IMAGE, "VIDEO": ContentType.VIDEO});

class Fact {
  String? name;
  String? value;
  String? unit;
  String? iconUrl;
  String? displaySection;
  int? factDefinitionId;
  int? adventureFactId;
  dynamic backgroundColor;
  dynamic iconColor;
  dynamic textColor;

  Fact({
    this.name,
    this.value,
    this.unit,
    this.iconUrl,
    this.displaySection,
    this.factDefinitionId,
    this.adventureFactId,
    this.backgroundColor,
    this.iconColor,
    this.textColor,
  });

  factory Fact.fromJson(Map<String, dynamic> json) => Fact(
        name: json["name"],
        value: json["value"],
        unit: json["unit"],
        iconUrl: json["icon_url"],
        displaySection: json["display_section"],
        factDefinitionId: json["fact_definition_id"],
        adventureFactId: json["adventure_fact_id"],
        backgroundColor: json["background_color"],
        iconColor: json["icon_color"],
        textColor: json["text_color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "unit": unit,
        "icon_url": iconUrl,
        "display_section": displaySection,
        "fact_definition_id": factDefinitionId,
        "adventure_fact_id": adventureFactId,
        "background_color": backgroundColor,
        "icon_color": iconColor,
        "text_color": textColor,
      };
}

class GridInfo {
  String? name;
  String? value;
  String? iconUrl;
  String? schema;

  GridInfo({
    this.name,
    this.value,
    this.iconUrl,
    this.schema,
  });

  factory GridInfo.fromJson(Map<String, dynamic> json) => GridInfo(
        name: json["name"],
        value: json["value"],
        iconUrl: json["icon_url"],
        schema: json["schema"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "icon_url": iconUrl,
        "schema": schema,
      };
}

class SupplyInfo {
  String? supplierName;
  String? priceTitle;
  String? priceSubtitle;
  String? buttonType;
  dynamic link;

  SupplyInfo({
    this.supplierName,
    this.priceTitle,
    this.priceSubtitle,
    this.buttonType,
    this.link,
  });

  factory SupplyInfo.fromJson(Map<String, dynamic> json) => SupplyInfo(
        supplierName: json["supplier_name"],
        priceTitle: json["price_title"],
        priceSubtitle: json["price_subtitle"],
        buttonType: json["button_type"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "supplier_name": supplierName,
        "price_title": priceTitle,
        "price_subtitle": priceSubtitle,
        "button_type": buttonType,
        "link": link,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
