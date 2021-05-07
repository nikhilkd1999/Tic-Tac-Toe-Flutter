import 'dart:math';
import './getWinner.dart';

String ai = "O";
String human = "X";
bool Xchance = true;


bool isBotEnabled = false;


void bestMove(List<String> LST) {
  if (getWinner(LST) != "") {
    return;
  }
  int score, bestScore = -9999999999999, move;

  // for(int i=LST.length-1;i>=0;--i)
  for (int i = 0; i < LST.length; ++i) {
    if (LST[i] == '') {
      LST[i] = ai;
      score = minimax(LST, false);
      LST[i] = '';
      if (score > bestScore) {
        bestScore = score;

        move = i;
      }
    }
  }
  LST[move] = "O";
  Xchance = !Xchance;
}

int minimax(List<String> LST, bool isMaximizing) {
  String result = getWinner(LST);

  if (result == "X") return -1;
  if (result == "O") return 1;
  if (result == "Tie") return 0;

  int score, bestScore;

  if (isMaximizing) {
    bestScore = -99999999999;
    for (int i = 0; i < LST.length; ++i) {
      if (LST[i] == "") {
        LST[i] = ai;
        score = minimax(LST, false);
        LST[i] = "";
        bestScore = max(score, bestScore);
      }
    }
  } else {
    bestScore = 99999999999;
    for (int i = 0; i < LST.length; ++i) {
      if (LST[i] == "") {
        LST[i] = human;
        score = minimax(LST, true);
        LST[i] = "";
        bestScore = min(score, bestScore);
      }
    }
  }

  return bestScore;
}
