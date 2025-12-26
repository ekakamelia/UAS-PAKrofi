class AppUser {
  final String name;
  final String role;
  final String avatarUrl; // We might use a placeholder asset or network image

  const AppUser({required this.name, required this.role, this.avatarUrl = ''});
}

class Course {
  final String title;
  final double progress; // 0.0 to 1.0

  const Course({required this.title, required this.progress});
}

class Assignment {
  final String courseName;
  final String title;
  final String description;
  final DateTime deadline;
  final String status; // 'Belum Disubmit', 'Disubmit', 'Dinilai'

  const Assignment({
    required this.courseName, 
    required this.title, 
    required this.description,
    required this.deadline,
    this.status = 'Belum Disubmit',
  });
}

class Announcement {
  final String title;
  final String description;
  final DateTime date;

  const Announcement({required this.title, required this.description, required this.date});
}

class DummyData {
  static const AppUser currentUser = AppUser(
    name: 'Camelia',
    role: 'Mahasiswa',
  );

  static const List<Course> courses = [
    Course(title: 'Desain Tampilan & Pengalaman Pengguna (UI/UX)', progress: 0.75),
    Course(title: 'Kewarganegaraan', progress: 0.40),
    Course(title: 'Sistem Operasi', progress: 0.20),
    Course(title: 'Pemrograman Perangkat Bergerak', progress: 0.60),
    Course(title: 'Multimedia', progress: 0.90),
    Course(title: 'Bahasa Inggris: Bisnis dan Ilmiah', progress: 0.50),
    Course(title: 'Pemrograman Multimedia Interaktif', progress: 0.30),
    Course(title: 'Olah Raga', progress: 1.0),
  ];

  static final List<Assignment> upcomingAssignments = [
    Assignment(
      courseName: 'Desain Tampilan & Pengalaman Pengguna',
      title: 'Tugas 01 - UID Android Mobile Game',
      description: 'Buatlah desain antarmuka pengguna (UI) untuk game mobile berbasis Android. Sertakan wireframe dan mockup high-fidelity.',
      deadline: DateTime.now().add(const Duration(days: 2)),
    ),
     Assignment(
      courseName: 'Pemrograman Perangkat Bergerak',
      title: 'Tugas 02 - Layout Flutter',
      description: 'Implementasikan layout dashboard menggunakan Flutter Widget seperti Row, Column, dan Stack.',
      deadline: DateTime.now().add(const Duration(days: 5)),
    ),
  ];

  static final List<Announcement> announcements = [
    Announcement(
      title: 'Info Maintenance Server',
      description: 'Server akan mengalami maintenance pada hari Sabtu pukul 22:00.',
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];
}

class Grade {
  final String courseName;
  final String semester;
  final int sks;
  final String grade; // A, B+, B, C+, C, D, E
  final double gradePoint; // 4.0, 3.5, 3.0, etc.

  const Grade({
    required this.courseName,
    required this.semester,
    required this.sks,
    required this.grade,
    required this.gradePoint,
  });
}

class GradeData {
  static const List<Grade> grades = [
    // Semester 1
    Grade(courseName: 'Algoritma & Pemrograman', semester: 'Semester 1', sks: 3, grade: 'A', gradePoint: 4.0),
    Grade(courseName: 'Matematika Dasar', semester: 'Semester 1', sks: 3, grade: 'B+', gradePoint: 3.5),
    Grade(courseName: 'Fisika Dasar', semester: 'Semester 1', sks: 2, grade: 'A', gradePoint: 4.0),
    Grade(courseName: 'Bahasa Indonesia', semester: 'Semester 1', sks: 2, grade: 'A', gradePoint: 4.0),
    
    // Semester 2
    Grade(courseName: 'Struktur Data', semester: 'Semester 2', sks: 3, grade: 'A', gradePoint: 4.0),
    Grade(courseName: 'Basis Data', semester: 'Semester 2', sks: 3, grade: 'B+', gradePoint: 3.5),
    Grade(courseName: 'Pemrograman Web', semester: 'Semester 2', sks: 3, grade: 'A', gradePoint: 4.0),
    Grade(courseName: 'Statistika', semester: 'Semester 2', sks: 2, grade: 'B', gradePoint: 3.0),
    
    // Semester 3
    Grade(courseName: 'Pemrograman Berorientasi Objek', semester: 'Semester 3', sks: 3, grade: 'A', gradePoint: 4.0),
    Grade(courseName: 'Sistem Operasi', semester: 'Semester 3', sks: 3, grade: 'B+', gradePoint: 3.5),
    Grade(courseName: 'Jaringan Komputer', semester: 'Semester 3', sks: 3, grade: 'A', gradePoint: 4.0),
  ];

  static double calculateIPK() {
    double totalPoints = 0;
    int totalSKS = 0;
    for (var grade in grades) {
      totalPoints += grade.gradePoint * grade.sks;
      totalSKS += grade.sks;
    }
    return totalSKS > 0 ? totalPoints / totalSKS : 0;
  }

  static int get totalSKS {
    int total = 0;
    for (var grade in grades) {
      total += grade.sks;
    }
    return total;
  }

  static List<String> get semesters {
    return grades.map((g) => g.semester).toSet().toList();
  }

  static List<Grade> getGradesBySemester(String semester) {
    return grades.where((g) => g.semester == semester).toList();
  }
}

// Forum Models
class ForumThread {
  final String id;
  final String courseId;
  final String courseName;
  final String title;
  final String author;
  final DateTime createdAt;
  final int replyCount;

  const ForumThread({
    required this.id,
    required this.courseId,
    required this.courseName,
    required this.title,
    required this.author,
    required this.createdAt,
    required this.replyCount,
  });
}

class ForumMessage {
  final String id;
  final String threadId;
  final String author;
  final String content;
  final DateTime createdAt;
  final bool isCurrentUser;

  const ForumMessage({
    required this.id,
    required this.threadId,
    required this.author,
    required this.content,
    required this.createdAt,
    this.isCurrentUser = false,
  });
}

class ForumData {
  static final List<ForumThread> threads = [
    ForumThread(
      id: '1',
      courseId: 'uiux',
      courseName: 'Desain UI/UX',
      title: 'Diskusi: Prinsip Heuristik Nielsen',
      author: 'Dr. Budi Santoso',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      replyCount: 12,
    ),
    ForumThread(
      id: '2',
      courseId: 'mobile',
      courseName: 'Pemrograman Mobile',
      title: 'Tanya: Cara implementasi State Management Flutter',
      author: 'Ahmad Rizki',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      replyCount: 8,
    ),
    ForumThread(
      id: '3',
      courseId: 'os',
      courseName: 'Sistem Operasi',
      title: 'Tugas UTS: Diskusi Algoritma Penjadwalan',
      author: 'Dr. Siti Aminah',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      replyCount: 24,
    ),
  ];

  static final List<ForumMessage> messages = [
    ForumMessage(
      id: 'm1',
      threadId: '1',
      author: 'Dr. Budi Santoso',
      content: 'Selamat pagi semua. Mari kita diskusikan tentang 10 prinsip heuristik Nielsen. Silakan share pemahaman kalian.',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
    ),
    ForumMessage(
      id: 'm2',
      threadId: '1',
      author: 'Dandy Candra Pratama',
      content: 'Selamat pagi Pak. Menurut saya prinsip pertama tentang Visibility of System Status sangat penting karena user harus selalu tahu apa yang sedang terjadi.',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isCurrentUser: true,
    ),
    ForumMessage(
      id: 'm3',
      threadId: '1',
      author: 'Rina Wulandari',
      content: 'Saya setuju dengan Dandy. Contohnya seperti loading indicator saat aplikasi memproses sesuatu.',
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
    ForumMessage(
      id: 'm4',
      threadId: '1',
      author: 'Dr. Budi Santoso',
      content: 'Bagus sekali! Ada yang mau menambahkan contoh lain?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
  ];

  static List<ForumMessage> getMessagesByThread(String threadId) {
    return messages.where((m) => m.threadId == threadId).toList();
  }
}

// Quiz/CBT Models
class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

class Quiz {
  final String id;
  final String title;
  final String courseName;
  final int durationMinutes;
  final List<QuizQuestion> questions;
  final String status; // 'Belum Dikerjakan', 'Sedang Dikerjakan', 'Selesai'

  const Quiz({
    required this.id,
    required this.title,
    required this.courseName,
    required this.durationMinutes,
    required this.questions,
    this.status = 'Belum Dikerjakan',
  });
}

class QuizData {
  static final List<Quiz> quizzes = [
    Quiz(
      id: 'q1',
      title: 'Kuis 1 - Dasar UI/UX',
      courseName: 'Desain UI/UX',
      durationMinutes: 30,
      questions: [
        QuizQuestion(
          id: 'q1_1',
          question: 'Apa kepanjangan dari UI?',
          options: ['User Interface', 'User Interaction', 'User Integration', 'User Information'],
          correctIndex: 0,
        ),
        QuizQuestion(
          id: 'q1_2',
          question: 'Siapa yang menciptakan 10 Heuristic Principles?',
          options: ['Don Norman', 'Jakob Nielsen', 'Steve Jobs', 'Bill Gates'],
          correctIndex: 1,
        ),
        QuizQuestion(
          id: 'q1_3',
          question: 'Apa prinsip pertama dari Heuristic Nielsen?',
          options: ['User Control', 'Visibility of System Status', 'Error Prevention', 'Consistency'],
          correctIndex: 1,
        ),
        QuizQuestion(
          id: 'q1_4',
          question: 'Wireframe adalah...',
          options: ['Desain visual lengkap', 'Kerangka dasar layout', 'Prototype interaktif', 'Dokumen spesifikasi'],
          correctIndex: 1,
        ),
        QuizQuestion(
          id: 'q1_5',
          question: 'Warna yang cocok untuk tombol error/bahaya adalah...',
          options: ['Hijau', 'Biru', 'Merah', 'Kuning'],
          correctIndex: 2,
        ),
      ],
    ),
    Quiz(
      id: 'q2',
      title: 'UTS - Sistem Operasi',
      courseName: 'Sistem Operasi',
      durationMinutes: 60,
      questions: [
        QuizQuestion(
          id: 'q2_1',
          question: 'Kernel adalah...',
          options: ['Program aplikasi', 'Inti sistem operasi', 'Perangkat keras', 'Antivirus'],
          correctIndex: 1,
        ),
        QuizQuestion(
          id: 'q2_2',
          question: 'Algoritma penjadwalan FCFS adalah...',
          options: ['First Come First Serve', 'Fast CPU First Serve', 'First Come Fast Serve', 'Fast Come First Serve'],
          correctIndex: 0,
        ),
      ],
    ),
  ];
}

// Course Material Models
class CourseMaterial {
  final String id;
  final String courseId;
  final String title;
  final String type; // 'pdf', 'video', 'link'
  final String description;
  final String url;

  const CourseMaterial({
    required this.id,
    required this.courseId,
    required this.title,
    required this.type,
    required this.description,
    required this.url,
  });
}

class CourseDetail {
  final String id;
  final String title;
  final String instructor;
  final String description;
  final List<CourseMaterial> materials;
  final double progress;

  const CourseDetail({
    required this.id,
    required this.title,
    required this.instructor,
    required this.description,
    required this.materials,
    required this.progress,
  });
}

class CourseData {
  static final List<CourseDetail> courses = [
    CourseDetail(
      id: 'uiux',
      title: 'Desain Tampilan & Pengalaman Pengguna (UI/UX)',
      instructor: 'Dr. Budi Santoso, M.Kom',
      description: 'Mata kuliah ini membahas prinsip-prinsip desain antarmuka pengguna dan pengalaman pengguna untuk aplikasi digital.',
      progress: 0.75,
      materials: [
        CourseMaterial(id: 'm1', courseId: 'uiux', title: 'Modul 1 - Pengenalan UI/UX', type: 'pdf', description: 'Pengenalan dasar UI/UX', url: ''),
        CourseMaterial(id: 'm2', courseId: 'uiux', title: 'Video - 10 Heuristic Nielsen', type: 'video', description: 'Prinsip heuristik', url: ''),
        CourseMaterial(id: 'm3', courseId: 'uiux', title: 'Modul 2 - Wireframing', type: 'pdf', description: 'Membuat wireframe', url: ''),
        CourseMaterial(id: 'm4', courseId: 'uiux', title: 'Video - Prototyping Figma', type: 'video', description: 'Tutorial Figma', url: ''),
      ],
    ),
    CourseDetail(
      id: 'mobile',
      title: 'Pemrograman Perangkat Bergerak',
      instructor: 'Dr. Siti Aminah, M.T.',
      description: 'Pengembangan aplikasi mobile menggunakan Flutter.',
      progress: 0.60,
      materials: [
        CourseMaterial(id: 'm5', courseId: 'mobile', title: 'Modul 1 - Pengenalan Flutter', type: 'pdf', description: 'Dasar Flutter dan Dart', url: ''),
        CourseMaterial(id: 'm6', courseId: 'mobile', title: 'Video - Widget Basics', type: 'video', description: 'Widget dasar Flutter', url: ''),
      ],
    ),
    CourseDetail(
      id: 'os',
      title: 'Sistem Operasi',
      instructor: 'Prof. Ahmad Yusuf, Ph.D',
      description: 'Konsep dasar sistem operasi, manajemen proses, memori, dan penjadwalan.',
      progress: 0.40,
      materials: [
        CourseMaterial(id: 'm7', courseId: 'os', title: 'Modul 1 - Pengenalan OS', type: 'pdf', description: 'Konsep dasar sistem operasi', url: ''),
        CourseMaterial(id: 'm8', courseId: 'os', title: 'Video - Manajemen Proses', type: 'video', description: 'Penjadwalan CPU', url: ''),
        CourseMaterial(id: 'm9', courseId: 'os', title: 'Modul 2 - Manajemen Memori', type: 'pdf', description: 'Virtual memory dan paging', url: ''),
      ],
    ),
    CourseDetail(
      id: 'db',
      title: 'Basis Data',
      instructor: 'Dr. Rina Wulandari, M.Kom',
      description: 'Perancangan dan implementasi basis data relasional dengan SQL.',
      progress: 0.85,
      materials: [
        CourseMaterial(id: 'm10', courseId: 'db', title: 'Modul 1 - ERD', type: 'pdf', description: 'Entity Relationship Diagram', url: ''),
        CourseMaterial(id: 'm11', courseId: 'db', title: 'Video - SQL Dasar', type: 'video', description: 'SELECT, INSERT, UPDATE, DELETE', url: ''),
        CourseMaterial(id: 'm12', courseId: 'db', title: 'Modul 2 - Normalisasi', type: 'pdf', description: '1NF, 2NF, 3NF', url: ''),
      ],
    ),
    CourseDetail(
      id: 'network',
      title: 'Jaringan Komputer',
      instructor: 'Ir. Bambang Suryono, M.T.',
      description: 'Arsitektur jaringan, protokol, dan keamanan jaringan.',
      progress: 0.30,
      materials: [
        CourseMaterial(id: 'm13', courseId: 'network', title: 'Modul 1 - OSI Layer', type: 'pdf', description: '7 Layer OSI', url: ''),
        CourseMaterial(id: 'm14', courseId: 'network', title: 'Video - TCP/IP', type: 'video', description: 'Protokol TCP/IP', url: ''),
      ],
    ),
    CourseDetail(
      id: 'algo',
      title: 'Algoritma & Pemrograman',
      instructor: 'Dr. Hendra Wijaya, M.Kom',
      description: 'Dasar algoritma, flowchart, dan pemrograman dengan Python.',
      progress: 1.0,
      materials: [
        CourseMaterial(id: 'm15', courseId: 'algo', title: 'Modul 1 - Flowchart', type: 'pdf', description: 'Membuat flowchart', url: ''),
        CourseMaterial(id: 'm16', courseId: 'algo', title: 'Video - Python Basics', type: 'video', description: 'Dasar Python', url: ''),
        CourseMaterial(id: 'm17', courseId: 'algo', title: 'Modul 2 - Loop & Kondisi', type: 'pdf', description: 'For, while, if-else', url: ''),
      ],
    ),
    CourseDetail(
      id: 'web',
      title: 'Pemrograman Web',
      instructor: 'Dra. Lina Marlina, M.Kom',
      description: 'Pengembangan web dengan HTML, CSS, JavaScript, dan PHP.',
      progress: 0.50,
      materials: [
        CourseMaterial(id: 'm18', courseId: 'web', title: 'Modul 1 - HTML & CSS', type: 'pdf', description: 'Dasar HTML dan CSS', url: ''),
        CourseMaterial(id: 'm19', courseId: 'web', title: 'Video - JavaScript', type: 'video', description: 'DOM manipulation', url: ''),
      ],
    ),
    CourseDetail(
      id: 'math',
      title: 'Matematika Diskrit',
      instructor: 'Prof. Dr. Surya Darma',
      description: 'Logika, himpunan, relasi, fungsi, dan teori graf.',
      progress: 0.65,
      materials: [
        CourseMaterial(id: 'm20', courseId: 'math', title: 'Modul 1 - Logika Proposisi', type: 'pdf', description: 'Logika dan tabel kebenaran', url: ''),
        CourseMaterial(id: 'm21', courseId: 'math', title: 'Video - Teori Graf', type: 'video', description: 'Graf dan pohon', url: ''),
      ],
    ),
  ];

  static CourseDetail? getCourseById(String id) {
    try {
      return courses.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }
}

// Notification Models
class AppNotification {
  final String id;
  final String title;
  final String message;
  final String type; // 'assignment', 'announcement', 'grade', 'forum'
  final DateTime createdAt;
  final bool isRead;

  const AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
  });
}

class NotificationData {
  static final List<AppNotification> notifications = [
    AppNotification(
      id: 'n1',
      title: 'Tugas Baru',
      message: 'Tugas baru untuk mata kuliah UI/UX: Tugas 01 - UID Android Mobile Game',
      type: 'assignment',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    ),
    AppNotification(
      id: 'n2',
      title: 'Pengumuman',
      message: 'Server akan mengalami maintenance pada hari Sabtu pukul 22:00',
      type: 'announcement',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    AppNotification(
      id: 'n3',
      title: 'Nilai Keluar',
      message: 'Nilai Kuis 1 - Dasar UI/UX sudah tersedia. Cek di halaman Gradebook.',
      type: 'grade',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    AppNotification(
      id: 'n4',
      title: 'Forum Baru',
      message: 'Dr. Budi Santoso memulai diskusi baru: Prinsip Heuristik Nielsen',
      type: 'forum',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isRead: true,
    ),
    AppNotification(
      id: 'n5',
      title: 'Deadline Mendekat',
      message: 'Tugas "Layout Flutter" akan berakhir dalam 2 hari.',
      type: 'assignment',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      isRead: true,
    ),
  ];
}

// Calendar Event Models
class CalendarEvent {
  final String id;
  final String title;
  final String type; // 'class', 'exam', 'deadline', 'holiday'
  final DateTime date;
  final String? time;
  final String? location;

  const CalendarEvent({
    required this.id,
    required this.title,
    required this.type,
    required this.date,
    this.time,
    this.location,
  });
}

class CalendarData {
  static final List<CalendarEvent> events = [
    CalendarEvent(
      id: 'e1',
      title: 'Kuliah UI/UX',
      type: 'class',
      date: DateTime.now(),
      time: '08:00 - 10:30',
      location: 'Ruang Lab Komputer 3',
    ),
    CalendarEvent(
      id: 'e2',
      title: 'Kuliah Sistem Operasi',
      type: 'class',
      date: DateTime.now(),
      time: '13:00 - 15:30',
      location: 'Ruang Teori 201',
    ),
    CalendarEvent(
      id: 'e3',
      title: 'Deadline: Tugas UID Android',
      type: 'deadline',
      date: DateTime.now().add(const Duration(days: 2)),
      time: '23:59',
    ),
    CalendarEvent(
      id: 'e4',
      title: 'UTS Sistem Operasi',
      type: 'exam',
      date: DateTime.now().add(const Duration(days: 7)),
      time: '09:00 - 11:00',
      location: 'Gedung Ujian Lt.2',
    ),
    CalendarEvent(
      id: 'e5',
      title: 'Libur Natal',
      type: 'holiday',
      date: DateTime(2024, 12, 25),
    ),
    CalendarEvent(
      id: 'e6',
      title: 'Libur Tahun Baru',
      type: 'holiday',
      date: DateTime(2025, 1, 1),
    ),
  ];

  static List<CalendarEvent> getEventsForDate(DateTime date) {
    return events.where((e) => 
      e.date.year == date.year && 
      e.date.month == date.month && 
      e.date.day == date.day
    ).toList();
  }

  static List<CalendarEvent> getUpcomingEvents() {
    final now = DateTime.now();
    return events.where((e) => e.date.isAfter(now) || 
      (e.date.year == now.year && e.date.month == now.month && e.date.day == now.day)
    ).toList()..sort((a, b) => a.date.compareTo(b.date));
  }
}
