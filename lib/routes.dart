import 'package:fasty/Core/Constant/routes_names.dart';
import 'package:fasty/View/Screens/account/orders/archived_orders.dart';
import 'package:fasty/View/Screens/account/orders/current_orders.dart';
import 'package:fasty/View/Screens/account/orders/order_details.dart';
import 'package:fasty/View/Screens/account/profile/addresses.dart';
import 'package:fasty/View/Screens/account/profile/change_password.dart';
import 'package:fasty/View/Screens/account/profile/edit_login.dart';
import 'package:fasty/View/Screens/account/profile/edit_name.dart';
import 'package:fasty/View/Screens/account/profile/profile.dart';
import 'package:fasty/View/Screens/account/questions.dart';
import 'package:fasty/View/Screens/account/reviews.dart';
import 'package:fasty/View/Screens/auth/emailotp.dart';
import 'package:fasty/View/Screens/auth/enter-information.dart';
import 'package:fasty/View/Screens/home/cart.dart';
import 'package:fasty/View/Screens/account/orders/checkout.dart';
import 'package:fasty/View/Screens/home/home.dart';
import 'package:fasty/View/Screens/home/item_information.dart';
import 'package:fasty/View/Screens/home/notifications.dart';
import 'package:fasty/View/Screens/home/onboarding.dart';
import 'package:fasty/View/Screens/auth/phoneotp.dart';
import 'package:fasty/View/Screens/auth/reset_password_two.dart';
import 'package:fasty/View/Screens/auth/reset_password.dart';
import 'package:fasty/View/Screens/auth/signin.dart';
import 'package:fasty/View/Screens/auth/signup.dart';
import 'package:fasty/View/Screens/success.dart';
import 'package:fasty/middleware.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const OnBoarding(), middlewares: [
    MiddleWare()
  ]),
        GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
        GetPage(name: AppRoutes.login, page: () =>  const LogIn()),
        GetPage(name: AppRoutes.signup, page: () => const SignUp()),
        GetPage(name: AppRoutes.phoneOtp, page: () => const PhoneVerification(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.emailOtp, page: () => const EmailVerification(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.enterInformation, page: () => const EnterInformation(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.success, page: () => const Success()),
        GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.resetPasswordTwo, page: () => const ResetPasswordTwo(), transition: Transition.rightToLeft),

        GetPage(name: AppRoutes.home, page: () => const Home(), arguments: null),
        GetPage(name: AppRoutes.itemInformation, page: () => const ItemInformation(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.cart, page: () => const Cart(), transition: Transition.rightToLeft),

        GetPage(name: AppRoutes.profile, page: () => const Profile(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.changeName, page: () => const EditName(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.changeLogin, page: () => const EditLogin(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.changePassword, page: () => const ChangePassword(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.addresses, page: () => const Addresses(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.questions, page: () => const Questions(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.currentOrders, page: () => const CurrentOrders(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.archivedOrders, page: () => const ArchivedOrders(), transition: Transition.rightToLeft),
        GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails(), transition: Transition.rightToLeft),
        
        GetPage(name: AppRoutes.reviews, page: () => const Reviews(), transition: Transition.rightToLeft),

        GetPage(name: AppRoutes.notifications, page: () => const Notifications(), transition: Transition.rightToLeft),

        GetPage(name: AppRoutes.checkout, page: () => const Checkout(), transition: Transition.rightToLeft),
        
   
];
  

