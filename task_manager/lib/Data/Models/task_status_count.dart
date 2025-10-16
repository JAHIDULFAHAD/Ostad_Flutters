class TaskStatusCount {
  final String status;
  final int count;

  TaskStatusCount({required this.status, required this.count});

  factory TaskStatusCount.fromJson(Map<String, dynamic> jsonData) {
    return TaskStatusCount(status: jsonData['_id'], count: jsonData['sum']);
  }
}
