class BoardListObject {
  String title;
  List<BoardItemObject> items = [];

  BoardListObject({required this.items, required this.title});
}


class BoardItemObject {
  String title;
  String from;

  BoardItemObject({this.title = "", this.from = ""});
}