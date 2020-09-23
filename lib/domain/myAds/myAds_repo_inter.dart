import 'package:black_whales/core/Api_utils.dart';
import 'package:black_whales/domain/myAds/myAdsrepo.dart';

class MyAdsRepo implements IMyAdsRepo {

   NetWork _netWork = NetWork();
  @override
  Future getMyAds() async {
   return _netWork.getData(
     url: "https://websitte.black-whales.com/api/myAdvs",
     headers: [{
       "Accept" : "application/json",
       "Content-Type" : "application/json",
       "Authorization" : "Bearer C3YflEn2xekr7jf1yG2ueE6IbwwirDIt6ea4GOThkHEuLOWQ8giTxnzJUghY"

     }],
   );
  }
}


