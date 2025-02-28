import 'package:fb_components/src/base/base_fb_config.dart';
import 'package:fb_components/src/base/base_input.dart';
import 'package:fb_components/src/base/fb_enum.dart';
import 'package:fb_components/src/inputs/single/dropdown_input.dart';
import 'package:flutter/material.dart';

class FbColumnConfig extends BaseFbConfig<FbColumnStyles> {
  var mainAxisInput = FbInputDataDropdown(
    'MainAxisAlign',
    defaultEnum: MainAxisAlignment.start,
    list: MainAxisAlignment.values,
  );

  var crossAxisInput = FbInputDataDropdown(
    'CrossAxisAlign',
    defaultEnum: CrossAxisAlignment.center,
    list: CrossAxisAlignment.values,
  );

  var mainAxisSizeInput = FbInputDataDropdown(
    'MainAxisSize',
    defaultEnum: MainAxisSize.max,
    list: MainAxisSize.values,
  );

  FbColumnConfig() : super(FbWidgetType.column, FbChildType.multiple);

  @override
  String generateCode(String? childCode, int level) {
    // TODO: implement generateCode
    throw UnimplementedError();
  }

  @override
  List<BaseFbInput> getInputs() {
    return [
      mainAxisInput,
      crossAxisInput,
      mainAxisSizeInput,
    ];
  }

  @override
  FbColumnStyles getWidgetStyles() {
    return FbColumnStyles(
      id,
      widgetType,
      mainAlignment: mainAxisInput.value,
      crossAlignment: crossAxisInput.value,
      axisSize: mainAxisSizeInput.value,
    );
  }
}

class FbColumnStyles extends BaseFbStyles {
  MainAxisAlignment mainAlignment;
  CrossAxisAlignment crossAlignment;
  MainAxisSize axisSize;

  FbColumnStyles(
    int id,
    FbWidgetType widgetType, {
    required this.mainAlignment,
    required this.crossAlignment,
    required this.axisSize,
  }) : super(id, widgetType);
}
