import 'package:flutter/widgets.dart';

import 'custom_progress_indicator.dart';
import '../providers/base_provider.dart';

Widget stateAwareWidget({
  @required ProviderState state,
  @required Function successWidget,
  @required Function failureWidget,
  Widget defaultWidget,
}) {
  switch (state) {
    case ProviderState.Success:
      return successWidget();
    case ProviderState.Failure:
      return failureWidget();
    default:
      return defaultWidget == null ? CustomProgressIndicator() : defaultWidget;
  }
}
