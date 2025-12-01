class MetaDataDto {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  MetaDataDto({this.currentPage, this.numberOfPages, this.limit});

  MetaDataDto.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
