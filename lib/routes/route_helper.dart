import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rewards_rush/pages/generate_url_page.dart';
import 'package:rewards_rush/pages/welcome_page.dart';

class RouteHelper{
  static const String splashPage ="/splash-page";
  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String generateUrl ="/generate-url";

  static String getSplashPage() =>'$splashPage';
  static String getInitial() =>'$initial';
  static String getPopularFood(int pageId, String page) =>'$popularFood?pageId=$pageId&page=$page';// passing data to next page
  static String getGenerateUrl() =>'$generateUrl';

  static List<GetPage> routes = [

    //splash screen
    GetPage(name: splashPage, page: ()=>WelcomePage()),
    GetPage(name: generateUrl, page: ()=>GenerateUrlPage()),

    //Welcome Page
    //GetPage(name: initial, page: ()=>MainFoodPage()),
    // GetPage(name: initial, page: (){
    //   return HomePage();
    // },
    //   transition: Transition.rightToLeft,
    //   transitionDuration:  Duration(milliseconds: 500), // half a second
    // ),



  ];
}