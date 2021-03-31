import 'package:flutter/widgets.dart';
import 'package:flutter_countries/providers/base_provider.dart';
import 'package:flutter_countries/ui/widgets/custom_progress_indicator.dart';

Widget stateAwareWidget({
  @required ProviderState state,
  @required Widget success,
  @required Widget failure,
  Widget defaultWidget,
}) {
  switch (state) {
    case ProviderState.Success:
      return success;
    case ProviderState.Failure:
      return failure;
    default:
      return defaultWidget == null ? CustomProgressIndicator() : defaultWidget;
  }
}
