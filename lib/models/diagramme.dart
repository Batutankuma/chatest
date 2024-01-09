class CompteModel {
  final String uid;
  final String name;
  final String email;
  final String created_at;

  CompteModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.created_at});

  factory CompteModel.from(data) {
    return CompteModel(
        uid: data['id'],
        name: data['name'],
        email: data['email'],
        created_at: data['created_at']);
  }

  static List<CompteModel> listcompte(data) {
    return data.map<CompteModel>((e) => CompteModel.from(e)).toList();
  }
}
