class LessonsModel {
  final String id;
  final String title;
  final String desc;
  final String videoUrl;
  final int duration;
  final List<Resource> resources;
  final bool isPreview;
  final bool isLocked;
  final bool isCompleted;

  const LessonsModel({
    required this.id,
    required this.title,
    required this.desc,
    required this.videoUrl,
    required this.duration,
    required this.resources,
    this.isPreview = false,
    this.isLocked = true,
    this.isCompleted = false,
  });

  factory LessonsModel.fromMap(Map<String, dynamic> map) {
    return LessonsModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      videoUrl: map['videoUrl'] ?? '',
      duration: map['duration'] ?? 0,
      resources: (map['resources'] as List? ?? [])
          .map((resource) => Resource.fromMap(resource))
          .toList(),
      isPreview: map['isPreview'] ?? false,
      isLocked: map['isLocked'] ?? true,
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'videoUrl': videoUrl,
      'duration': duration,
      'resources': resources.map((resource) => resource.toMap()).toList(),
      'isPreview': isPreview,
      'isLocked': isLocked,
      'isCompleted': isCompleted,
    };
  }

  LessonsModel copyWith({
    String? id,
    String? title,
    String? desc,
    String? videoUrl,
    int? duration,
    List<Resource>? resources,
    bool? isPreview,
    bool? isLocked,
    bool? isCompleted,
  }) {
    return LessonsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      desc: desc ?? this.desc,
      videoUrl: videoUrl ?? this.videoUrl,
      duration: duration ?? this.duration,
      resources: resources ?? this.resources,
      isPreview: isPreview ?? this.isPreview,
      isLocked: isLocked ?? this.isLocked,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  String get videoStreamUrl {
    return videoUrl;
  }
}

class Resource {
  final String id;
  final String title;
  final String type;
  final String url;

  const Resource({
    required this.id,
    required this.title,
    required this.type,
    required this.url,
  });

  factory Resource.fromMap(Map<String, dynamic> map) {
    return Resource(
      id: map['id'],
      title: map['title'],
      type: map['type'],
      url: map['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'type': type, 'url': url};
  }
}
