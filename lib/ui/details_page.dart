import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'widgets/state_aware_widget.dart';
import '../providers/details_provider.dart';

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
        success: _body(),
        failure: Text('ERROR'),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Text('${_detailsProvider.country.currency}'),
    );
  }
}
