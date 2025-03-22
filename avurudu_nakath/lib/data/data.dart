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
    name: "නව සඳ බැලීම",
    time: "06:00 PM",
    date: "2025-03-30",
    description:
        "අභිනව චන්ද්‍ර වර්ෂය සඳහා මාර්තු මස 30 වැනි ඉරිදා දින ද අභිනව සූර්ය වර්ෂය සඳහා මැයි මස 01 වැනි බ්‍රහස්පතින්දා දින ද නව සඳ බැලීම මැනවි.",
  ),
  DataModel(
    id: 2,
    name: "පරණ අවුරුද්ද සඳහා ස්නානය",
    time: "0:01 AM",
    date: "2025-04-13",
    description:
        "අප්‍රේල් මස 13 වැනි ඉරිදා දින දිඹුල්පත් යුෂ මිශ්‍ර නානු ගා ස්නානයකොට ඉෂ්ට දේවතා අනුස්මරණයෙහි යෙදී වාසය මැනවි.",
  ),
  DataModel(
    id: 3,
    name: "අලුත් අවුරුදු උදාව",
    time: "03:21 PM",
    date: "2025-04-14",
    description:
        "අප්‍රේල් මස 14 වැනි සඳුදා දින පූර්වභාග 03.21ට සිංහල අලුත් අවුරුද්ද උදා වෙයි.",
  ),
  DataModel(
    id: 4,
    name: "පුණ්‍ය කාලය",
    time: "08:57 PM",
    date: "2025-04-13",
    description:
        "අප්‍රේල් මස 13 වැනි ඉරිදා අපරභාග 08.57 සිට පසුදින එනම් 14 වැනි සඳුදා පූර්වභාග 09.45 දක්වා පුණ්‍ය කාලය බැවින් අප්‍රේල් මස 13 වැනි ඉරිදා අපරභාග 08.57ට පළමුව ආහාර පාන ගෙන සියලු වැඩ අත්හැර ආගමික වතාවත්වල යෙදීම ද, පුණ්‍ය කාලයේ අපර කොටස එනම් අප්‍රේල් මස 14 වැනි සඳුදා පූර්වභාග 03.21 සිට 14 වැනි සඳුදා පූර්වභාග 09.45 දක්වා පහත දැක්වෙන අයුරින් ආහාර පිසීම, වැඩ ඇල්ලීම, ගනු දෙනු කිරීම හා ආහර අනුභවය ආදී නැකත් චාරිත්‍ර විධි ඉටු කිර්ම මැනවි.",
  ),
  DataModel(
    id: 5,
    name: "ආහාර පිසීම",
    time: "04:04 AM",
    date: "2025-04-14",
    description:
        "අප්‍රේල් මස 14 වැනි සඳුදා පූර්වභාග 04.04ට තඹ වර්ණ වස්ත්‍රාභරණයෙන් සැරසී දකුණු දිශාව බලා ළිප් බැඳ ගිනි මොළවා කිරිබතක් ද කැවිලි වර්ගයක් ද දී කිරි සහ විලඳ ද පිළියෙල කර ගැනීම මැනවි.",
  ),
  DataModel(
    id: 6,
    name: "වැඩ ඇල්ලීම, ගනුදෙනු කිරීම හා ආහාර අනුභවය",
    time: "06:44 AM",
    date: "2025-04-14",
    description:
        "අප්‍රේල් මස 14 වැනි සඳුදා පූර්වභාග 06.44ට මුතු හා ශ්වේත වර්ණ වස්ත්‍රාභරණයෙන් සැරසී දකුණු දිශාව බලා සියලු වැඩ අල්ලා ගනුදෙනු කොට ආහාර අනුභව කිරීම මැනවි.",
  ),
  DataModel(
    id: 7,
    name: "හිස තෙල් ගෑම",
    time: "09:04 PM",
    date: "2025-04-16",
    description:
        "අප්‍රේල් මස 16 වැනි බදාදා පූර්වභාග 09.04ට පච්ච වර්ණ හෙවත් කොළ පැහැති වස්ත්‍රාභරණයෙන් සැරසී උතුරු දිශාව බලා හිසට කොහොඹ පත් ද, පයට කොළොන් පත් ද තබා කොහොඹ පත් යුෂ මිශ්‍ර නානු හා තෙල් ගා ස්නානය කිරීම මැනවි.",
  ),
  DataModel(
    id: 8,
    name: "රැකීරක්ෂා සඳහා පිටත්ව යෑම",
    time: "09:03 PM",
    date: "2025-04-17",
    description:
        "අප්‍රේල් මස 17 වැනි බ්‍රහස්පතින්දා පූර්වභාග 09.03ට රන්වන් පැහැති වස්ත්‍රාභරණයෙන් සැරසී කිර්බතක් හා එළකිරි මිශ්‍ර කැවිලි වර්ගයක් අනුභව කර උතුරු දිශාව බලා පිටත්ව යෑම මැනවි.",
  ),
];
