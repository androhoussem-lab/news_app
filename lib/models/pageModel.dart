import 'package:flutter/material.dart';
class PageModel{
  String _image;
  String _title;
  String _description;
  IconData _icon;

  PageModel(this._image, this._title, this._description, this._icon);

  IconData get icon => _icon;

  String get description => _description;

  String get title => _title;

  String get image => _image;
}