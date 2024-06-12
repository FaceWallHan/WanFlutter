import 'dart:convert';

class HomeArticleData {
  int curPage;
  List<ArticleDataItem> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  HomeArticleData({
    required this.curPage,
    required this.datas,
    required this.offset,
    required this.over,
    required this.pageCount,
    required this.size,
    required this.total,
  });

  factory HomeArticleData.fromRawJson(String str) =>
      HomeArticleData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeArticleData.fromJson(Map<String, dynamic> json) =>
      HomeArticleData(
        curPage: json["curPage"],
        datas: List<ArticleDataItem>.from(
            json["datas"].map((x) => ArticleDataItem.fromJson(x))),
        offset: json["offset"],
        over: json["over"],
        pageCount: json["pageCount"],
        size: json["size"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "curPage": curPage,
        "datas": List<dynamic>.from(datas.map((x) => x.toJson())),
        "offset": offset,
        "over": over,
        "pageCount": pageCount,
        "size": size,
        "total": total,
      };
}

class ArticleDataItem {
  bool adminAdd;
  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  String host;
  int id;
  bool isAdminAdd;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<HomeArticleTagItem> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  ArticleDataItem({
    required this.adminAdd,
    required this.apkLink,
    required this.audit,
    required this.author,
    required this.canEdit,
    required this.chapterId,
    required this.chapterName,
    required this.collect,
    required this.courseId,
    required this.desc,
    required this.descMd,
    required this.envelopePic,
    required this.fresh,
    required this.host,
    required this.id,
    required this.isAdminAdd,
    required this.link,
    required this.niceDate,
    required this.niceShareDate,
    required this.origin,
    required this.prefix,
    required this.projectLink,
    required this.publishTime,
    required this.realSuperChapterId,
    required this.selfVisible,
    required this.shareDate,
    required this.shareUser,
    required this.superChapterId,
    required this.superChapterName,
    required this.tags,
    required this.title,
    required this.type,
    required this.userId,
    required this.visible,
    required this.zan,
  });

  factory ArticleDataItem.fromRawJson(String str) =>
      ArticleDataItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ArticleDataItem.fromJson(Map<String, dynamic> json) =>
      ArticleDataItem(
        adminAdd: json["adminAdd"],
        apkLink: json["apkLink"],
        audit: json["audit"],
        author: json["author"],
        canEdit: json["canEdit"],
        chapterId: json["chapterId"],
        chapterName: json["chapterName"],
        collect: json["collect"],
        courseId: json["courseId"],
        desc: json["desc"],
        descMd: json["descMd"],
        envelopePic: json["envelopePic"],
        fresh: json["fresh"],
        host: json["host"],
        id: json["id"],
        isAdminAdd: json["isAdminAdd"],
        link: json["link"],
        niceDate: json["niceDate"],
        niceShareDate: json["niceShareDate"],
        origin: json["origin"],
        prefix: json["prefix"],
        projectLink: json["projectLink"],
        publishTime: json["publishTime"],
        realSuperChapterId: json["realSuperChapterId"],
        selfVisible: json["selfVisible"],
        shareDate: json["shareDate"],
        shareUser: json["shareUser"],
        superChapterId: json["superChapterId"],
        superChapterName: json["superChapterName"],
        tags: List<HomeArticleTagItem>.from(
            json["tags"].map((x) => HomeArticleTagItem.fromJson(x))),
        title: json["title"],
        type: json["type"],
        userId: json["userId"],
        visible: json["visible"],
        zan: json["zan"],
      );

  Map<String, dynamic> toJson() => {
        "adminAdd": adminAdd,
        "apkLink": apkLink,
        "audit": audit,
        "author": author,
        "canEdit": canEdit,
        "chapterId": chapterId,
        "chapterName": chapterName,
        "collect": collect,
        "courseId": courseId,
        "desc": desc,
        "descMd": descMd,
        "envelopePic": envelopePic,
        "fresh": fresh,
        "host": host,
        "id": id,
        "isAdminAdd": isAdminAdd,
        "link": link,
        "niceDate": niceDate,
        "niceShareDate": niceShareDate,
        "origin": origin,
        "prefix": prefix,
        "projectLink": projectLink,
        "publishTime": publishTime,
        "realSuperChapterId": realSuperChapterId,
        "selfVisible": selfVisible,
        "shareDate": shareDate,
        "shareUser": shareUser,
        "superChapterId": superChapterId,
        "superChapterName": superChapterName,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "title": title,
        "type": type,
        "userId": userId,
        "visible": visible,
        "zan": zan,
      };
}

class HomeArticleTagItem {
  String name;
  String url;

  HomeArticleTagItem({
    required this.name,
    required this.url,
  });

  factory HomeArticleTagItem.fromRawJson(String str) =>
      HomeArticleTagItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HomeArticleTagItem.fromJson(Map<String, dynamic> json) =>
      HomeArticleTagItem(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
