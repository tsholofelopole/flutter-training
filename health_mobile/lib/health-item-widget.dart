import 'package:flutter/material.dart';

import 'health-item-text-widget.dart';
import 'health-item-widget-type.dart';


class HealthItemWidget extends StatelessWidget {

  final IconData iconData;
  final String itemText;
  final health_item_type type;
  // Future<Image?> onPressed;
  HealthItemWidget(this.iconData, this.itemText, this.type);

  Icon createIcon() {
    return Icon(
      iconData,
      color: discoveryBlue,
      size: 18,
    );
  }

  @override
  Widget build(BuildContext context) {

    return TextButton(
        onPressed: (){},
      style: TextButton.styleFrom(padding: EdgeInsets.zero,
        minimumSize: Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,),

      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: createIcon(),
            ),
            HealthItemTextWidget(itemText),
          ],
        ),
      ),
    );
  }
}
