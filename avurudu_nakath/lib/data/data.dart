class DataModel {
  final int id;
  final String name;
  final String time;
  final String date;
  final String description;

  DataModel({
    required this.id,
    required this.name,
    required this.time,
    required this.date,
    required this.description,
  });
}

List<DataModel> dataList = [
  DataModel(
    id: 1,
    name: "Event A",
    time: "10:00 AM",
    date: "2025-03-22",
    description: "This is the description for Event A.",
  ),
  DataModel(
    id: 2,
    name: "Event B",
    time: "02:00 PM",
    date: "2025-03-23",
    description: "This is the description for Event B.",
  ),
  DataModel(
    id: 3,
    name: "Event C",
    time: "05:30 PM",
    date: "2025-03-24",
    description: "This is the description for Event C.",
  ),
  DataModel(
    id: 4,
    name: "Event D",
    time: "07:15 AM",
    date: "2025-03-25",
    description: "This is the description for Event D.",
  ),
  DataModel(
    id: 5,
    name: "Event E",
    time: "09:45 PM",
    date: "2025-03-26",
    description: "This is the description for Event E.",
  ),
  DataModel(
    id: 6,
    name: "Event F",
    time: "11:30 AM",
    date: "2025-03-27",
    description: "This is the description for Event F.",
  ),
  DataModel(
    id: 7,
    name: "Event G",
    time: "04:00 PM",
    date: "2025-03-28",
    description: "This is the description for Event G.",
  ),
  DataModel(
    id: 8,
    name: "Event H",
    time: "06:20 PM",
    date: "2025-03-29",
    description: "This is the description for Event H.",
  ),
];
