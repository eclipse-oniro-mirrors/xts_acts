function getBooleanTuple(): [boolean, boolean, boolean, boolean, boolean] {
  return [true, false, true, true, false];
}

function getCharTuple(): [char, char, char, char, char] {
  return [c'H', c'e', c'l', c'l', c'o'];
}

function getByteTuple(): [byte, byte, byte, byte, byte] {
  return [125, 126, 127, 1, 2];
}

function getShortTuple(): [short, short, short, short, short] {
  return [300, 350, 200, 100, 50];
}

function getIntTuple(): [int, int, int, int, int] {
  return [300, 350, 200, 100, 50];
}

function getLongTuple(): [long, long, long, long, long] {
  return [300, 200, 100, 50, 1000];
}

function getFloatTuple(): [float, float, float, float, float] {
  return [3.14f, 2.71f, 1.61f, 0.59f, 10.0f];
}

function getDoubleTuple(): [double, double, double, double, double] {
  return [3.14, 2.71, 1.61, 0.59, 10.0];
}

function getReferenceTuple(): [String, double[], String] {
  return [new String("Hello"), [1.0, 2.0, 3.0, 4.0, 5.0], "world"];
}

function getTestPrimitiveTuple(): [boolean, char, byte, short, int, long, float, double] {
  return [true, c'x', 127, 300, 500, 600, 100.0f, 400.0];
}
