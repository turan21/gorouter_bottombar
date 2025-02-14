class User {
  final String id;
  final String name;
  final int age;
  final double salary;
  final int taxClass;
  final double? ieltsScore;

  User(
      {required this.id,
      required this.name,
      required this.age,
      required this.salary,
      this.ieltsScore,
      this.taxClass = 0});

  void displayName() {
    print(name);
  }

  double getNetSalary() {
    switch (taxClass) {
      case 0:
        return salary * 0.9;
      case 1:
        return salary * 0.85;
      case 2:
        return salary * 0.7;
      case 3:
        return salary * 0.65;
      default:
        return salary;
    }
  }
}
