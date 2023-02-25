

import 'package:bloc/bloc.dart';
import 'package:f_set/set.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../resources/game_methods.dart';
import '../../../services/provider.dart';
import '../../../services/sound.dart';
import '../../../utils.dart';
import '../../../utils/type_scale.dart';
import 'package:f_set/modules/game/set_board.dart';
part 'game_cubit.freezed.dart';


@freezed
class GameCubitState with _$GameCubitState {
  const GameCubitState._();
  const factory GameCubitState({
    @Default(<SetCard>[]) List<SetCard> deck,
    @Default(<SetCard?>[]) List<SetCard?> board,
  }) = _SetCubitState;
  List<List<SetCard>> get setsOnBoard => board.sets;
  List<SetCard> get setCards => setsOnBoard.flattened.toList();
  bool get canDraw3Extra => board.effectiveLength == 12 && deck.length >= 3;
}

class GameCubit extends Cubit<GameCubitState> {
  final soundService = locator<SoundService>();
  GameCubit() : super(const GameCubitState());
  int point=0;

  void initializeGame() {
    final deck = newDeck()..shuffle();
    final board = deck.draw(12)..shuffle();

    emit(state.copyWith(
      deck: deck,
      board: board,
    ));
  }

  void draw3Extra() {
    if (!state.canDraw3Extra) {
      return;
    }

    final newDeck = [...state.deck];
    final extraCards = newDeck.draw(3);

    emit(state.copyWith(
      deck: newDeck,
      board: [...state.board, ...extraCards],
    ));
  }

  void checkSet(List<SetCard?> cards) {

    if (cards.isSet) {
      soundService.playSound('click');
      point++;
      _handleSet(cards.cast<SetCard>());
    }
  }

  void _handleSet(List<SetCard> setCards) {
    final newDeck = [...state.deck];
    final newBoard = [...state.board];

    final had15CardsOnBoard = newBoard.effectiveLength == 15;

    setCards.forEach((setCard) {
      if (had15CardsOnBoard) {
        newBoard.replaceItemWithNull(setCard);
      } else {
        final newCard = newDeck.draw(1).firstOrNull;
        newBoard.replaceItemWith(setCard, newCard);
      }
    });

    newBoard.removeWhere((card) => card == null);

    emit(state.copyWith(
      deck: newDeck,
      board: newBoard,
    ));
  }
}
