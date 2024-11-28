import 'package:dio/dio.dart';
import 'package:films_app/data/films_model/films_model.dart';

class ApiService {

  static const String token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwOWY1ODExYzcyYWYwNmUyNjc3YmIwM2U2ZDIzZmU2MyIsIm5iZiI6MTczMjI1NTIzNC42MDM1Nzc5LCJzdWIiOiI2NGU5ZTU3MGU4OTRhNjAxMWVmODkwY2IiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.XJVkPk_HWKYh1NAgSEammPR7_-IFT7k9HglzcTCnpl0";

  Future<List<FilmsModel>> getDataFromApi({String? request, int page=1}) async {

    final Dio dio = Dio();
    final url = 'https://api.themoviedb.org/3/movie/$request?language=en-US&page=$page';

    try {
      dio.options.headers = {
        "Authorization" : "Bearer $token",
      };

      final response = await dio.get(url);
      print("Response ${response.data}");
      if (response.statusCode == 200){
        final List<FilmsModel> data = [];
        data.add(FilmsModel.fromJson(response.data));
        return data;
      } else {
        print("Status code: ${response.statusCode}");
      }
     } on DioException catch (error) {
      print("Catchda ushlangan xatolik: ${error.message}");
    }
    return [];
  }

  getFilmVideo(int filmId) async {
    final Dio dio = Dio();

    String url = 'https://api.themoviedb.org/3/movie/$filmId/videos?language=en-US';

    try {
      dio.options.headers = {
        "Authorization" : "Bearer $token",
        "accept" : "application/json"
      };

      final Response response = await dio.get(url);
      if (response.statusCode == 200) {
        return response.data['results'][0]['key'];
      }  else {
        print("Status code: ${response.statusCode}");
      }
    } catch (e, r) {
      print("Catchda xatolik: $e\nR: $r");
    }
  }
}