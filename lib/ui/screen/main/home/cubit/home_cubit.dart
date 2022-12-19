import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jig/data/enum/enum_test_status.dart';
import 'package:jig/data/model/product_type_filter/product_type_filter.dart';
import 'package:jig/data/model/question/question_model.dart';
import 'package:jig/data/model/response/get_product_response.dart';
import 'package:jig/data/model/result/result_model.dart';
import 'package:jig/ui/screen/main/home/cubit/home_state.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jig/ui/screen/main/test/bluetooth/bluetooth.dart';
import 'package:jig/ui/screen/main/test/bluetooth_mac/bluetooth_mac.dart';
import 'package:jig/ui/screen/main/test/calib_power/calib_power.dart';
import 'package:jig/ui/screen/main/test/calib_power_last/calib_power_last.dart';
import 'package:jig/ui/screen/main/test/info_device/info_device.dart';
import 'package:jig/ui/screen/main/test/ir/ir_write_read.dart';
import 'package:jig/ui/screen/main/test/status_button/status_button.dart';
import 'package:jig/ui/screen/main/test/status_led/status_led.dart';
import 'package:jig/ui/screen/main/test/voice/voice.dart';
import 'package:jig/ui/screen/main/test/write_barcode/write_barcode.dart';
import 'package:jig/ui/services/graphql_strings.dart' as graphql_endpoint;
import 'package:jig/ui/theme/constant.dart';
import 'package:sp_util/sp_util.dart';

// import '..services/graphql_strings.dart' as gql_string;
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  late GraphQLClient qlClient;
  late List<ResultModel> results;
  void initCubit() {
    emit(state.copyWith(isLoading: true));
    initData();

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
    emit(state.copyWith(isLoading: false));
  }

  void initData() {
    results = [
      ResultModel(result: "Model ", title: "Model:", status: true),
      ResultModel(
          result: "Firmwave version ",
          title: "Firmware version:",
          status: true),
      ResultModel(
          result: "Serial Code:", title: "Firmware version:", status: true),
      ResultModel(
          result: "FAIL",
          title: "Kết nối bluetooth, Wifi:",
          status: true,
          colorResult: primaryColor3),
      ResultModel(
          result: "FAIL",
          title: "Thu phát hồng ngoại:",
          status: true,
          colorResult: primaryColor3),
      ResultModel(
          result: "FAIL",
          title: "Calib công suât:",
          status: true,
          colorResult: primaryColor3),
      ResultModel(
          result: "FAIL",
          title: "Calib công suất sau hiệu chỉnh:",
          status: true,
          colorResult: primaryColor3),
      ResultModel(
          result: "FAIL",
          title: "Trạng thái đèn LED:",
          status: true,
          colorResult: primaryColor3),
      ResultModel(
          result: "FAIL",
          title: "Trạng thái đèn nút bấm:",
          status: true,
          colorResult: primaryColor3),
      ResultModel(
          result: "FAIL",
          title: "Bluetooth MAC:",
          status: true,
          colorResult: primaryColor3),
    ];
    emit(state.copyWith(results: results, listQuestion: [
      Question(
        title: "Test 1",
        child: InfoDeviceScreen(
          onPress: (value) {
            results[0] = results[0].copyWith(
                result: "Model +${value.display()}",
                colorResult: value.color());
          },
        ),
        resultStatus: ResultStatus.fail,
        status: SelectTestStatus.selected,
      ),
      Question(
          title: "Test 2",
          child: WriteBarcodeScreen(
            onPress: (value) {
              results[1] = results[1].copyWith(
                  result: "Firmwave version +${value.display()}",
                  colorResult: value.color());
            },
          ),
          resultStatus: ResultStatus.pass,
          status: SelectTestStatus.selected),
      Question(
          title: "Test 3",
          child: BluetoothScreen(
            onPress: (value) {
              results[2] = results[2].copyWith(
                  result: "Serial Code +${value.display()}",
                  colorResult: value.color());
            },
          ),
          resultStatus: ResultStatus.pass,
          status: SelectTestStatus.selected),
      Question(
          title: "Test 4",
          child: IrWriteReadScreen(
            onPress: (value) {
              results[3] = results[3].copyWith(
                  result: value.display(), colorResult: value.color());
            },
          ),
          resultStatus: ResultStatus.pass,
          status: SelectTestStatus.selected),
      Question(
          title: "Test 5",
          child: CalibPowerScreen(
            onPress: (value) {
              results[4] = results[4].copyWith(
                  result: value.display(), colorResult: value.color());
            },
          ),
          status: SelectTestStatus.select),
      Question(
          title: "Test 6",
          child: CalibPowerLastScreen(
            onPress: (value) {
              results[5] = results[5].copyWith(
                  result: value.display(), colorResult: value.color());
            },
          ),
          status: SelectTestStatus.notSelect),
      Question(
          title: "Test 7",
          child: StatusLedScreen(
            onPress: (value) {
              results[6] = results[6].copyWith(
                  result: value.display(), colorResult: value.color());
            },
          ),
          status: SelectTestStatus.notSelect),
      Question(
          title: "Test 8",
          child: StatusButtonScreen(
            onPress: (value) {
              results[7] = results[7].copyWith(
                  result: value.display(), colorResult: value.color());
            },
          ),
          status: SelectTestStatus.notSelect),
      Question(
          title: "Test 9",
          child: VoiceScreen(
            onPress: (value) {
              results[8] = results[8].copyWith(
                  result: value.display(), colorResult: value.color());
            },
          ),
          status: SelectTestStatus.notSelect),
      Question(
          title: "Test 10",
          child: BluetoothMacScreen(
            onPress: (value) {
              results[9] = results[9].copyWith(
                  result: value.display(), colorResult: value.color());
            },
          ),
          status: SelectTestStatus.notSelect),
    ]));
  }

  void getResult() {
    emit(state.copyWith(results: results));
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
