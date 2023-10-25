// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SummaryModel {
  String? jenis;
  int? total;

  IconData get icon {
    switch (jenis) {
      case 'jenis_off':
        return Icons.touch_app_outlined;
      case 'jenis_on':
        return Icons.touch_app_outlined;
      case 'tte_off':
        return Icons.touch_app_outlined;
      case 'tte_on':
        return Icons.touch_app_outlined;
      case 'disposisi_off':
        return Icons.touch_app_outlined;
      case 'disposisi_on':
        return Icons.touch_app_outlined;
      default:
        return Icons.error;
    }
  }

  String get title {
    switch (jenis) {
      case 'jenis_off':
        return 'Belum diparaf';
      case 'jenis_on':
        return 'Sudah diparaf';
      case 'tte_off':
        return 'Belum di-TTE';
      case 'tte_on':
        return 'Sudah di-TTE';
      case 'disposisi_off':
        return 'Disposisi belum diparaf';
      case 'disposisi_on':
        return 'Disposisi sudah diparaf';
      default:
        return '-';
    }
  }

  SummaryModel({
    this.jenis,
    this.total,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jenis': jenis,
      'total': total,
    };
  }

  factory SummaryModel.fromMap(Map<String, dynamic> map) {
    return SummaryModel(
      jenis: map['jenis'] != null ? map['jenis'] as String : null,
      total: map['total'] != null ? map['total'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SummaryModel.fromJson(String source) =>
      SummaryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum SummaryJenis {
  jenis_off,
  jenis_on,
  tte_off,
  tte_on,
  disposisi_off,
  disposisi_on,
}
