import 'package:black_whales/core/Api_utils.dart';
import 'package:black_whales/domain/myAds/Favourite_Repo/Favourite_Repo.dart';

class IFavouriteRepo implements FavouriteRepo{

  NetWork _netWork = NetWork();

  @override
  Future getFavourite() async {
    return await _netWork.getData(
      url: "https://websitte.black-whales.com/api/getMyLoveAdv",
      headers: [{
        "Accept" : "application/json",
        "Content-Type" : "application/json",
        "Authorization" : "Bearer Cv7KcMrPwpnlmKIvWQIUyN56DgQrynRySILY9tlf6KANuJmOqhdI0Z5gYVf8"
      }]
    );
  }

}