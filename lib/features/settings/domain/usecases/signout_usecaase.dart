import 'package:astrology/core/usecase/usecase.dart';
import 'package:astrology/features/settings/domain/repositories/settings_repository.dart';
import '../../../../core/network/net_result.dart';

class SignOutUseCase implements UseCase<Result, void> {
  final SettingRepository _settingRepository;

  SignOutUseCase(SettingRepository settingRepository)
      : _settingRepository = settingRepository;
  @override
  Future<Result> call({void params}) async {
    return await _settingRepository.signOut();
  }
}
