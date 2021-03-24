import 'package:envirocar_flutter/theme/colors_cario.dart';
import 'package:flutter/material.dart';

class ArrowCard extends StatelessWidget {
  const ArrowCard(
      {Key key, this.iconData, this.textHead, this.textBody, this.onClick})
      : super(key: key);

  final IconData iconData;
  final String textHead;
  final String textBody;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
      child: ElevatedButton(
        // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        // color: Colors.white,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(0)),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(Colors.black87),
          elevation: MaterialStateProperty.all(2.0),
        ),
        onPressed: () {},
        child: InkWell(
          onTap: onClick,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CarioColors.carioColorPrimaryDark,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
                  child: Icon(iconData, color: Colors.white),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textHead,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        textBody,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_forward_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
