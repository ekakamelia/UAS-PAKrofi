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
