import 'package:Readify/commons/widgets/appbar/appbar.dart';
import 'package:Readify/commons/widgets/bookmarks/bookmark_menu_icon.dart';
import 'package:Readify/commons/widgets/custom_shapes/containers/search_container.dart';
import 'package:Readify/commons/widgets/layout/grid_layout.dart';
import 'package:Readify/commons/widgets/texts/section_heading.dart';
import 'package:Readify/features/library/screens/library/widgets/cateogory_tab.dart';
import 'package:Readify/utils/constants/sizes.dart';
import 'package:Readify/utils/helpers/helper_fuction.dart';
import 'package:flutter/material.dart';
import '../../../../commons/widgets/appbar/tabbar.dart';
import '../../../../commons/widgets/author/author_card.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        ///appbar
        appBar: ReadifyAppBar(
          title: Text(
            'Library',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            ReadifyBookmarkCounterIcon(
                iconColor: ReadifyHelperFunctions.isDarkMode(context)
                    ? ReadifyColors.white
                    : ReadifyColors.black)
          ],
        ),

        ///body
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxScrolled) {
              return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: ReadifyHelperFunctions.isDarkMode(context)
                      ? ReadifyColors.black
                      : ReadifyColors.white,
                  expandedHeight: 440,

                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(ReadifySizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                      ///searchBar
                      SizedBox(
                      height: ReadifySizes.spaceBtwItems,
                    ),

                    ReadifySearchContainer(
                      text: 'Find your next great read...',
                      showBorder: true,
                      showBackground: false,
                      padding: EdgeInsets.zero,
                    ),
                    SizedBox(
                      height: ReadifySizes.spaceBtwSection,
                    ),

                    ///Featured Authors
                    ReadifySectionHeading(
                      title: 'Meet the Mastermind',
                      showActionButton: true,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: ReadifySizes.spaceBtwItems / 1.5,
                    ),

                    ReadifyGridLayout(
                        itemcount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return ReadifyAuthorCard(
                            showBorder: true,
                          );
                        })
                    ],
                  )),

              ///tabs
              bottom: const ReadifyTabBar(
              tabs: [
              Tab(child: Text('Action')),
              Tab(child: Text('Mystrey')),
              Tab(child: Text('Sci-Fi')),
              Tab(child: Text('Horror')),
              Tab(child: Text('Romance')),
              Tab(child: Text('Travel')),
              ],
              ),
              ),
              ];
            },
            body: const TabBarView(children: [
              /// authors
              ReadifyCateogoryTab(),
              ReadifyCateogoryTab(),
              ReadifyCateogoryTab(),
              ReadifyCateogoryTab(),
              ReadifyCateogoryTab(),
              ReadifyCateogoryTab(),
            ])),
      ),
    );
  }
}