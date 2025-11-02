import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/Data/Models/task_model.dart';
import 'package:task_manager/Ui/Widgets/snack_bar_message.dart';

import '../Controllers/task_change_status_provider.dart';
import '../Controllers/task_delete_provider.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel, required this.refreshParent});

  final TaskModel taskModel;
  final VoidCallback refreshParent;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          tileColor: Colors.white,
          title: Text(widget.taskModel.title),
          subtitle: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description),
              Text(
                "Date: ${widget.taskModel.createdDate}",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Chip(
                    label: Text(widget.taskModel.status),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  Spacer(),
                  Consumer<TaskDeleteProvider>(
                    builder: (context, deleteProvider, _) {
                      return Visibility(
                        visible: deleteProvider.deleteStatusInProgress==false,
                        replacement: CircularProgressIndicator(),
                        child: IconButton(
                          onPressed: () {
                            _deleteStatus(context);
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.grey,
                        ),
                      );
                    }
                  ),
                  Consumer<TaskChangeStatusProvider>(
                    builder: (context, changeStatusProvider, _) {
                      return Visibility(
                        visible: changeStatusProvider.changeStatusInProgress==false,
                        replacement: CircularProgressIndicator(),
                        child: IconButton(
                          onPressed: () {
                            _showChangeStatusDialog();
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.grey,
                        ),
                      );
                    }
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }

  void _showChangeStatusDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () {
                  _changeStatus('New');
                },
                title: Text('New'),
                trailing: widget.taskModel.status == 'New'
                    ? Icon(Icons.done)
                    : null,
              ),
              ListTile(
                onTap: () {
                  _changeStatus('Progress');
                },
                title: Text('Progress'),
                trailing: widget.taskModel.status == 'Progress'
                    ? Icon(Icons.done)
                    : null,
              ),
              ListTile(
                onTap: () {
                  _changeStatus('Cancelled');
                },
                title: Text('Cancelled'),
                trailing: widget.taskModel.status == 'Cancelled'
                    ? Icon(Icons.done)
                    : null,
              ),
              ListTile(
                onTap: () {
                  _changeStatus('Completed');
                },
                title: Text('Completed'),
                trailing: widget.taskModel.status == 'Completed'
                    ? Icon(Icons.done)
                    : null,
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _changeStatus(String status) async {
    if(status == widget.taskModel.status){
      return ;
    }
    bool isSucces = await context.read<TaskChangeStatusProvider>().changeStatus(context: context, id: widget.taskModel.id, status: status);
    if(isSucces){
      widget.refreshParent();
      Navigator.pop(context);
    } else {
      showSnackbarMessage(context, context.read<TaskChangeStatusProvider>().errorMessage);
    }
  }
  Future<void> _deleteStatus(context) async {
    bool isSucces = await context.read<TaskDeleteProvider>().deleteStatus(widget.taskModel.id);
    if(isSucces){
      widget.refreshParent();
    } else {
      showSnackbarMessage(context, context.read<TaskDeleteProvider>().errorMessage);
    }
  }
}
