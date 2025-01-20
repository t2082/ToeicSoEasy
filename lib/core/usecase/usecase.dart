abstract class UseCase<Type, Params> { // Lớp trừu tượng Genegic Type: Result, Params: Params Kiểu Genegic
  Future<Type> call({Params params}); // Chức năng call để implement gọi ra thực thi
}