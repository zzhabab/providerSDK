import 'package:flutter/cupertino.dart';

class ModelProvider<T extends Listenable> extends StatefulWidget {
  Widget child;
  T Function() create;

  ModelProvider({super.key, required this.child, required this.create});

  @override
  State<StatefulWidget> createState() => _ModelProvider<T>();

  static T of<T extends Listenable>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SetModelInherited<T>>()!.model;
  }

}
class _ModelProvider<T extends Listenable> extends State<ModelProvider<T>> {
  late T model;
  @override
  void initState() {
    model = widget.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: model,
      builder: (BuildContext context, Widget? child) {
        return SetModelInherited(
          model: model,
          child: widget.child
        );
      },
    );
  }
  
}

class SetModelInherited<T extends Listenable> extends InheritedWidget {
  const SetModelInherited({super.key, required super.child, required this.model});
  final T model;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}

extension Consumer on BuildContext {
  T watch<T extends Listenable>() => ModelProvider.of<T>(this);
}