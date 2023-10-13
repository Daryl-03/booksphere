import 'package:booksphere/modules/component_modules/library_component/domain/entities/filter_type.dart';
import 'package:booksphere/utils/app_layout.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({
    Key? key,
    required this.activeFilter,
  }) : super(key: key);

  final FilterType activeFilter;

  @override
  Widget build(BuildContext context) {
    final displayWidth = AppLayout.displayWidth(context);
    final displayHeight = AppLayout.displayHeightWithoutBothBars(context);
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.background,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Title(
                color: theme.colorScheme.onBackground,
                child: Text(
                  'Filter',
                  style: theme.textTheme.headlineSmall!.copyWith(
                    color: theme.colorScheme.onBackground,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: theme.colorScheme.onBackground.withOpacity(0.5),
          ),
          SizedBox(
            height: displayHeight * 0.05,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                for (FilterType filterType in FilterType.values)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: displayWidth * 0.05,
                      vertical: displayHeight * 0.01,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          filterType.name,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: theme.colorScheme.onBackground,
                          ),
                        ),
                        Radio<FilterType>(
                          value: filterType,
                          groupValue: activeFilter,
                          onChanged: (value) {
                            Navigator.pop(context, value);
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
