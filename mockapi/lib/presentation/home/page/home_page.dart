import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/network/wrapper.dart';
import '../get/home_controller.dart';
import '../widget/task_item_widget.dart';

class HomePage extends GetView<HomeController> {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(
      () {
        switch (controller.listTaskWrapper.status!) {
          case Status.success:
            return buildList(context);
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.error:
            return const Center(child: Text('Something Went Wrong'));
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget buildList(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        final metrics = scrollEnd.metrics;
        if (metrics.atEdge &&
            metrics.pixels != 0 &&
            controller.isHasReachMax != true) {
          controller.currentPage.value++;
          controller.fetchTasks(true);
        }
        return true;
      },
      child: ListView.builder(
        itemCount: controller.tasks.length + 1,
        itemBuilder: (context, index) {
          if ((index == controller.tasks.length) && !controller.isHasReachMax) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            );
          } else if (index < controller.tasks.length) {
            final data = controller.tasks[index];

            return TaskItemWidget(
              task: data,
              onDelete: (index) {},
              onEdit: (index) {},
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
