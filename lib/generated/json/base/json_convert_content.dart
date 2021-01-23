// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_wanandroid/core/model/home_entity.dart';
import 'package:flutter_wanandroid/generated/json/home_entity_helper.dart';
import 'package:flutter_wanandroid/core/model/home_banner_entity.dart';
import 'package:flutter_wanandroid/generated/json/home_banner_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
			case HomeEntity:
				return homeEntityFromJson(data as HomeEntity, json) as T;
			case HomeData:
				return homeDataFromJson(data as HomeData, json) as T;
			case HomeDatasTag:
				return homeDatasTagFromJson(data as HomeDatasTag, json) as T;
			case HomeBannerEntity:
				return homeBannerEntityFromJson(data as HomeBannerEntity, json) as T;    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case HomeEntity:
				return homeEntityToJson(data as HomeEntity);
			case HomeData:
				return homeDataToJson(data as HomeData);
			case HomeDatasTag:
				return homeDatasTagToJson(data as HomeDatasTag);
			case HomeBannerEntity:
				return homeBannerEntityToJson(data as HomeBannerEntity);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (HomeEntity).toString()){
			return HomeEntity().fromJson(json);
		}	else if(type == (HomeData).toString()){
			return HomeData().fromJson(json);
		}	else if(type == (HomeDatasTag).toString()){
			return HomeDatasTag().fromJson(json);
		}	else if(type == (HomeBannerEntity).toString()){
			return HomeBannerEntity().fromJson(json);
		}	
		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List<Map> data) {
		if(List<HomeEntity>() is M){
			return data.map((e) => HomeEntity().fromJson(e)).toList() as M;
		}	else if(List<HomeData>() is M){
			return data.map((e) => HomeData().fromJson(e)).toList() as M;
		}	else if(List<HomeDatasTag>() is M){
			return data.map((e) => HomeDatasTag().fromJson(e)).toList() as M;
		}	else if(List<HomeBannerEntity>() is M){
			return data.map((e) => HomeBannerEntity().fromJson(e)).toList() as M;
		}
		return null;
	}

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}