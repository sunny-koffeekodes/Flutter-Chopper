// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$TestService extends TestService {
  _$TestService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = TestService;

  Future<Response> getBranches(Map data) {
    final $url = '/Api/getBranch';
    final $headers = {'Authorization': '4ccda7514adc0f13595a585205fb9761'};
    final $body = data;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> createBranches(Map data) {
    final $url = '/Api/CreateBranch';
    final $headers = {'Authorization': '4ccda7514adc0f13595a585205fb9761'};
    final $body = data;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
