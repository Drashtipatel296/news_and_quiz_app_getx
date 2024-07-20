import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../controller/data_controller.dart';
import '../details/details_screen.dart';

List<String> img = [
  'https://thumbs.dreamstime.com/b/news-newspapers-folded-stacked-word-wooden-block-puzzle-dice-concept-newspaper-media-press-release-42301371.jpg',
  'https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg',
  'https://cdn.zeebiz.com/sites/default/files/2023/08/08/255164-image-1200x900-2023-08-08t000901491.jpg',
  'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DataController dataController = Get.put(DataController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Obx(
            () {
              if (dataController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (dataController.newsModel == null) {
                  return Center(
                    child: Text('No data available'),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 220,
                      width: double.infinity,
                      child: CarouselSlider.builder(
                        unlimitedMode: true,
                        slideTransform: BackgroundToForegroundTransform(),
                        initialPage: 0,
                        enableAutoSlider: true,
                        itemCount: img.length,
                        slideBuilder: (index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.network(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Latest News',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: dataController.newsModel!.articlesModel.length,
                          itemBuilder: (context, index) {
                            final article = dataController.newsModel!.articlesModel[index];
                            return GestureDetector(
                            onTap: () {
                              Get.to(DetailsScreen(article: article,),transition: Transition.zoom);
                            },
                            child: Card(
                              color: Colors.grey.shade900,
                              child: SizedBox(
                                height: 120,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(dataController.newsModel!.articlesModel[index].urlToImage),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 15,),
                                            Text(
                                              overflow: TextOverflow.ellipsis,
                                              dataController.newsModel!.articlesModel[index].title,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20),
                                            ),
                                            SizedBox(height: 45,),
                                            Row(
                                              children: [
                                                Text(
                                                  dataController.newsModel!.articlesModel[index].publishedAt,
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 16),
                                                ),
                                                Spacer(),
                                                Icon(Icons.bookmark,color: Colors.orange.shade700,size: 18,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                          },
                        ),
                      ),
                  ],
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        fixedColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color: Colors.white,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,color: Colors.grey,),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.grey,),
              label: 'Account',
            ),
          ],
        ),
    );
  }
}
