import './minimax.dart';
int xx, yy, zz;
String winner = "";

bool colorWinner(int n) {
  if (n == xx || n == yy || n == zz) {
    return true;
  }
  return false;
}

void getWinnerColored(int x, int y, int z) {
  xx = x;
  yy = y;
  zz = z;
}

void reset(List<String> LST) {
  for (int i = 0; i < 9; ++i) {
    LST[i] = "";
  }
  getWinnerColored(-1, -1, -1);
    winner = "";
    Xchance = true;
}

String getWinner(List<String> LST) {
  int i;
  for (i = 0; i < 7; i += 3) {
    if (LST[i] == LST[i + 1] && LST[i] == LST[i + 2] && LST[i] != "") {
      getWinnerColored(i, i + 1, i + 2);
      return LST[i];
    }
  }

  for (i = 0; i < 3; ++i) {
    if (LST[i] == LST[i + 3] && LST[i] == LST[i + 6] && LST[i] != "") {
      getWinnerColored(i, i + 3, i + 6);
      return LST[i];
    }
  }

  if (LST[0] == LST[4] && LST[4] == LST[8] && LST[0] != "") {
    getWinnerColored(0, 4, 8);
    return LST[0];
  }
  if (LST[2] == LST[4] && LST[4] == LST[6] && LST[2] != "") {
    getWinnerColored(2, 4, 6);
    return LST[2];
  }

  for (i = 0; i < 9; ++i) {
    if (LST[i] == "") {
      break;
    }
  }
  if (i == 9) {
    getWinnerColored(-1, -1, -1);
    return "Tie";
  }
  getWinnerColored(-1, -1, -1);

  return "";
}
