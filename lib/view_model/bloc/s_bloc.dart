import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 's_event.dart';
part 's_state.dart';

class SBloc extends Bloc<SEvent, SState> {
  SBloc() : super(SInitial()) {
    on<SEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
