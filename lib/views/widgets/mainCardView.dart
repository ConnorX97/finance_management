import '../../domain/exporters.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
    required this.totalBalance,
    required this.received,
    required this.sent,
  });

  final int totalBalance;
  final int received;
  final int sent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 209, 123, 243),
            Color.fromARGB(255, 186, 157, 236)
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            spreadRadius: 0.1,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text("Total balance",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            Text(
              "\$$totalBalance",
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text("Total",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Received",
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    Text("\$$received",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sent",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Text("\$$sent",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500))
                  ],
                ),
                const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
