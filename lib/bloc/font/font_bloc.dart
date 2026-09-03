import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_lms/service/font_service.dart';

import 'font_event.dart';
import 'font_state.dart';

class FontBloc extends Bloc<FontEvent, FontState> {
  GetStorage getStorage = GetStorage();

  FontBloc({required this.getStorage})
    : super(
        FontState(
          fontScale: FontService.currentFontScale,
          fontFamily: FontService.currentFontFamily,
        ),
      ) {
    on<UpdateFontScale>(_onUpdateFontScale);
    on<UpdateFontFamily>(_onUpdateFontFamily);
  }
  void _onUpdateFontScale(UpdateFontScale event, Emitter<FontState> emit) async{
    await FontService.setFontScale(event.scale);
    emit(state.copyWith(fontScale: event.scale));
  }
  void _onUpdateFontFamily(UpdateFontFamily event, Emitter<FontState> emit) async{
    await FontService.setFontFamily(event.fontFamily);
    emit(state.copyWith(fontFamily: event.fontFamily));
  }
}
