import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/base_provider.dart';
import '../providers/list_provider.dart';
import '../res/app_colors.dart';
import '../res/app_strings.dart';
import '../ui/custom_progress_indicator.dart';

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
        title: Text(AppStrings.title),
      ),
      body: _listProvider.state == ProviderState.Success
          ? _listView()
          : CustomProgressIndicator(),
    );
  }

  Widget _listView() {
    return RawScrollbar(
      thickness: 4,
      thumbColor: AppColors.primaryDark,
      child: ListView.builder(
        itemCount: _listProvider.countries.length,
        itemBuilder: (context, int index) =>
            Text(_listProvider.countries[index].name),
      ),
    );
  }
}
