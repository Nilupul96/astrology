import 'package:astrology/features/settings/data/datasources/setting_service.dart';
import 'package:astrology/features/settings/domain/repositories/settings_repository.dart';

import '../../../../core/network/net_result.dart';

class SettingRepositoryImpl implements SettingRepository {
  final SettingService _settingService;

  SettingRepositoryImpl(SettingService settingService)
      : _settingService = settingService;
  @override
  Future<Result> signOut() async {
    return await _settingService.signOut();
  }
}
