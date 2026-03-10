import 'package:flutter/material.dart';
import 'package:news_app/core/components/news_item_details.dart';
import 'package:news_app/core/constants/app_sizes.dart';
import 'package:news_app/core/enums/request_status_enum.dart';
import 'package:news_app/core/widgets/custom_svg_picture.dart';
import 'package:news_app/features/bookmark/controller/bookmark_controller.dart';
import 'package:news_app/features/bookmark/widgets/empty_bookmark_screen.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bookmarks')),
      body: Padding(
        padding: EdgeInsets.all(AppSizes.pw16),
        child: Consumer<BookmarkController>(
          builder: (BuildContext context, BookmarkController controller, Widget? child) {
            switch (controller.bookMarkStatus) {
              case RequestStatusEnum.loading:
                return const Center(child: CircularProgressIndicator());
              case RequestStatusEnum.error:
                return Center(
                  child: Text(controller.errorMessage ?? 'Something went wrong'),
                );
              case RequestStatusEnum.loaded:
                if (controller.bookmarks.isEmpty) {
                  return EmptyBookmarkScreen();
                }
                return Column(
                  children: [
                    SizedBox(
                      height: AppSizes.h48,
                      child: TextField(
                        decoration: InputDecoration(
                          hint: Text(
                            'Search bookmarks',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Color(0xFFA0A0A0)),
                          ),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(AppSizes.pw10),
                            child: CustomSvgPicture.withoutColor(
                              imagePath: "assets/images/search.svg",
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondaryContainer,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondaryContainer,
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r10),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondaryContainer,
                              width: 1,
                            ),
                          ),
                        ),
                        onChanged: controller.search,
                      ),
                    ),
                    SizedBox(height: AppSizes.ph14),
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.bookmarks.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: AppSizes.ph8),
                        itemBuilder: (context, index) {
                          final bookmark = controller.bookmarks[index];
                          return NewsItemDetails(item: bookmark.toNewsArticle(), detailsText: false,);
                        },
                      ),
                    ),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
