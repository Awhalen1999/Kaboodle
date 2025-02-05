import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_packing_list_event.dart';
import 'create_packing_list_state.dart';

class CreatePackingListBloc
    extends Bloc<CreatePackingListEvent, CreatePackingListState> {
  CreatePackingListBloc() : super(CreatePackingListState.initial()) {
    on<TitleUpdated>((event, emit) {
      emit(state.copyWith(title: event.title));
    });
    on<DescriptionUpdated>((event, emit) {
      emit(state.copyWith(description: event.description));
    });
    on<ColorUpdated>((event, emit) {
      emit(state.copyWith(listColor: event.color));
    });
    on<TagsUpdated>((event, emit) {
      emit(state.copyWith(tags: event.tags));
    });
    on<DateUpdated>((event, emit) {
      emit(state.copyWith(travelDate: event.date));
    });
  }
}
