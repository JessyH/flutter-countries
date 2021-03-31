import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'list_item.dart';
import 'providers/list_provider.dart';
import 'widgets/state_aware_widget.dart';
import '../res/app_colors.dart';
import '../res/app_strings.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListProvider _listProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ListProvider>(context, listen: false).fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    _listProvider = Provider.of<ListProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appTitle),
      ),
      body: stateAwareWidget(
        state: _listProvider.state,
        successWidget: _listView,
        failureWidget: _error,
      ),
    );
  }

  Widget _listView() {
    return RawScrollbar(
      thickness: 4,
      thumbColor: AppColors.primaryDark,
      child: ListView.builder(
        itemCount: _listProvider.countries.length,
        itemBuilder: (context, int index) => ListItem(
          key: ObjectKey(index),
          country: _listProvider.countries[index],
        ),
      ),
    );
  }

  Widget _error() {
    return Center(
      child: Text(AppStrings.errorLoadingCountries),
    );
  }
}
