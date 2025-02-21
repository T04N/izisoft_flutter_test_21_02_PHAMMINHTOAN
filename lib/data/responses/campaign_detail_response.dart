class CampaignResponse {
  final int startTime;
  final int endTime;
  final String thumbnail;
  final int amountTarget;
  final int currentAmount;
  final Author author;
  final String title;
  final List<Backer> backers;
  final String id;

  CampaignResponse({
    required this.startTime,
    required this.endTime,
    required this.thumbnail,
    required this.amountTarget,
    required this.currentAmount,
    required this.author,
    required this.title,
    required this.backers,
    required this.id,
  });

  factory CampaignResponse.fromJson(Map<String, dynamic> json) {
    return CampaignResponse(
      startTime: json['startTime'],
      endTime: json['endTime'],
      thumbnail: json['thumbnail'],
      amountTarget: json['amount_target'],
      currentAmount: json['current_amount'],
      author: Author.fromJson(json['author']),
      title: json['title'],
      backers: (json['backers'] as List).map((e) => Backer.fromJson(e)).toList(),
      id: json['id'],
    );
  }
}

class Author {
  final String email;
  final String name;
  final String avatar;
  final String gender;
  final String describe;
  final String job;
  final String id;

  Author({
    required this.email,
    required this.name,
    required this.avatar,
    required this.gender,
    required this.describe,
    required this.job,
    required this.id,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      gender: json['gender'],
      describe: json['describe'],
      job: json['job'],
      id: json['id'],
    );
  }
}

class Backer {
  final String email;
  final String name;
  final String avatar;
  final String gender;
  final String describe;
  final String job;
  final String id;

  Backer({
    required this.email,
    required this.name,
    required this.avatar,
    required this.gender,
    required this.describe,
    required this.job,
    required this.id,
  });

  factory Backer.fromJson(Map<String, dynamic> json) {
    return Backer(
      email: json['email'],
      name: json['name'],
      avatar: json['avatar'],
      gender: json['gender'],
      describe: json['describe'],
      job: json['job'],
      id: json['id'],
    );
  }
}