import 'package:currencies_converter/core/localization/domain/useCase/get_current_localization_use_case.dart';
import 'package:currencies_converter/core/localization/domain/useCase/set_current_localization_use_case.dart';
import 'package:currencies_converter/core/localization/presentation/localization_bloc/localization_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'localization_event.dart';
@injectable
class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final GetCurrentLocalizationUseCase getCurrentLocalizationUseCase;
  final SetCurrentLocalizationUseCase setCurrentLocalizationUseCase;

  LocalizationBloc(this.getCurrentLocalizationUseCase,this.setCurrentLocalizationUseCase,) : super(LocalizationInitial()) {
    on<LoadLocalizationEvent>(_onLoadLocalization);
    on<ChangeLocalizationEvent>(_onToggleLocalization);
  }

  Future<void> _onLoadLocalization(LoadLocalizationEvent event, Emitter<LocalizationState> emit) async {
    String currentLocalization  =  getCurrentLocalizationUseCase.execute();
    emit(LocalizationLoaded(currentLocalization: currentLocalization));
  }

  void _onToggleLocalization(ChangeLocalizationEvent event, Emitter<LocalizationState> emit) async{
    if (state is LocalizationLoaded) {
      final currentLocalization = (state as LocalizationLoaded).currentLocalization;
      final newLocalization = currentLocalization == "en"? "ar" : "en";
      await setCurrentLocalizationUseCase.execute(newLocalization);
      emit((state as LocalizationLoaded).copyWith(currentLocalization: newLocalization));
    }
  }
}
