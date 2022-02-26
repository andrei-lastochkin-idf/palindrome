import 'package:flutter/material.dart';
import 'package:presentation/base/bloc_data.dart';

class StreamPalindromeContent<D> extends StatelessWidget {
  final Stream<BlocData<D>> dataStream;
  final dynamic Function(BlocData<D> data) children;

  StreamPalindromeContent({required this.dataStream, required this.children});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocData<D>>(
      stream: dataStream,
      initialData: BlocData.init(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        Widget child;
        if (data != null) {
          child = children.call(data);
          return Container(child: child);
        }
        return Container();
      },
    );
  }
}
