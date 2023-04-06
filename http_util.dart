import '../../dialog_flowtter.dart';

/// The DialogFlowtter http util
class HttpUtil {
  /// Returns the body of the http request filtering the null params
  Map<String, dynamic> getBody({
    QueryParameters? queryParams,
    QueryInput? queryInput,
    OutputAudioConfig? audioConfig,
  }) {
    Map<String, dynamic> body = {};
    if (queryParams != null) {
      body['queryParams'] = queryParams.toJson();
    }
    if (queryInput != null) {
      body['queryInput'] = queryInput.toJson();
    }
    if (audioConfig != null) {
      body['outputAudioConfig'] = audioConfig.toJson();
    }
    return body;
  }

  /// Returns the formated session URI

  static String getFormattedSession({
    required String? projectId,
    required String? sessionId,
    required String? regionId,
    required String? agentId,
  }) {
    return 'https://$regionId-dialogflow.googleapis.com/v3/projects/$projectId/locations/$regionId/agents/$agentId/sessions/$sessionId:detectIntent';
  }

  /// Verifies if the response is valid and successful
  static bool isValidStatusCode(int code) {
    if (code != 200 && code != 201 && code != 202 && code != 206) {
      return false;
    }
    return true;
  }
}
