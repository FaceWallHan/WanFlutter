import 'package:flutter/material.dart';

class LoadingWidget<T> extends StatelessWidget {
  final Future<T> future;

  final AsyncWidgetBuilder<T> childBuilder;

  final AsyncWidgetBuilder<T>? emptyWidgetBuilder;
  final AsyncWidgetBuilder<T>? loadingWidgetBuilder;
  final AsyncWidgetBuilder<T>? errorWidgetBuilder;

  ///是否在inSlivers中
  final bool inSlivers;

  const LoadingWidget(
      {super.key,
      required this.future,
      required this.childBuilder,
      this.emptyWidgetBuilder,
      this.loadingWidgetBuilder,
      this.errorWidgetBuilder,
      this.inSlivers = false});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        AsyncWidgetBuilder<T> builder = switch (snapshot) {
          _ when (snapshot.connectionState == ConnectionState.waiting) =>
            loadingWidgetBuilder ?? _defaultLoading,
          _ when (snapshot.hasError) => errorWidgetBuilder ?? _defaultEmpty,
          _ when (!snapshot.hasData) => emptyWidgetBuilder ?? _defaultError,
          _ => childBuilder,
        };
        return builder(context, snapshot);
      },
    );
  }

  Widget _defaultLoading(BuildContext context, AsyncSnapshot<T> snapshot) {
    final widget = _defaultLoadingBuilder(context, snapshot);
    return inSlivers ? SliverToBoxAdapter(child: widget) : widget;
  }

  Widget _defaultLoadingBuilder(
      BuildContext context, AsyncSnapshot<T> snapshot) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _defaultEmpty(BuildContext context, AsyncSnapshot<T> snapshot) {
    final widget = _defaultEmptyBuilder(context, snapshot);
    return inSlivers ? SliverToBoxAdapter(child: widget) : widget;
  }

  Widget _defaultEmptyBuilder(BuildContext context, AsyncSnapshot<T> snapshot) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text(
        "Please set emptyWidgetBuilder or config XmRefreshConfiguration",
        style: TextStyle(),
      ),
    );
  }

  Widget _defaultError(BuildContext context, AsyncSnapshot<T> snapshot) {
    final widget = _defaultErrorBuilder(context, snapshot);
    return inSlivers ? SliverToBoxAdapter(child: widget) : widget;
  }

  Widget _defaultErrorBuilder(BuildContext context, AsyncSnapshot<T> snapshot) {
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text(
        "Please set errorWidgetBuilder or config XmRefreshConfiguration",
        style: TextStyle(),
      ),
    );
  }
}
