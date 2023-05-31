import '../../model/user.dart';

// api implementaiton
class RemoteDataSource {
  List<User> users = [
    User(id: 1, name: "Remote lmn", dob: "10/10/2020", birthTime: "22/12"),
    User(id: 2, name: "Remote pqr", dob: "10/10/2020", birthTime: "22/12"),
    User(id: 3, name: "Remote xyz", dob: "10/10/2020", birthTime: "22/12"),
  ];

  bool addUser(User users) {
    this.users.add(users);
    return true;
  }

  List<User> getUser() {
    return users;
  }
}
