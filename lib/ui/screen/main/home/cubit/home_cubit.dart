import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/model/product_type_filter/product_type_filter.dart';
import 'package:jig/data/model/response/get_product_response.dart';
import 'package:jig/ui/screen/main/home/cubit/home_state.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jig/ui/services/account_services.dart';
import 'package:jig/ui/services/graphql_strings.dart' as graphql_endpoint;
import 'package:sp_util/sp_util.dart';

// import '..services/graphql_strings.dart' as gql_string;
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  late GraphQLClient qlClient;

  void initCubit() {
    Map<String, String> headers = <String, String>{};
    //String token = await AccountServices().getUserToken();
    String? token = SpUtil.getString("userToken", defValue: "");
    headers['Authorization'] = 'Bearer $token';
    HttpLink link = HttpLink("https://stg-kshop-api.karofi.com/graphql",
        defaultHeaders: headers); // it's my url
    qlClient = GraphQLClient(
      // craete a graphql client
      link: link,
      cache: GraphQLCache(
          // store: HiveStore(),
          ),
    );
  }

  Future<ProductGetTypes?> createUser() async {
    ProductTypeFilter filter = ProductTypeFilter();
    // AccountServices// ignore , just for cacheing
    QueryResult queryResult = await qlClient.mutate(
      // use mutate method for mutation
      MutationOptions(
          // we use mutation options
          fetchPolicy: FetchPolicy
              .networkOnly, // you can use different policy as per your need
          document: gql(
            graphql_endpoint.getProductList, // as tou graphql need query string
          ),
          variables: filter.toJson()),
    );
    final ProductGetTypes response =
        ProductGetTypes.fromJson(queryResult.data?["productGetTypes"]);
    return response; // queryResult.data contains response data here after creation my api return true
    //  and if it's null then i am return false
  }
}
