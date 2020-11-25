import 'package:chopper/chopper.dart';
part 'test_service.chopper.dart';

@ChopperApi(baseUrl: '/Api')
abstract class TestService extends ChopperService {
  @Post(path: '/getBranch',headers: {'Authorization': '4ccda7514adc0f13595a585205fb9761'})
  Future<Response> getBranches(@Path() @Body() Map<dynamic, dynamic> data);

  @Post(path: '/CreateBranch',headers: {'Authorization': '4ccda7514adc0f13595a585205fb9761'})
  Future<Response> createBranches(@Path() @Body() Map<dynamic, dynamic> data);


  static TestService create() {
    final client = ChopperClient(
        baseUrl: 'https://www.brandx.koffeekodes.com/',
        services: [_$TestService()],
        converter: JsonConverter());
    return _$TestService(client);
  }
}
