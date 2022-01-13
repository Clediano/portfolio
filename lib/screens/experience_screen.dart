import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:portfolio/common/data.dart';
import 'package:portfolio/common/responsive.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/models/company.dart';
import 'package:portfolio/models/experience.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  String selectedElement = "";

  List<Widget> _renderExperiences(BuildContext context) {
    final bool isDarkTheme = Get.isDarkMode;
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isTablet = Responsive.isTablet(context);
    final List<Company> companies = getCompanies(context);

    List<Widget> list = [];

    for (final company in companies) {
      list.add(
        SizedBox(
          width: 500,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [pDefaultCardShadow],
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isDesktop)
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 5,
                              right: 5,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundImage: AssetImage(company.logo),
                              ),
                            ),
                            ListTile(
                              onTap: () => _viewLogotype(company),
                              title: Text(
                                company.name,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                company.duration,
                                maxLines: 2,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      if (!isDesktop)
                        ListTile(
                          onTap: () => _viewLogotype(company),
                          leading: Image.asset(company.logo),
                          title: Text(
                            company.name,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            company.duration,
                            maxLines: 2,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      const SizedBox(height: 15),
                      ExpansionPanelList(
                        animationDuration: Duration(milliseconds: 150),
                        expansionCallback: (int index, bool isExpanded) {
                          if (isExpanded) {
                            setState(() {
                              selectedElement = "";
                            });
                          } else {
                            setState(() {
                              selectedElement = company.experiences[index].id;
                            });
                          }
                        },
                        children: company.experiences.map<ExpansionPanel>(
                          (Experience experience) {
                            return ExpansionPanel(
                              headerBuilder:
                                  (BuildContext context, bool isExpanded) {
                                return ListTile(
                                  leading: (isDesktop || isTablet)
                                      ? const SizedBox(
                                          width: 56,
                                          height: 56,
                                          child: Icon(
                                            Icons.circle,
                                            size: 10,
                                          ),
                                        )
                                      : null,
                                  title: Text(
                                    experience.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(experience.subTitle),
                                    ],
                                  ),
                                );
                              },
                              body: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  experience.description,
                                  textAlign: TextAlign.justify,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      ?.copyWith(
                                        color: isDarkTheme
                                            ? Theme.of(context)
                                                .primaryColorLight
                                            : Theme.of(context)
                                                .primaryColorDark,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                              isExpanded: selectedElement == experience.id,
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
              if (!identical(company, companies.last))
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    child: VerticalDivider(
                      color: Theme.of(context).primaryColorDark,
                    ),
                    height: 30,
                  ),
                )
            ],
          ),
        ),
      );
    }
    return list;
  }

  void _viewLogotype(Company company) {
    final bool isDarkTheme = Get.isDarkMode;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                company.name,
                style: Theme.of(context).textTheme.headline2?.copyWith(
                      color: isDarkTheme
                          ? Theme.of(context).primaryColorLight
                          : Theme.of(context).primaryColorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(company.logo),
                  ),
                ],
              ),
            ],
          ),
          content: Container(
            width: 500,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Text(
                    company.detail,
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: isDarkTheme
                              ? Theme.of(context).primaryColorLight
                              : Theme.of(context).primaryColorDark,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => launch(company.link, universalLinksOnly: true),
              child: Text(
                AppLocalizations.of(context)!.companyKnowMoreButton,
              ),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: pDefaultPadding,
                  vertical: pDefaultPadding,
                ),
              ),
            ),
            ElevatedButton(
              child: Text(
                AppLocalizations.of(context)!.companyCloseButton.toUpperCase(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: pDefaultPadding,
                  vertical: pDefaultPadding,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(children: _renderExperiences(context)),
    );
  }
}
