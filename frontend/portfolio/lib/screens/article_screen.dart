import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/common/data.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/components/appbar.dart';
import 'package:portfolio/components/drawer_menu.dart';
import 'package:portfolio/constatants.dart';
import 'package:portfolio/models/Card.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Appbar(),
      drawer: !Responsive.isDesktop(context) ? DrawerMenu() : null,
      body: Responsive(
        mobile: Center(child: Text("Article screen")),
        tablet: Center(child: Text("Article screen")),
        desktop: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: articles.length,
            itemBuilder: (context, idx) {
              Article article = articles.elementAt(idx);
              return LayoutBuilder(
                builder: (context, constraints) {
                  return Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('Card tapped.');
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight * 0.50,
                            child: Image.network(
                              article.image,
                              fit: BoxFit.cover,
                              color: Colors.grey,
                              colorBlendMode: BlendMode.darken,
                              height: 500 * 0.45,
                              loadingBuilder: (context, child, progess) {
                                return progess == null
                                    ? child
                                    : Center(
                                        child: CircularProgressIndicator(
                                          value: progess.expectedTotalBytes !=
                                                  null
                                              ? progess.cumulativeBytesLoaded /
                                                  progess.expectedTotalBytes
                                              : null,
                                        ),
                                      );
                              },
                            ),
                          ),
                          ListTile(
                            mouseCursor: MouseCursor.uncontrolled,
                            title: Text(article.title),
                            subtitle: Text(
                              article.subTitle,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
