import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'providers/details_provider.dart';
import 'widgets/state_aware_widget.dart';
import '../extensions/bool_ext.dart';
import '../model/continent.dart';
import '../model/country.dart';
import '../model/language.dart';
import '../res/app_strings.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  DetailsProvider _detailsProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<DetailsProvider>(context, listen: false).fetchDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    _detailsProvider = Provider.of<DetailsProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(_detailsProvider.country.name),
      ),
      body: stateAwareWidget(
        state: _detailsProvider.state,
        successWidget: _body,
        failureWidget: _error,
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Card(
        margin: EdgeInsets.all(8),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _countrySection(_detailsProvider.country),
              if (_detailsProvider.isExpanded) ...[
                _continentSection(_detailsProvider.country.continent),
                _languagesSection(_detailsProvider.country.languages),
              ],
              Row(
                children: [
                  Spacer(),
                  _detailsProvider.isExpanded
                      ? _showLessButton()
                      : _showMoreButton()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _error() {
    return Center(
      child: Text(AppStrings.errorLoadingCountry),
    );
  }

  Widget _countrySection(Country country) {
    return _section(
      AppStrings.general,
      [
        _rowLabelValue(AppStrings.code, country.code),
        _rowLabelValue(AppStrings.capital, country.capital),
        _rowLabelValue(AppStrings.native, country.native),
        _rowLabelValue(AppStrings.phone, country.phone),
        _rowLabelValue(AppStrings.currency, country.currency),
      ],
    );
  }

  Widget _continentSection(Continent continent) {
    return _section(
      AppStrings.continent,
      [
        _rowLabelValue(AppStrings.code, continent.code),
        _rowLabelValue(AppStrings.name, continent.name),
      ],
    );
  }

  Widget _languagesSection(List<Language> languages) {
    if (languages.isEmpty) {
      return Container();
    }
    final List<Widget> rows = [];
    for (int i = 0; i < languages.length; i++) {
      if (i > 0 && i < languages.length) {
        rows.add(Divider());
      }
      rows.addAll([
        _rowLabelValue(AppStrings.code, languages[i].code),
        _rowLabelValue(AppStrings.name, languages[i].name),
        _rowLabelValue(AppStrings.native, languages[i].native),
        _rowLabelValue(
          AppStrings.rightToLeft,
          languages[i].rightToLeft.displayValue(),
        ),
      ]);
    }
    return _section(AppStrings.languages, rows);
  }

  Widget _section(String title, List<Widget> rows) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ...rows,
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _rowLabelValue(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            child: Text(label),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              value,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget _showMoreButton() {
    return OutlinedButton.icon(
      icon: Icon(Icons.add),
      label: Text(AppStrings.showMore.toUpperCase()),
      onPressed: () => _detailsProvider.expand(),
    );
  }

  Widget _showLessButton() {
    return OutlinedButton.icon(
      icon: Icon(Icons.remove),
      label: Text(AppStrings.showLess.toUpperCase()),
      onPressed: () => _detailsProvider.contract(),
    );
  }
}
