import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pagination_pkg/pagination_pkg.dart';
import 'package:tag_app/src/core/utils/utils.dart';

class PaginatedListWidget<K, T> extends StatefulWidget {
  final PaginationEngine<K, T> pagination;
  final Axis scrollDirection;
  final Widget skeleton;
  final bool isPaginated;
  final PreferredSizeWidget? appBar;

  /// How many skeletons to show, when there is no data
  final int skeletonCount;
  final String emptyMessage;
  final Widget Function(int index, T data) builder;
  const PaginatedListWidget({
    super.key,
    required this.pagination,
    required this.skeleton,
    required this.skeletonCount,
    required this.builder,
    this.emptyMessage = "No data found!",
    required this.scrollDirection,
    required this.isPaginated,
    this.appBar,
  });

  @override
  State<PaginatedListWidget<K, T>> createState() => _PaginatedListWidgetState<K, T>();
}

class _PaginatedListWidgetState<K, T> extends State<PaginatedListWidget<K, T>> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isPaginated) {
      scrollController.addListener(() {
        // When scrolled to the bottom, load next page
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          widget.pagination.loadNextPage();
        }

        // When scrolled to the top, load previous page
        if (scrollController.position.pixels ==
            scrollController.position.minScrollExtent) {
          widget.pagination.loadPreviousPage();
        }
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: RefreshIndicator(
        onRefresh: () async {
          widget.pagination.refresh();
        },
        child: ListenableBuilder(
          listenable: widget.pagination,
          builder: (context, _) {
            debugPrint(
              "Pagination state(UI): ${widget.pagination.state.value}",
            );
            final state = widget.pagination.state.value;

            if (state == PaginationLoadState.error &&
                widget.pagination.totalItemsCount == 0) {
              return CustomScrollView(
                controller: scrollController,
                scrollDirection: widget.scrollDirection,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.pagination.errorMessage ??
                              'Failed to load!',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        TextButton.icon(
                          onPressed: widget.pagination.refresh,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Retry'),
                        ),
                      ],
                    ).animate().fadeIn(duration: 300.ms),
                  ),
                ],
              );
            }

            if (state == PaginationLoadState.nopages) {
              return CustomScrollView(
                controller: scrollController,
                scrollDirection: widget.scrollDirection,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: Text(widget.emptyMessage)),
                        IconButton(
                          onPressed: widget.pagination.refresh,
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ).animate().fadeIn(duration: 300.ms),
                  ),
                ],
              );
            }

            if (state == PaginationLoadState.idle) {
              return CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                      child: Text("Pull to refresh!"),
                    ).animate().fadeIn(duration: 300.ms),
                  ),
                ],
              );
            }

            return CustomScrollView(
              controller: scrollController,
              scrollDirection: widget.scrollDirection,
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = widget.pagination.itemAt(index);
                    if (item == null) {
                      return const SizedBox.shrink();
                    }
                    return widget.builder(index, item);
                  }, childCount: widget.pagination.totalItemsCount),
                ),
                SliverToBoxAdapter(
                    child: SizedBox(
                      height: 150,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: ValueListenableBuilder(
                          valueListenable: widget.pagination.state,
                          builder: (context, value, child) {
                            if (value == PaginationLoadState.allLoaded) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "End of the page",
                                  style: const TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ).bold,
                                ),
                              ).animate().fadeIn(duration: 300.ms);
                            }
                            if (value == PaginationLoadState.loading ||
                                value == PaginationLoadState.refreshing) {
                              return Center(
                                child: SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 4,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              );
                            }

                            if(value == PaginationLoadState.error) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.pagination.errorMessage ??
                                        'Failed to load!',
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  TextButton.icon(
                                    onPressed: widget.pagination.loadNextPage,
                                    icon: const Icon(Icons.refresh),
                                    label: const Text('Retry'),
                                  ),
                                ],
                              ).animate().fadeIn(duration: 300.ms);
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _listFooter(
  BuildContext context,
  PaginationLoadState state,
  PaginationEngine pagination,
) {
  debugPrint(
    "Pagination state(UI): ${pagination.state.value}",
  );
  if (state == PaginationLoadState.loading ||
      state == PaginationLoadState.refreshing) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(strokeWidth: 3, color: Theme.of(context).primaryColor,),
        ),
      ),
    );
  }
  if (state == PaginationLoadState.error) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              pagination.errorMessage ?? 'Failed to load more items.',
              style: TextStyle(color: Colors.grey.shade700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            TextButton.icon(
              onPressed: pagination.loadNextPage,
              icon: const Icon(Icons.refresh),
              label: const Text('Retry loading'),
            ),
          ],
        ),
      ),
    );
  }
  if (state == PaginationLoadState.allLoaded) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text("End", style: TextStyle(fontStyle: FontStyle.italic).w500),
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
  return const SizedBox.shrink();
}
