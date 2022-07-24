import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "/filters";

  final Function saveFilters;
  final Map<String, bool> currentFilter;
  const FiltersScreen({required this.saveFilters, required this.currentFilter});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    // TODO: implement initState
    _glutenFree = widget.currentFilter['gluten']!;
    _vegetarian = widget.currentFilter['lactose']!;
    _vegan = widget.currentFilter['vegan']!;
    _lactoseFree = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  Widget _buildsSwitchListTile(String titleText, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(titleText),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (value) {
        updateValue(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                widget.saveFilters(
                  {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  },
                );
              },
              icon: const Icon(Icons.save),
            )
          ],
          title: const Text("Your FLilters"),
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Text("Adjust your meal selection.",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildsSwitchListTile(
                      "Gluten-Free",
                      "Only Includes Gluten Free Products",
                      _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildsSwitchListTile(
                      "Vegetarian",
                      "Only Includes Vegetarian Products",
                      _vegetarian, (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildsSwitchListTile(
                      "Vegan", "Only Includes Vegan Products", _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildsSwitchListTile(
                      "Lactose-Free",
                      "Only Includes Lactose Free Products",
                      _lactoseFree, (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
