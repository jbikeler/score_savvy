import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:score_savvy_app/data/collections/game_history_collection.dart';
import 'package:score_savvy_app/locator.dart';
import 'package:score_savvy_app/util_services/savegame_service.dart';
import 'package:score_savvy_app/widgets/gamehistory_widget.dart';

class HistoriesScreen extends ConsumerWidget {


  final amountController = TextEditingController();
  final historiesProvider = FutureProvider<List<GameHistory>>((ref){
    return locator.get<SaveService>().getHistories();
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historiesData = ref.watch(historiesProvider);
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( color: Colors.white,),
        backgroundColor: const Color.fromARGB(255, 15, 20, 58),
      ),
      backgroundColor: const Color.fromARGB(255, 15, 20, 58),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
                child: Center(
                  child: Text('Game Histories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontFamily: 'Scrubland'
                  ),
                  )
                ),
              ),
              Container(
                child: Expanded(
                  child: historiesData.when(
                    data: (data) {
                      return ListView.separated(
                        itemCount: data.length,
                        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16), // Adjust the height as needed
                        itemBuilder: (BuildContext context, int index) {
                          return GameHistoryWidget(
                            gameData: data[index],
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () {
                      print('loading');
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),

            ],
          ),
        )
      )
    ); },);
  }
}