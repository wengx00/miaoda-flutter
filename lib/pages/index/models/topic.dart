class TopicViewModel {
  String title;
  String hot;
  List<TopicItemModel> items;

  TopicViewModel({required this.title, required this.hot, required this.items});
}

class TopicItemModel {
  String title;
  String detail;
  String like;
  TopicItemModel(
      {required this.title, required this.detail, required this.like});
}
