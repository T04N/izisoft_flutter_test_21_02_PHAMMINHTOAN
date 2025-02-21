  import 'package:dio/dio.dart';
import 'package:izisoft_test/data/responses/campaign_detail_response.dart';
import 'package:izisoft_test/data/responses/user_reponse.dart';
  import 'package:retrofit/error_logger.dart';
  import 'package:retrofit/http.dart';
  import '../../../utils/constant/url.dart';

  part 'app_api.g.dart';
  @RestApi(baseUrl: Constant.baseUrl )
  abstract class AppServiceClient {
    factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

    @GET("campaigns")
    Future<List<CampaignResponse>> getCampaignsList();

    @GET("users/{id}")
    Future<UserResponse> getUserById(@Path("id") String id);
    @GET("campaigns/{id}")
    Future<CampaignResponse> getCampaignById(@Path("id") String id);

  }