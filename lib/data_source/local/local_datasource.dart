import '../../model/user.dart';

class LocalDataSource {
  List<User> users = [
    User(id: 1, name: "Local abc", dob: "10/10/2020", birthTime: "22:12"),
    User(id: 2, name: "Local def", dob: "10/10/2020", birthTime: "22:12"),
  ];

  bool addUser(User users) {
    this.users.add(users);
    return true;
  }

  List<User> getUser() {
    return users;
  }
}
