import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorWrapper extends StatelessWidget {
  const ErrorWrapper(
    this.error,
    this.stackTrace, {
    Key? key,
  }) : super(key: key);

  final Object error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    debugPrintStack(
      label: error.toString(),
      stackTrace: stackTrace,
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          Text(
            'حدث خطأ ما!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  color: Theme.of(context).errorColor,
                ),
          ),
          const SizedBox(height: 32),
          TextButton(
            child: const Text('المزيد'),
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actionsAlignment: MainAxisAlignment.center,
                    content: SingleChildScrollView(
                      child: Text(
                        error.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('اغلاق'),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: const Text('نسخ'),
                        onPressed: () => Clipboard.setData(
                          ClipboardData(
                            text: '$error',
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
