import 'package:izisoft_test/data/repositories/campain/campaign_repository.dart';
import 'package:izisoft_test/data/repositories/user/user_repository.dart';

import 'authentication/auth_repository.dart';

class RepositoryManager {
  static UserRepository get userRepository => UserRepository();
  static CampaignRepository get campaignsRepository => CampaignRepository();
}