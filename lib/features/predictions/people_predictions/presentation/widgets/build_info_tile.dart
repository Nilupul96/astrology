import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import '../../../../../core/app_colors.dart';

class BuildInfoTile extends StatelessWidget {
  final String title;
  final String body;
  const BuildInfoTile({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ExpandablePanel(
        header: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: AppColors.primaryYellow),
        ),
        collapsed: Text(
          '',
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        expanded: Text(
          body,
          softWrap: true,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(fontWeight: FontWeight.w400),
          textAlign: TextAlign.justify,
        ),
        theme: ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
            iconColor: AppColors.primaryYellow,
            hasIcon: true),
      ),
    );
  }
}
