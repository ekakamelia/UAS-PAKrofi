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
    name: 'Dandy Candra Pratama',
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
        CourseMaterial(
          id: 'm1',
          courseId: 'uiux',
          title: 'Modul 1 - Pengenalan UI/UX',
          type: 'pdf',
          description: 'Pengenalan dasar UI/UX dan perbedaannya',
          url: 'https://example.com/modul1.pdf',
        ),
        CourseMaterial(
          id: 'm2',
          courseId: 'uiux',
          title: 'Video - 10 Heuristic Nielsen',
          type: 'video',
          description: 'Penjelasan lengkap 10 prinsip heuristik',
          url: 'https://youtube.com/watch?v=example',
        ),
        CourseMaterial(
          id: 'm3',
          courseId: 'uiux',
          title: 'Modul 2 - Wireframing',
          type: 'pdf',
          description: 'Cara membuat wireframe yang efektif',
          url: 'https://example.com/modul2.pdf',
        ),
        CourseMaterial(
          id: 'm4',
          courseId: 'uiux',
          title: 'Video - Prototyping dengan Figma',
          type: 'video',
          description: 'Tutorial membuat prototype di Figma',
          url: 'https://youtube.com/watch?v=example2',
        ),
      ],
    ),
    CourseDetail(
      id: 'mobile',
      title: 'Pemrograman Perangkat Bergerak',
      instructor: 'Dr. Siti Aminah, M.T.',
      description: 'Mata kuliah ini membahas pengembangan aplikasi mobile menggunakan Flutter.',
      progress: 0.60,
      materials: [
        CourseMaterial(
          id: 'm5',
          courseId: 'mobile',
          title: 'Modul 1 - Pengenalan Flutter',
          type: 'pdf',
          description: 'Dasar-dasar Flutter dan Dart',
          url: 'https://example.com/flutter1.pdf',
        ),
        CourseMaterial(
          id: 'm6',
          courseId: 'mobile',
          title: 'Video - Widget Basics',
          type: 'video',
          description: 'Memahami widget dasar Flutter',
          url: 'https://youtube.com/watch?v=flutter',
        ),
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
