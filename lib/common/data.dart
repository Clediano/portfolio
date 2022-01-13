import 'package:flutter/material.dart';
import 'package:portfolio/models/company.dart';
import 'package:portfolio/models/experience.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Company> getCompanies(BuildContext context) => [
  Company(
    logo: "assets/images/capgemini.png",
    name: "Capgemini",
    detail: AppLocalizations.of(context)!.companyDetail1,
    duration: AppLocalizations.of(context)!.companyDuration1,
    link: "https://www.capgemini.com/us-en/our-company",
    experiences: [
      Experience(
        id: "a69e79f6-9760-44e1-9502-d3413657990d",
        title: AppLocalizations.of(context)!.experienceTitle1,
        subTitle: AppLocalizations.of(context)!.experienceSubTitle1,
        description: AppLocalizations.of(context)!.experienceDescription1,
      ),
    ],
  ),
  Company(
    logo: "assets/images/evoluum.png",
    name: "Evoluum",
    detail: AppLocalizations.of(context)!.companyDetail2,
    duration: AppLocalizations.of(context)!.companyDuration2,
    link: "https://www.evoluum.com.br/quem-somos",
    experiences: [
      Experience(
        id: "6570761b-6634-435f-a76b-073c2e756a16",
        title: AppLocalizations.of(context)!.experienceTitle2,
        subTitle: AppLocalizations.of(context)!.experienceSubTitle2,
        description: AppLocalizations.of(context)!.experienceDescription2,
      ),
    ],
  ),
  Company(
    logo: "assets/images/microsys.png",
    name: "Microsys Sistemas",
    detail: AppLocalizations.of(context)!.companyDetail3,
    duration: AppLocalizations.of(context)!.companyDuration3,
    link: "http://www.microsys.inf.br/s/index.php?pg=empresa",
    experiences: [
      Experience(
        id: "f06aae5e-aff7-4082-8d61-c7a9fb76c3aa",
        title: AppLocalizations.of(context)!.experienceTitle31,
        subTitle: AppLocalizations.of(context)!.experienceSubTitle31,
        description: AppLocalizations.of(context)!.experienceDescription31,
      ),
      Experience(
        id: "50e86652-20d2-4fa8-bec0-bf6be39d8934",
        title: AppLocalizations.of(context)!.experienceTitle32,
        subTitle: AppLocalizations.of(context)!.experienceSubTitle32,
        description: AppLocalizations.of(context)!.experienceDescription32,
      ),
      Experience(
        id: "fc17bb83-15d3-407d-80e7-89d5e9604a9d",
        title: AppLocalizations.of(context)!.experienceTitle33,
        subTitle: AppLocalizations.of(context)!.experienceSubTitle33,
        description: AppLocalizations.of(context)!.experienceDescription33,
      ),
    ],
  ),
];
