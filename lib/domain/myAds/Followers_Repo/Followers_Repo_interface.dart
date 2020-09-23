
import 'package:black_whales/core/Api_utils.dart';
import 'package:black_whales/domain/myAds/Followers_Repo/Followers_Repo.dart';

class FollowersRepo implements IFollowersRepo{

  NetWork _netWork = NetWork();

  @override
  Future getFollowers()async {
 return await  _netWork.getData(
      url: "https://websitte.black-whales.com/api/getMyFollowers",
      headers: [{
        "Accept" : "application/json",
        "Content-Type" : "application/json",
        "Authorization" : "Bearer C3YflEn2xekr7jf1yG2ueE6IbwwirDIt6ea4GOThkHEuLOWQ8giTxnzJUghY"
      }]
    );

  }

}