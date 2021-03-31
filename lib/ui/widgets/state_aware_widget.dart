import 'package:flutter/widgets.dart';

import 'custom_progress_indicator.dart';
import '../providers/base_provider.dart';

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
