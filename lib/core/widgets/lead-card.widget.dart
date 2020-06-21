import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeadCard extends StatelessWidget {
  const LeadCard({
    Key key,
    @required this.filename,
    @required this.fileExtension,
  }) : super(key: key);

  final String filename;
  final String fileExtension;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            color: Colors.black.withOpacity(.2),
            blurRadius: 9,
            spreadRadius: .2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 12.0,
                ),
                child: Icon(
                  Icons.table_chart,
                  size: 60,
                  color: Color(0xFF1D6F42),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    filename,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  Text('Extensão: $fileExtension'),
                ],
              ),
            ],
          ),
          Icon(
            CupertinoIcons.right_chevron,
            size: 40,
          ),
        ],
      ),
    );
  }
}
