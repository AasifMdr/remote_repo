import '../data_source/local/local_datasource.dart';
import '../data_source/remote/remote_datasource.dart';
import '../model/user.dart';

//takes decision whether to take from local storage or remote storage
class UserRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  UserRepository(this.localDataSource, this.remoteDataSource);

  bool hasNetwork = true;
  bool addUser(User user) {
    bool isAdded = false;
    if (hasNetwork) {
      isAdded = remoteDataSource.addUser(user);
    } else {
      isAdded = localDataSource.addUser(user);
    }
    return isAdded;
  }

  List<User> getUser() {
    if (hasNetwork) {
      return remoteDataSource.getUser();
    } else {
      return localDataSource.getUser();
    }
  }
}
