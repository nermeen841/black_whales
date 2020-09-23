
import 'package:black_whales/core/Api_utils.dart';
import 'package:black_whales/domain/myAds/privacyPolicyRepo/privacy_policy_repo.dart';

class IPrivacyPolicyRepo implements PrivacyPolicyRepo{

  NetWork _netWork = NetWork();

  @override
  Future getPrivacyPolicy() {
    return _netWork.getData(
      url: "https://websitte.black-whales.com/api/setting",
      headers: [{
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip, deflate, br",
        "Connection" : "keep-alive"
      }]
    );

  }

}