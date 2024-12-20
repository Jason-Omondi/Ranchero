import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'controller/dashboard_controller.dart';
import 'package:get_storage/get_storage.dart';
import '../../core/widgets/custom_text_widget.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Get.isDarkMode;

    // Fetch data from GetStorage
    final userdata = GetStorage();
    final String fullName = userdata.read("fullName") ?? 'John Doe';
    final String role = userdata.read("role") ?? 'Employee';
    final leaveBalance = userdata.read("leaveBalance");
    final leaveApplications = userdata.read("leaveApplications");

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabelText(
              text: '$fullName', // Display full name from storage
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
            CustomLabelText(
              text: greeting(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overview Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '25 May 2024',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildOverviewCard(
                    context,
                    title: 'Request',
                    count: '100',
                    color: Colors.green,
                    icon: Icons.mail,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Leave Request',
                    count: leaveApplications?.length.toString() ??
                        '0', // Display the number of leave applications
                    color: Colors.orange,
                    icon: Icons.calendar_today,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Attendance',
                    count: '32',
                    color: Colors.red,
                    icon: Icons.access_time,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Pay Slip',
                    count: '22',
                    color: Colors.blue,
                    icon: Icons.attach_money,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Project Task',
                    count: '8',
                    color: Colors.purple,
                    icon: Icons.task,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Team',
                    count: '32',
                    color: Colors.amber,
                    icon: Icons.group,
                  ),
                ],
              ),

              const SizedBox(height: 24),
              // Recent Leave Application
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Leave Application',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
              leaveApplications != null && leaveApplications.isNotEmpty
                  ? Card(
                      child: ListTile(
                        leading: const CircleAvatar(child: Icon(Icons.person)),
                        title: Text(leaveApplications[0].employeeId ??
                            'N/A'), // Access properties directly
                        subtitle: Text(
                          '${formatDate(leaveApplications[0].startDate?.toIso8601String() ?? '')} - ${formatDate(leaveApplications[0].endDate?.toIso8601String() ?? '')}\nStatus: ${leaveApplications[0].status ?? 'N/A'}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),

                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: const Text('View'),
                        ),
                      ),
                    )
                  : const Center(child: Text('No recent leave applications')),

              const SizedBox(height: 24),
              // Today's Attendance
              Text(
                "Today's Attendance",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAttendanceCard(
                    context,
                    title: 'Present',
                    count: '100',
                    color: Colors.green,
                  ),
                  _buildAttendanceCard(
                    context,
                    title: 'Late',
                    count: '20',
                    color: Colors.orange,
                  ),
                  _buildAttendanceCard(
                    context,
                    title: 'Absent',
                    count: '10',
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context,
      {required String title,
      required String count,
      required Color color,
      required IconData icon}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              count,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard(BuildContext context,
      {required String title, required String count, required Color color}) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                count,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: color,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*
class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Get.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLabelText(
              text: '${controller.fullName}',
              style: context.textTheme.titleMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
            CustomLabelText(
              text: greeting(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('Menu'),
            ),
            ListTile(
              title: Text('Home'),
            ),
            ListTile(
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Overview Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overview',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    '25 May 2024',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildOverviewCard(
                    context,
                    title: 'Request',
                    count: '100',
                    color: Colors.green,
                    icon: Icons.mail,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Leave Request',
                    count: '24',
                    color: Colors.orange,
                    icon: Icons.calendar_today,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Attendance',
                    count: '32',
                    color: Colors.red,
                    icon: Icons.access_time,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Pay Slip',
                    count: '22',
                    color: Colors.blue,
                    icon: Icons.attach_money,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Project Task',
                    count: '8',
                    color: Colors.purple,
                    icon: Icons.task,
                  ),
                  _buildOverviewCard(
                    context,
                    title: 'Team',
                    count: '32',
                    color: Colors.amber,
                    icon: Icons.group,
                  ),
                ],
              ),

              const SizedBox(height: 24),
              // Recent Leave Application
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Leave Application',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
              Card(
                child: ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  //  CircleAvatar(
                  //   backgroundImage: AssetImage('assets/imgs/profile.png'),
                  // ),
                  title: Text('John Mtemi'),
                  subtitle: Text('15 Jan - 22 Jan 2025\nSick Leave Request'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text('Cancel'),
                      // ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('View'),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
              // Today's Attendance
              Text(
                "Today's Attendance",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildAttendanceCard(
                    context,
                    title: 'Present',
                    count: '100',
                    color: Colors.green,
                  ),
                  _buildAttendanceCard(
                    context,
                    title: 'Late',
                    count: '20',
                    color: Colors.orange,
                  ),
                  _buildAttendanceCard(
                    context,
                    title: 'Absent',
                    count: '10',
                    color: Colors.red,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewCard(BuildContext context,
      {required String title,
      required String count,
      required Color color,
      required IconData icon}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              count,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: color,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceCard(BuildContext context,
      {required String title, required String count, required Color color}) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                count,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: color,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


