class Question {
  final int? id, answer;
  final String? question;
  final List<String>? options;
  final String? urlsourcecauhoi;

  Question({this.id, this.question, this.answer, this.options,this.urlsourcecauhoi});
}

// ignore: constant_identifier_names
const List sample_data = [
  {
    "id": 1,
    "question":
        "Chết vinh ______còn hơn sống nhục",
    "options": ['Sướng', 'Trong', 'Vinh', 'Xanh'],
    "answer_index": 1,
    "urlsourcecauhoi":'assets/audio/ques01.mp3'
  },
  {
    "id": 2,
    "question": "Quốc hội lần thứ mấy",
    "options": ['Lần thứ I', 'Lần thứ II', 'Lần thứ III', 'Lần thứ IV'],
    "answer_index": 2,
    "urlsourcecauhoi":'assets/audio/ques02.mp3'
  },
  {
    "id": 3,
    "question": "Nhiệm kỳ của Quốc hội khóa XIV diễn ra từ năm nào đến năm nào?",
    "options": ['2010 - 2016', '2016 – 2021', '2011 - 2015', '2016 - 2020'],
    "answer_index": 2,
     "urlsourcecauhoi":'assets/audio/ques03.mp3'
  },
  {
    "id": 4,
    "question": "Quốc hội khóa XIV được bầu cử vào ngày nào?",
    "options": ['22/05/2016', '19/05/2016', '22/05/2015', '19/5/2015'],
    "answer_index": 2,
    "urlsourcecauhoi":'assets/audio/ques04.mp3'
  },
];
