
import 'package:black_whales/domain/myAds/Favourite_Repo/Favourite_Repo.dart';
import 'package:black_whales/domain/myAds/Followers_Repo/Followers_Repo_interface.dart';
import 'package:black_whales/domain/myAds/privacyPolicyRepo/privacy_policy_repo_inter.dart';
import 'package:black_whales/domain/myAds/profileRepo/my_profile_Repo_interface.dart';
import 'package:black_whales/persentation/introdustion/splash_page.dart';
import 'package:black_whales/persentation/profileScreens/state/store/Favourite_Store/Favourite_Store.dart';
import 'package:black_whales/persentation/profileScreens/state/store/Followers_Store/Followers_Store.dart';
import 'package:black_whales/persentation/profileScreens/state/store/myAdsStore.dart';
import 'package:black_whales/persentation/profileScreens/state/store/my_profile_store/my_profile_store.dart';
import 'package:black_whales/persentation/profileScreens/state/store/privacy_policystore/privacy_policy_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:flutter/scheduler.dart';
import 'domain/myAds/Favourite_Repo/Favourite_Repo_interface.dart';
import 'domain/myAds/myAds_repo_inter.dart';



void main() => runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change patch to your
          // fallbackLocale: Locale('en', 'US'),
          startLocale: Locale('en'),
          child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Injector(
      inject: [
        Inject(()=> MyAdsStore(MyAdsRepo())),
        Inject(()=>PrivacyPolicyStore(IPrivacyPolicyRepo())),
        Inject(()=>MyProfileStore(IMyProfileRepo())),
        Inject(()=>FollowersStore(FollowersRepo())),
        Inject(()=>FavouriteStore(IFavouriteRepo())),
      ],
      builder: ( context){
        return ThemeProvider(
          saveThemesOnChange: true,
          loadThemeOnInit: false,
          onInitCallback: (controller, previouslySavedThemeFuture) async {
            String savedTheme = await previouslySavedThemeFuture;
            if (savedTheme != null) {
              controller.setTheme(savedTheme);
            } else {
              Brightness platformBrightness =
                  SchedulerBinding.instance.window.platformBrightness;
              if (platformBrightness == Brightness.dark) {
                controller.setTheme('dark');
              } else {
                controller.setTheme('light');
              }
              controller.forgetSavedTheme();
            }
          },
          themes: <AppTheme>[
            AppTheme.light(id: 'light'),
            AppTheme.dark(id: 'dark'),
          ],
          child: ThemeConsumer(
            child: Builder(
              builder: (themeContext) => MaterialApp(
                theme: ThemeProvider.themeOf(themeContext).data,
                title: 'Material App',
                home: SplashPage(),
              ),
            ),
          ),
        );
      },

    );
  }
}
