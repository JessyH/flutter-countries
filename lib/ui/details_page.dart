import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'providers/details_provider.dart';
import 'widgets/state_aware_widget.dart';

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
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Text(
              _detailsProvider.country.emoji,
              style: TextStyle(fontSize: 24),
            ),
            title: Text(_detailsProvider.country.name),
          ),
          // Row(
          //   children: [
          //     Container(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             _detailsProvider.country.emoji,
          //             style: TextStyle(fontSize: 24),
          //           ),
          //         ],
          //       ),
          //     ),
          //     Expanded(
          //       child: Container(
          //         child: Text(_detailsProvider.country.name),
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
