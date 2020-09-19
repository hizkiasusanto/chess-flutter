import 'package:Chess/game-engine/provider/typedefs/board-state.dart';
import 'package:Chess/game-engine/bots/bot.dart';
import 'package:Chess/game-engine/game-widgets/piece.dart';
import 'package:Chess/game-engine/provider/typedefs/move.dart';
import 'package:Chess/game-engine/utils/player.dart';
import 'package:Chess/game-engine/utils/square.dart';

class RandomBot extends Bot {
  Move makeMove(BoardState boardState, Player botColor) {
    Iterable<Piece> ownPieces = boardState.piecePosition.values
        .where((piece) => piece?.player == botColor);
    Piece piecetoMove = (ownPieces
            .where((piece) =>
                piece.getLegalMovesPostCheckHandler(boardState).isNotEmpty)
            .toList()
              ..shuffle())
        .first;
    SquareNumber destination =
        (piecetoMove.getLegalMovesPostCheckHandler(boardState)..shuffle())
            .first;
    return Move(piece: piecetoMove, destination: destination);
  }
}