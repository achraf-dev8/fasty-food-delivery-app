class ApiLinks{
   //static const String server = "http://10.0.2.2/fasty";
   
   static const String server = "http://172.20.10.5/fasty";
   
   static const String authLink = "$server/auth";
   
   static const String verifyloginLink = "$authLink/verify_login.php";

   static const String forgetPasswordLink = "$authLink/forget_password.php";

   static const String logInLink = "$authLink/login.php";

   static const String resetPasswordLink = "$authLink/reset_password.php";

   static const String signupLink = "$authLink/signup.php";

   static const String sendPhoneLink = "$authLink/send_phone_otp.php";

   static const String sendEmailLink = "$authLink/send_email_otp.php";

   static const String homeLink = "$server/home";

   static const String allDataLink = "$homeLink/alldata.php";

   static const String changeFavoriteLink = "$homeLink/favorite.php";

   static const String notificationsLink = "$homeLink/notifications.php";

   
   static const String cartLink = "$server/cart";

   static const String addCartLink = "$cartLink/add_cart.php";

   static const String deleteCartLink = "$cartLink/delete_cart.php";

   static const String updateCartLink = "$cartLink/update_cart.php";

   static const String noCartLink = "$cartLink/no_cart.php";


   static const String reviewLink = "$server/reviews";

   static const String showReviewsLink = "$reviewLink/show_reviews.php";

   static const String addReviewLink = "$reviewLink/add_review.php";

   static const String deleteReviewLink = "$reviewLink/delete_review.php";

   static const String editReviewLink = "$reviewLink/edit_review.php";


   static const String profileLink = "$server/profile";

   static const String editNameLink = "$profileLink/edit_name.php";

   static const String editLoginLink = "$profileLink/edit_login.php";


   static const String addressLink = "$profileLink/address";

   static const String addAddressLink = "$addressLink/add_address.php";

   static const String deleteAddressLink = "$addressLink/delete_address.php";

   static const String updateAddressLink = "$addressLink/update_address.php";

   static const String primaryAddressLink = "$addressLink/primary_address.php";


   static const String orderLink = "$server/orders";

   static const String addOrderLink = "$orderLink/add_order.php";

   static const String cancelOrderLink = "$orderLink/cancel_order.php";

   static const String orderDetailsLink = "$orderLink/order_details.php";

   static const String showArchivedLink = "$orderLink/show_archived.php";

   static const String showCurrentLink = "$orderLink/show_current.php";



  static const String upload = "$server/upload";

   static const String offersUploadLink = "$upload/offers";

   static const String itemsUploadLink = "$upload/items";





}