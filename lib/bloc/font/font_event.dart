import 'package:equatable/equatable.dart';
import 'package:my_lms/bloc/font/font_state.dart';

abstract class FontEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class UpdateFontScale extends FontEvent{
  final double scale;
  UpdateFontScale({required this.scale});
  @override
  List<Object?> get props => [scale];
}

class UpdateFontFamily extends FontEvent{
  final String fontFamily;
  UpdateFontFamily({required this.fontFamily});
  @override
  List<Object?> get props => [fontFamily];
}