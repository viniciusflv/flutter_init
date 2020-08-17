import 'dart:convert';
import 'package:flutter/material.dart';

class Utils {
  jsonStringfy(Map json) {
    try {
      return new JsonEncoder.withIndent('  ').convert(json);
    } catch (e) {
      print(e);
    }
  }

  List<Res> mapper<Arg, Res>(List<Arg> list, Res Function(int, Arg) cb) =>
      list.asMap().map((i, value) => MapEntry(i, cb(i, value))).values.toList();

  jsonParse(String jsonString) => jsonDecode(jsonString);
  /// value != null
  bool exists(value) => (value != null && value != '') ? true : false;

  ///     source = { "x": "1", "y": 2  }
  ///     target = { "x": 2 }
  ///
  ///     return { "x": 2, "y": 2  }
  populateIfMissing<K, V>(
    Map<dynamic, dynamic> source,
    Map<K, V> target,
  ) {
    final keys = source.keys.toList();
    for (var key in keys) target.putIfAbsent(key, () => source[key]);
    return target;
  }

  bool onlyOneExists(first, last) => ((exists(first) || exists(last)) &&
      ((exists(first) && !exists(last)) || (exists(last) && !exists(first))));
  Size getSize(BuildContext ctx) => MediaQuery.of(ctx).size;
  Color hexToColor(String hex) {
    final buffer = StringBuffer();
    if (hex.length == 6 || hex.length == 7) buffer.write('ff');
    buffer.write(hex.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  String colorsToHex(Color c) =>
      '#' +
      c
          .toString()
          .replaceAll('0xff', '__')
          .replaceAll(')', '__')
          .split('__')[1];

  /// [ double ] [ String ] separeted by [ , ]
  ///
  /// Examples:
  ///
  ///     'all'
  ///     'vertical, horizontal'
  ///     'top, right, bottom, left'
  EdgeInsets edgeInsets(String edge) {
    edge = edge ?? '0';
    List edges = edge.split(',').map(double.parse).toList();

    switch (edges.length) {
      case 1:
        return EdgeInsets.all(edges[0]);
      case 2:
        return EdgeInsets.symmetric(vertical: edges[0], horizontal: edges[1]);
      case 4:
        return EdgeInsets.fromLTRB(edges[3], edges[0], edges[1], edges[2]);
      default:
        return EdgeInsets.zero;
    }
  }

  BorderRadius borderRadius(String radius) {
    radius = radius ?? '0';
    List edgeRadius = radius.split(',').map(double.parse).toList();

    switch (edgeRadius.length) {
      case 1:
        return BorderRadius.circular(edgeRadius[0]);
      default:
        return BorderRadius.only(
          topLeft: Radius.circular(edgeRadius[0] ?? 0),
          topRight: Radius.circular(edgeRadius[1] ?? 0),
          bottomRight: Radius.circular(edgeRadius[2] ?? 0),
          bottomLeft: Radius.circular(edgeRadius[3] ?? 0),
        );
    }
  }

  ShapeBorder border({
    String radius = '0',
    double stroke = 0,
    bool circular = false,
    Color color = Colors.transparent,
  }) {
    if (circular) {
      return CircleBorder(
        side: BorderSide(
          color: color,
          width: stroke,
        ),
      );
    } else {
      return RoundedRectangleBorder(
        borderRadius: borderRadius(radius),
        side: BorderSide(
          color: color,
          width: stroke,
        ),
      );
    }
  }
}
