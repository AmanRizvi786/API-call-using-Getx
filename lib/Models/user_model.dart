class UserModel {
  final String login;
  final int id;
  final String avatarUrl;

  UserModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      login: json['login'],
      id: json['id'],
      avatarUrl: json['avatar_url'],
    );
  }
}
