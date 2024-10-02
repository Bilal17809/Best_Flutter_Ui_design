import 'package:flutter/material.dart';
import '../Chart_Services/bar_chart.dart';
import '../Chart_Services/pie_chart.dart';
import '../Components/Button_List/button_list.dart';
import '../Components/primary_button.dart';
import '../Components/primary_button2.dart';
import '../Components/secondry_button.dart';
import '../Components/secondry_button2.dart';
import '../Services-Class/daylist_class.dart';
import '../Widgets/primary_text.dart';
class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({super.key});
  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}
class BarChartSample3State extends State<BarChartSample3> {
  String selectedDay = "Select a day";
  void _onItemSelected(String item) {
    setState(() {
      selectedDay = item;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 88, horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // >>>>>>Top section<<<<<
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Hello Admin!",
                                style: primary1TextStyle,
                              ),
                            ),
                            SizedBox(height: 4),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "See today's performance",
                                style: primary2TextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade400),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.notification_important_sharp,
                                size: MediaQuery.of(context).size.width * 0.07,
                              ),
                            ),
                          ),
                          Positioned(
                            right: -4,
                            top: -4,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.red, // Background color of the badge
                              ),
                              child: const Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '3', // The badge text
                                    style: TextStyle(
                                      color: Colors.white, // Text color
                                      fontSize: 12, // Text size
                                      fontWeight: FontWeight.bold, // Bold text
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 1,color: Colors.grey.shade300,),
                const SizedBox(height: 15,),

                // >>>>> performance OverView <<<<<<
                const Text("Performance Overview", style: primaryTextStyle),
                const SizedBox(height: 12,),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 15,
                                        height: 15,
                                        decoration: BoxDecoration(
                                          color: Colors.black54,
                                          borderRadius: BorderRadius.circular(4),
                                          // Border around the container
                                        ),
                                      ),
                                      SizedBox(width: 5,),
                                      const Text(
                                        'Total UCO Collection in Kg',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 13,),
                                  CustomDropDown(
                                    displayText: "Select day",
                                    onItemSelected: _onItemSelected,
                                    items: Constants.daysOfWeek, // List of days
                                  ),
                                  const SizedBox(width: 8),
                                  CustomDropDown(
                                    displayText: "Select team",
                                    onItemSelected: _onItemSelected,
                                    items: Constants.team, // List of teams
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            SizedBox(width: 5,),
                            const Text(
                              'Team B UCO Collection',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black, // Text color
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        const SizedBox(
                          height: 270,
                          child:  DonutChart(
                            firstValue: 62,
                            secondValue: 38,
                            centerTitle: 'UCO',
                            centerSubtitle: 'Collections',
                            leftMessage: '250 kg',
                            rightMessage: '50 kg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),

                // >>>>> Daily UCO Collection section <<<<<
                const Text("Daily UCO Collection", style: primaryTextStyle),
                const SizedBox(height: 14),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('All Team Collection'),
                            SizedBox(width: 13,),
                            Row(
                              children: [
                                CustomDropDown(
                                  displayText: "Select day",
                                  onItemSelected: _onItemSelected,
                                  items: Constants.daysOfWeek, // List of days
                                ),
                                const SizedBox(width: 6),
                                CustomDropDown(
                                  displayText: "Select team",
                                  onItemSelected: _onItemSelected,
                                  items:Constants.team, // List of teams
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                       AspectRatio(
                        aspectRatio: 1.6,
                        child: ChartScreen(),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                const Text(
                                  'Team A',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                const Text(
                                  'Team B',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                const Text(
                                  'Team C',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                                SizedBox(width: 5,),
                                const Text(
                                  'Team D',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // >>>> Approve section <<<<<
                Row(
                  children: [
                    const Text("Approve",style:primaryTextStyle,),
                    const SizedBox(width: 10,),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red, // Background color of the badge
                      ),
                      child: const Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '3', // The badge text
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 12, // Text size
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      PrimaryButton2(
                        title: "Major Zaidi team",
                        subtitle: "Work order",
                        icon: Icons.group,
                        onPressed: () {},
                      ),
                      Divider(thickness: 1, color: Colors.grey.shade300),
                      PrimaryButton(
                        title: "Major Zaidi team",
                        subtitle: "Work order",
                        icon: Icons.group,
                        onPressed: () {},
                      ),
                      Divider(thickness: 1, color: Colors.grey.shade300),
                      PrimaryButton(
                        title: "Major Zaidi team",
                        subtitle: "Work order",
                        icon: Icons.group,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // >>>>> Cash Reconciliation Summaries section <<<<<
                const Text("Cash Reconciliation Summaries", style: primaryTextStyle),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        SecondryButton(
                          title: "Major Zaidi team",
                          subtitle: "Work order",
                          icon: Icons.group,
                          onPressed: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                children: [
                                  Text("Cash in"),
                                  Text("25,000"),
                                ],
                              ),
                              Text("|", style: TextStyle(fontSize: 24, color: Colors.grey.shade300)),
                              const Column(
                                children: [
                                  Text("Cash-Out"),
                                  Text("3,000"),
                                ],
                              ),
                              Text("|", style: TextStyle(fontSize: 24, color: Colors.grey.shade300)),
                              const Column(
                                children: [
                                  Text("Balance"),
                                  Text("30,0000"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // >>>> Additional sections <<<<<
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Column(
                      children: [
                        SecondryButton(
                          title: "Major Zaidi team",
                          subtitle: "Work order",
                          icon: Icons.group,
                          onPressed: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Column(
                                children: [
                                  Text("Cash in"),
                                  Text("25,000"),
                                ],
                              ),
                              Text("|", style: TextStyle(fontSize: 24, color: Colors.grey.shade300)),
                              const Column(
                                children: [
                                  Text("Cash-Out"),
                                  Text("3,000"),
                                ],
                              ),
                              Text("|", style: TextStyle(fontSize: 24, color: Colors.grey.shade300)),
                              const Column(
                                children: [
                                  Text("Balance"),
                                  Text("30,0000"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 22),

                // >>>>> Notifications section <<<<<
                Row(
                  children: [
                    const Text("Notifications",style:primaryTextStyle,),
                    SizedBox(width: 10,),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.red, // Background color of the badge
                      ),
                      child: const Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '3', // The badge text
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 12, // Text size
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: SecondryButton2(
                    title: "Major Zaidi team",
                    subtitle: "Work order",
                    icon: Icons.group,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: SecondryButton2(
                    title: "Major Zaidi team",
                    subtitle: "Work order",
                    icon: Icons.group,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
