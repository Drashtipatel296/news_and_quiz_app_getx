import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:news_app_with_getx/helper/api_service.dart';
import 'package:news_app_with_getx/model/news_data.dart';

class DataController extends GetxController{
  NewsModel? newsModel;
  RxBool isLoading = false.obs;

  Future<void> fetchData() async {
    isLoading.value = true;

    String? json = await ApiServices().apiCalling();
    if(json != null){
      newsModel = NewsModel.fromJson(jsonDecode(json));
    }
    else{
      log('------------ null ------------');
    }

    isLoading.value = false;
  }

  DataController(){
    fetchData();
  }
}