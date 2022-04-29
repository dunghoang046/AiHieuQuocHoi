import 'package:app_aihieuquochoi/block/base/event.dart';
import 'package:app_aihieuquochoi/block/base/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocHome extends Bloc<ActionEvent, ActionState> {
  BlocHome() : super(NoState());
  get initialState => NoState();
  // ignore: non_constant_identifier_names

  static get loginItem => loginItem;

  @override
  Stream<ActionState> mapEventToState(ActionEvent event) async* {
    try {
      bool _IsAction = false;
      if (event is ClickEvent1) {
        yield LoadingState();
        _IsAction = true;
        if (_IsAction)
          yield ClickState1();
        else {
          yield ErrorState();
        }
      }
      if (event is ClickEvent2) {
        yield LoadingState();
        _IsAction = true;
        if (_IsAction)
          yield ClickState2();
        else {
          yield ErrorState();
        }
      }
    } catch (e) {}
  }
}
