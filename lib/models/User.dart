class User {
  final String id;
  final String collectionId;
  final String collectionName;
  final String username;
  final bool verified;
  final bool emailVisibility;
  final String email;
  final DateTime created;
  final DateTime updated;

  User({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.username,
    required this.verified,
    required this.emailVisibility,
    required this.email,
    required this.created,
    required this.updated,
  });

  // Factory constructor to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      collectionId: json['collectionId'] ?? '',
      collectionName: json['collectionName'] ?? '',
      username: json['username'] ?? '',
      verified: json['verified'] ?? false,
      emailVisibility: json['emailVisibility'] ?? false,
      email: json['email'] ?? '',
      created: json['created'] != null
          ? DateTime.parse(json['created'])
          : DateTime.now(),
      updated: json['updated'] != null
          ? DateTime.parse(json['updated'])
          : DateTime.now(),
    );
  }

  // Factory constructor to create a User with default values
  factory User.defaultUser() {
    return User(
      id: '',
      collectionId: '',
      collectionName: '',
      username: '',
      verified: false,
      emailVisibility: true,
      email: '',
      created: DateTime.now(),
      updated: DateTime.now(),
    );
  }

  // Method to convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'collectionId': collectionId,
      'collectionName': collectionName,
      'username': username,
      'verified': verified,
      'emailVisibility': emailVisibility,
      'email': email,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
    };
  }

  // Copy with method to create a new User with some updated fields
  User copyWith({
    String? id,
    String? collectionId,
    String? collectionName,
    String? username,
    bool? verified,
    bool? emailVisibility,
    String? email,
    DateTime? created,
    DateTime? updated,
  }) {
    return User(
      id: id ?? this.id,
      collectionId: collectionId ?? this.collectionId,
      collectionName: collectionName ?? this.collectionName,
      username: username ?? this.username,
      verified: verified ?? this.verified,
      emailVisibility: emailVisibility ?? this.emailVisibility,
      email: email ?? this.email,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, verified: $verified)';
  }
}
