import 'package:app_aihieuquochoi/block/login_block/Auth_event.dart';
import 'package:app_aihieuquochoi/block/login_block/auth_state.dart';
import 'package:app_aihieuquochoi/models/NguoiDungItem.dart';
import 'package:app_aihieuquochoi/services/Base_service.dart';
import 'package:app_aihieuquochoi/utils/Base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAuth extends Bloc<AuthEvent, AuthState> {
  BlocAuth() : super(AuthLogoutSate());
  get initialState => AuthLogoutSate();
  // ignore: non_constant_identifier_names
  final Base_service base_service = new Base_service();

  static get loginItem => loginItem;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      bool _isLoged = false;
      if (event is LoginEvent) {
        yield AuLoadingState();
        var data = {
          "userName": event.logindata.userName,
          "password": event.logindata.password,
          "SoDienThoai": event.logindata.SoDienThoai,
          "lang": "vi",
          "checkFingerprint": "true"
        };
        await base_service.getlogin(data).then((result) {
          nguoidungsession = result;
          // ignore: unnecessary_null_comparison
          if (nguoidungsession != null) {
            islogin = true;
            token = nguoidungsession!.token!;
            nguoidungsessionView = nguoidungsession!;
            tokenview = token;
            _isLoged = true;
            ischeckurl = true;
          } else {}
        });

        if (_isLoged)
          yield LogedSate();
        else {
          ischeckurl = false;
          yield AuthErrorState();
        }
      }

      if (event is LogoutEvent) {
        nguoidungsessionView=Null as NguoiDungItem;
        tokenview = '';
        _isLoged = false;
        yield AuthLogoutSate();
      }
    } catch (e) {}
  }
}
