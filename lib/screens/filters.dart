import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          FiltersSwitchListTile(
            activeFilters: activeFilters,
            filter: Filter.glutenFree,
            mainText: 'Gluten-free',
            subText: 'Only include Gluten-free meals',
          ),
          FiltersSwitchListTile(
            activeFilters: activeFilters,
            filter: Filter.lactoseFree,
            mainText: 'Lactose-free',
            subText: 'Only include Lactose-free meals',
          ),
          FiltersSwitchListTile(
            activeFilters: activeFilters,
            filter: Filter.vegetarian,
            mainText: 'Vegetarian',
            subText: 'Only include Vegetarian meals',
          ),
          FiltersSwitchListTile(
            activeFilters: activeFilters,
            filter: Filter.vegan,
            mainText: 'Vegan',
            subText: 'Only include Vegan meals',
          ),
        ],
      ),
    );
  }
}

class FiltersSwitchListTile extends ConsumerWidget {
  const FiltersSwitchListTile({
    super.key,
    required this.activeFilters,
    required this.filter,
    required this.mainText,
    required this.subText,
  });

  final Map<Filter, bool> activeFilters;
  final Filter filter;
  final String mainText;
  final String subText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SwitchListTile(
      value: activeFilters[filter]!,
      onChanged: (isChecked) {
        ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
      },
      title: Text(
        mainText,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subText,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(
        left: 34,
        right: 22,
      ),
    );
  }
}
