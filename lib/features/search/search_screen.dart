import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/data_source/remote_data/api_service.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/details/news_details_screen.dart';
import 'package:news_app/features/home/repos/news_repository.dart';
import 'package:news_app/features/search/search_controller.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          NewsSearchController(NewsRepository(ApiService())),
      child: Scaffold(
        appBar: AppBar(title: Text("Search")),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.pw18),
          child: Consumer<NewsSearchController>(
            builder:
                (BuildContext context, NewsSearchController controller, Widget? child) {
                  return Column(
                    children: [
                      SizedBox(
                        height: AppSizes.h48,
                        child: TextField(
                          controller: controller.searchController,
                          onChanged: (val){
                            controller.getEverything();
                          },
                          decoration: InputDecoration(
                            hint: Text(
                              "Search",
                              style: Theme.of(context).textTheme.labelMedium!
                                  .copyWith(color: Color(0xFFA0A0A0)),
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(AppSizes.pw10),
                              child: CustomSvgPicture.withoutColor(
                                imagePath: "assets/images/search.svg",
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.r4),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.r4),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSizes.r4),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondaryContainer,
                                width: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: controller.newsEverythingList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = controller.newsEverythingList[index];
                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (BuildContext context) {
                                  return NewsDetailsScreen(item: item);
                                }));
                              },
                              leading: Padding(
                                padding: EdgeInsets.all(AppSizes.pw12),
                                child: CustomSvgPicture.withoutColor(
                                  imagePath: "assets/images/search.svg",
                                ),
                              ),
                              title: Text(item.title, maxLines: 1, style: Theme.of(context).textTheme.titleSmall!.copyWith( color: Color(0xFF6D6D6D)),),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Divider(color: Color(0xFFD1DAD6), height: 1);
                          },
                        ),
                      ),
                    ],
                  );
                },
          ),
        ),
      ),
    );
  }
}
