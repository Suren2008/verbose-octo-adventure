import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../data/food_database.dart';
import '../models/food_item.dart';
import '../services/app_state.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_tile.dart';
import 'detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.state, this.initialCategory});

  final AppState state;
  final FoodCategory? initialCategory;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  String _query = '';
  FoodCategory? _category;

  @override
  void initState() {
    super.initState();
    _category = widget.initialCategory;
    if (_category == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<FoodItem> get _results {
    if (_query.trim().isNotEmpty) {
      final found = FoodDatabase.search(_query);
      if (_category == null) return found;
      return found.where((i) => i.category == _category).toList();
    }
    if (_category != null) return FoodDatabase.byCategory(_category!);
    return widget.state.history;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_category != null ? _category!.label : 'Поиск'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                textInputAction: TextInputAction.search,
                onChanged: (v) => setState(() => _query = v),
                decoration: InputDecoration(
                  hintText: 'Например: куриная грудка',
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _query.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.close_rounded),
                          onPressed: () {
                            _controller.clear();
                            setState(() => _query = '');
                          },
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: FoodCategory.values.length + 1,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    final selected = _category == null;
                    return Material(
                      color: selected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).cardTheme.color,
                      borderRadius: BorderRadius.circular(14),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () => setState(() => _category = null),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Text(
                            'Все',
                            style: TextStyle(
                              color: selected
                                  ? Colors.white
                                  : Theme.of(context).hintColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  final cat = FoodCategory.values[index - 1];
                  return CategoryChip(
                    category: cat,
                    selected: _category == cat,
                    onTap: () => setState(
                      () => _category = _category == cat ? null : cat,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: AnimatedBuilder(
                animation: widget.state,
                builder: (context, _) {
                  final list = _results;
                  if (list.isEmpty) return _empty(context);
                  return ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
                    itemCount: list.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return FoodTile(
                        item: item,
                        isFavorite: widget.state.isFavorite(item.id),
                        onToggleFavorite: () =>
                            widget.state.toggleFavorite(item.id),
                        onTap: () {
                          widget.state.registerView(item.id);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                item: item,
                                state: widget.state,
                              ),
                            ),
                          );
                        },
                      ).animate().fadeIn(
                            duration: 200.ms,
                            delay: (index * 18).ms,
                          );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _empty(BuildContext context) {
    final isHistory = _query.isEmpty && _category == null;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isHistory ? Icons.history_rounded : Icons.search_off_rounded,
            size: 56,
            color: Theme.of(context).hintColor,
          ),
          const SizedBox(height: 12),
          Text(
            isHistory ? 'История пуста' : 'Ничего не найдено',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              isHistory
                  ? 'Найди продукт — он появится здесь как недавний'
                  : 'Попробуй другое название или категорию',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).hintColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
