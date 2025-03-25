import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/services/a.dart';
import 'package:quran_app/features/home/data/models/surah_model/ayah.dart';
import 'package:quran_app/features/home/data/models/surah_model/surah_model.dart';
import 'package:share_plus/share_plus.dart';

class SurahView extends StatelessWidget {
  const SurahView({super.key});
  static const String route = "surah_view";

  @override
  Widget build(BuildContext context) {
    final surah = ModalRoute.of(context)?.settings.arguments as SurahModel?;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "بسم الله الرحمن الرحيم",
                  style: const TextStyle(
                      fontFamily: "Diwani",
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AyahsSliverList(
              surahModel: surah,
            )
          ],
        ),
      ),
    );
  }
}

class AyahsSliverList extends StatefulWidget {
  const AyahsSliverList({super.key, required this.surahModel});
  final SurahModel? surahModel;
  @override
  State<AyahsSliverList> createState() => _AyahsSliverListState();
}

class _AyahsSliverListState extends State<AyahsSliverList> {
  static const String bismillah = "بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ";
  final AudioPlayer audioPlayer = AudioPlayer();
  late List<bool> isSaved;
  @override
  void initState() {
    super.initState();
    final savedAyahs =
        SharedPreferencesPlugin.instance.getStringList("savedAyahs") ?? [];
    isSaved = List.generate(
      widget.surahModel?.ayahs?.length ?? 0,
      (index) =>
          savedAyahs.contains(widget.surahModel?.ayahs?[index].text ?? ""),
    );
  }

  @override
  void dispose() {
    audioPlayer.stop();
    audioPlayer.dispose();
    super.dispose();
  }

  Future<void> copyAyahToClipboard(int index) async {
    try {
      String? ayahText = widget.surahModel?.ayahs?[index].text;

      if (index == 0 && ayahText != null) {
        ayahText = ayahText.replaceAll(bismillah, "");
      }

      if (ayahText != null && ayahText.isNotEmpty) {
        await Clipboard.setData(ClipboardData(text: ayahText));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم نسخ الآية بنجاح")),
        );
      }
    } catch (e) {
      debugPrint("Error copying ayah: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ أثناء نسخ الآية")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          String ayahText = widget.surahModel?.ayahs?[index].text ?? "";
          if (index == 0) {
            ayahText = ayahText.replaceAll(bismillah, "");
          }
          if (widget.surahModel?.name == "سُورَةُ ٱلْفَاتِحَةِ" && index == 0) {
            return SizedBox();
          }
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                backgroundColor: Colors.white,
                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await audioPlayer.play(
                              UrlSource(
                                  widget.surahModel?.ayahs?[index].audio ?? ""),
                            );
                          },
                          child: ListTile(
                            leading: Icon(Icons.play_arrow_outlined,
                                color: Colors.blueAccent),
                            title: Text("اقرا الايه",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                        ),

                        Divider(height: 1, color: Colors.grey[300]),
                        GestureDetector(
                          onTap: () async {
                            Navigator.pop(context);
                            await saveAyah(index);
                          },
                          child: ListTile(
                            leading: Icon(Icons.bookmark, color: Colors.green),
                            title: Text("اضف علامة مرجعية",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600)),
                          ),
                        ),

                        Divider(height: 1, color: Colors.grey[300]),

                        /// Copy Ayah
                        ListTile(
                          leading: Icon(Icons.copy, color: Colors.green),
                          title: Text("نسخ",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          onTap: () {
                            Navigator.pop(context);
                            copyAyahToClipboard(index);
                          },
                        ),

                        Divider(height: 1, color: Colors.grey[300]),

                        /// Share Ayah
                        ListTile(
                          leading: Icon(Icons.share, color: Colors.orange),
                          title: Text("شارك",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          onTap: () async {
                            Navigator.pop(context);
                            await Share.share(
                                widget.surahModel?.ayahs?[index].text ?? "");
                          },
                        ),

                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      await saveAyah(index);
                    },
                    child: Icon(
                      isSaved[index]
                          ? Icons.bookmark
                          : Icons.bookmark_add_outlined,
                      color: Colors.green,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    ayahText,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          );
        },
        childCount: widget.surahModel?.ayahs?.length ?? 0,
      ),
    );
  }

  Future<void> saveAyah(int index) async {
    final savedAyahs =
        SharedPreferencesPlugin.instance.getStringList("savedAyahs") ?? [];

    String ayahText = widget.surahModel?.ayahs?[index].text ?? "";

    if (savedAyahs.contains(ayahText)) {
      savedAyahs.remove(ayahText);
      isSaved[index] = false;
    } else {
      savedAyahs.add(ayahText);
      isSaved[index] = true;
    }

    await SharedPreferencesPlugin.instance
        .setStringList("savedAyahs", savedAyahs);
    setState(() {});
  }
}
