import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? db;

  Future<void> initDatabase() async {
    if (db != null) {
      return;
    }

    final path = join(
      await getDatabasesPath(),
      'school.db',
    );

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute('''
          CREATE TABLE students(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            roll_no TEXT,
            class_name TEXT
          )
        ''');

        await database.execute('''
          CREATE TABLE teachers(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            subject TEXT,
            phone TEXT
          )
        ''');

        await database.execute('''
          CREATE TABLE classes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            teacher TEXT
          )
        ''');

        await database.execute('''
          CREATE TABLE attendance(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER,
            status TEXT
          )
        ''');

        await database.execute('''
          CREATE TABLE fees(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER,
            amount REAL,
            status TEXT
          )
        ''');

        await database.execute('''
          CREATE TABLE marks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            student_id INTEGER,
            subject TEXT,
            total_marks INTEGER,
            obtained_marks INTEGER
          )
        ''');
        await database.execute('''
  CREATE TABLE admin (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    password TEXT
  )
''');
      },
    );
  }



  //ADmin

  Future<int> addAdmin({
    required String name,
    required String email,
    required String password,

}) async
  {
    return await db!.insert(
      'admin',
      {
        'name': name,
        'email': email,
        'password': password,
      }
    );
  }


  //getadmin
  Future<Map<String, dynamic>?> getAdmin(
      String email,
      String password,
      ) async {
    await initDatabase();

    final result = await db!.query(
      'admin',
      where: 'email = ? AND password = ?',
      whereArgs: [
        email,
        password,
      ],
    );

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }



  //student

  Future<int> addStudent({
    required String name,
    required String rollNo,
    required String className,
  }) async {
    await initDatabase();

    return await db!.insert(
      'students',
      {
        'name': name,
        'roll_no': rollNo,
        'class_name': className,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    await initDatabase();

    return await db!.query('students');
  }

  Future<Map<String, dynamic>?> getStudent(int id) async {
    await initDatabase();

    final result = await db!.query(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (result.isEmpty) {
      return null;
    }

    return result.first;
  }

  Future<int> updateStudent({
    required int id,
    required String name,
    required String rollNo,
    required String className,
  }) async {
    await initDatabase();

    return await db!.update(
      'students',
      {
        'name': name,
        'roll_no': rollNo,
        'class_name': className,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteStudent(int id) async {
    await initDatabase();

    return await db!.delete(
      'students',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//teacher
  Future<int> addTeacher({
    required String name,
    required String subject,
    required String phone,
  }) async {
    await initDatabase();

    return await db!.insert(
      'teachers',
      {
        'name': name,
        'subject': subject,
        'phone': phone,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getTeachers() async {
    await initDatabase();

    return await db!.query('teachers');
  }

  Future<int> updateTeacher({
    required int id,
    required String name,
    required String subject,
    required String phone,
  }) async {
    await initDatabase();

    return await db!.update(
      'teachers',
      {
        'name': name,
        'subject': subject,
        'phone': phone,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTeacher(int id) async {
    await initDatabase();

    return await db!.delete(
      'teachers',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//class
  Future<int> addClass({
    required String name,
    required String teacher,
  }) async {
    await initDatabase();

    return await db!.insert(
      'classes',
      {
        'name': name,
        'teacher': teacher,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getClasses() async {
    await initDatabase();

    return await db!.query('classes');
  }

  Future<int> updateClass({
    required int id,
    required String name,
    required String teacher,
  }) async {
    await initDatabase();

    return await db!.update(
      'classes',
      {
        'name': name,
        'teacher': teacher,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteClass(int id) async {
    await initDatabase();

    return await db!.delete(
      'classes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//attendence
  Future<int> addAttendance({
    required int studentId,
    required String status,
  }) async {
    await initDatabase();

    return await db!.insert(
      'attendance',
      {
        'student_id': studentId,
        'status': status,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getAttendance() async {
    await initDatabase();

    return await db!.query('attendance');
  }

  Future<int> updateAttendance({
    required int id,
    required int studentId,
    required String status,
  }) async {
    await initDatabase();

    return await db!.update(
      'attendance',
      {
        'student_id': studentId,
        'status': status,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteAttendance(int id) async {
    await initDatabase();

    return await db!.delete(
      'attendance',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//fee
  Future<int> addFee({
    required int studentId,
    required double amount,
    required String status,
  }) async {
    await initDatabase();

    return await db!.insert(
      'fees',
      {
        'student_id': studentId,
        'amount': amount,
        'status': status,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getFees() async {
    await initDatabase();

    return await db!.query('fees');
  }

  Future<List<Map<String, dynamic>>> getStudentFees(
      int studentId,
      ) async {
    await initDatabase();

    return await db!.query(
      'fees',
      where: 'student_id = ?',
      whereArgs: [studentId],
    );
  }

  Future<int> updateFee({
    required int id,
    required int studentId,
    required double amount,
    required String status,
  }) async {
    await initDatabase();

    return await db!.update(
      'fees',
      {
        'student_id': studentId,
        'amount': amount,
        'status': status,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteFee(int id) async {
    await initDatabase();

    return await db!.delete(
      'fees',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//mark
  Future<int> addMarks({
    required int studentId,
    required String subject,
    required int totalMarks,
    required int obtainedMarks,
  }) async {
    await initDatabase();

    return await db!.insert(
      'marks',
      {
        'student_id': studentId,
        'subject': subject,
        'total_marks': totalMarks,
        'obtained_marks': obtainedMarks,
      },
    );
  }

  Future<List<Map<String, dynamic>>> getMarks() async {
    await initDatabase();

    return await db!.query('marks');
  }

  Future<int> updateMarks({
    required int id,
    required int studentId,
    required String subject,
    required int totalMarks,
    required int obtainedMarks,
  }) async {
    await initDatabase();

    return await db!.update(
      'marks',
      {
        'student_id': studentId,
        'subject': subject,
        'total_marks': totalMarks,
        'obtained_marks': obtainedMarks,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteMarks(int id) async {
    await initDatabase();

    return await db!.delete(
      'marks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}