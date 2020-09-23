
import 'package:black_whales/core/Api_utils.dart';
import 'package:black_whales/domain/myAds/profileRepo/my_profile_repo.dart';

class IMyProfileRepo implements MyProfileRepo{
  NetWork _netWork = NetWork();

  @override
  Future getMyProfile() {
    return _netWork.getData(
      url: "https://websitte.black-whales.com/api/profile",
      headers: [{
    "Connection" : "keep-alive",
        "Accept" : "application/json",
        "Content-Type" : "application/json",
        "Authorization" : "Bearer C3YflEn2xekr7jf1yG2ueE6IbwwirDIt6ea4GOThkHEuLOWQ8giTxnzJUghY"
      }]
    );
  }

}