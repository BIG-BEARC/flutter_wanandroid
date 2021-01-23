import 'package:flutter_wanandroid/generated/json/base/json_convert_content.dart';

/// * @Author: chuxiong
/// * @Created at: 2021/1/21
/// * @Email:
/// * @Company: 嘉联支付
/// * description: 首页list
///
class HomeEntity with JsonConvert<HomeEntity> {
	int curPage;
	List<HomeData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class HomeData with JsonConvert<HomeData> {
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
	List<HomeDatasTag> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}

class HomeDatasTag with JsonConvert<HomeDatasTag> {
	String name;
	String url;
}
