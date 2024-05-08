
import 'domain/exporters.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MoneyAppProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}


extension IntExtension on int ? {
  int validate({int value = 0}){
    return this ?? value;
  }

  Widget get kH => SizedBox(
    height: this?.toDouble(),
  );

  Widget get kW => SizedBox(
    width: this?.toDouble(),
  );
}


