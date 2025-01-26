import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
    this.toolbarWidth = double.infinity,
    this.toolbarHeight,
    this.automaticallyImplyLeading = true,
    this.title,
    this.centerTitle,
    this.initialIsSearching,
    this.actions,
    this.bottom,
    this.onSearch,
    this.fieldHintText,
  });

  final double toolbarWidth;
  final double? toolbarHeight;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final bool? centerTitle;
  final bool? initialIsSearching;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final ValueChanged<String>? onSearch;
  final String? fieldHintText;

  @override
  Size get preferredSize => Size(toolbarWidth, (toolbarHeight ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0));

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final TextEditingController textController = TextEditingController();

  bool isSearching = false;

  String previousText = '';

  @override
  void initState() {
    super.initState();
    isSearching = widget.initialIsSearching ?? false;
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: !isSearching,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;

          textController.clear();
          if (previousText != textController.text.trim()) widget.onSearch?.call('');
          previousText = textController.text.trim();
          setState(() => isSearching = !isSearching);
        },
        child: AppBar(
          toolbarHeight: widget.toolbarHeight,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          title: isSearching
              ? TextField(
                  autofocus: true,
                  controller: textController,
                  onChanged: (value) {
                    previousText = value.trim();
                    widget.onSearch?.call(value);
                  },
                  decoration: InputDecoration(
                    hintText: widget.fieldHintText,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                )
              : widget.title,
          centerTitle: widget.centerTitle,
          bottom: widget.bottom,
          actions: [
            ...?widget.actions,
            if (widget.onSearch != null)
              IconButton(
                onPressed: () {
                  if (isSearching) {
                    textController.clear();
                    if (previousText != textController.text.trim()) widget.onSearch?.call('');
                    previousText = textController.text.trim();
                    return;
                  }

                  setState(() => isSearching = !isSearching);
                },
                icon: isSearching ? const Icon(Icons.backspace) : const Icon(Icons.search),
              ),
          ],
        ),
      );
}
