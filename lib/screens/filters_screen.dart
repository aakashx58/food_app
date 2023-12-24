import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabsScreen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentfilters});
  final Map<filter,bool> currentfilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum filter {
  glutenfree,
  lactosefree,
  vegeterian,
  vegan,
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenfreefilterSet = false;
  var _lactosefreefilterSet = false;
  var _vegeterianfilterSet = false;
  var _veganfilterSet = false;
  @override
  void initState() {

    super.initState();
    setState(() {
      _glutenfreefilterSet = widget.currentfilters[filter.glutenfree]!;
      _lactosefreefilterSet = widget.currentfilters[filter.lactosefree]!;
      _vegeterianfilterSet = widget.currentfilters[filter.vegeterian]!;
      _veganfilterSet = widget.currentfilters[filter.vegan]!;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (context) => TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filter.glutenfree: _glutenfreefilterSet,
            filter.lactosefree: _lactosefreefilterSet,
            filter.vegeterian: _vegeterianfilterSet,
            filter.vegan: _veganfilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Gluten-free'),
              subtitle: Text('Only include gluten-free meals.'),
              value: _glutenfreefilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenfreefilterSet = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text('Lactose-free'),
              subtitle: Text('Only include lactose-free meals.'),
              value: _lactosefreefilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactosefreefilterSet = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text('Vegeterian'),
              subtitle: Text('Only include vegetarian  meals.'),
              value: _vegeterianfilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegeterianfilterSet = isChecked;
                });
              },
            ),
            SwitchListTile(
              title: Text('Vegan'),
              subtitle: Text('Only include vegan meals.'),
              value: _veganfilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganfilterSet = isChecked;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
