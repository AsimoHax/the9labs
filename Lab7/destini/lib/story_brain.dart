import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    // 0
    Story(
      storyTitle:
          'Bạn là một anh thợ đốn củi. Trong lúc đang làm việc cạnh bờ sông, tay bạn trượt đi khiến chiếc rìu sắt cũ kỹ văng xuống dòng nước sâu thẳm. Bạn ngồi khóc bên bờ sông. Đột nhiên, Thần Sông nhô lên hold một chiếc Rìu Bạc và một chiếc Rìu Vàng rồi hỏi: "Đây có phải rìu của con không?"',
      choice1: 'Dạ không, rìu của con bằng sắt ạ!',
      choice2: 'Dạ đúng rồi! Cả hai chiếc đó đều là của con!',
    ),
    // 1
    Story(
      storyTitle:
          'Thần Sông mỉm cười hài lòng trước sự trung thực của bạn. Ngài vung tay biến chiếc rìu sắt cũ của bạn thành Rìu Kim Cương, nhưng lại bảo bạn phải giải một câu đố mới được cầm về.',
      choice1: 'Nhận lời giải đố để lấy Rìu Kim Cương.',
      choice2: 'Thôi thần cho con xin lại chiếc rìu sắt cũ xài cho quen tay là được rồi.',
    ),
    // 2
    Story(
      storyTitle:
          'Thần Sông biến sắc, mặt giận dữ sấm sét nổi lên: "Kẻ tham lam!". Ngài biến chiếc Rìu Vàng và Rìu Bạc thành hai con cá sấu khổng lồ lao lên bờ!',
      choice1: 'Nhảy xuống sông lặn trốn.',
      choice2: 'Trèo nhanh lên cây gõ củi gần đó.',
    ),
    // 3
    Story(
      storyTitle:
          'Bạn giải thành công câu đố siêu khó của Thần Sông. Ngài trao cho bạn Rìu Kim Cương cùng hai chiếc Rìu Vàng, Rìu Bạc. Bạn trở về làng và trở thành vị tỷ phú đốn củi giàu nhất vùng!',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    // 4
    Story(
      storyTitle:
          'Thần Sông gật đầu cảm động trước tính cách giản dị, không màng vật chất của bạn. Ngài trả lại Rìu Sắt kèm theo một túi tiền vàng thưởng cho tính khiêm tốn. Bạn sống một cuộc sống bình yên, hạnh phúc.',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    // 5
    Story(
      storyTitle:
          'Bạn lặn xuống sông nhưng quên mất mình không biết bơi. May mắn thay, Thần Sông vớt bạn lên bờ, tịch thu luôn chiếc Rìu Sắt cũ và đuổi bạn về nhà tay trắng.',
      choice1: 'Chơi lại',
      choice2: '',
    ),
    // 6
    Story(
      storyTitle:
          'Hai con cá sấu không trèo cây được nên đành bỏ đi. Bạn thoát chết nhưng chiếc Rìu Sắt đã vĩnh viễn nằm lại dưới đáy sông. Từ đó bạn phải chuyển sang nghề... đi hái rau muống.',
      choice1: 'Chơi lại',
      choice2: '',
    ),
  ];

  String getStory() {
    return _storyData[_storyNumber].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyNumber].choice1;
  }

  String getChoice2() {
    return _storyData[_storyNumber].choice2;
  }

  void nextStory(int choiceNumber) {
    switch (_storyNumber) {
      case 0:
        if (choiceNumber == 1) {
          _storyNumber = 1;
        } else {
          _storyNumber = 2;
        }
        break;
      case 1:
        if (choiceNumber == 1) {
          _storyNumber = 3;
        } else {
          _storyNumber = 4;
        }
        break;
      case 2:
        if (choiceNumber == 1) {
          _storyNumber = 5;
        } else {
          _storyNumber = 6;
        }
        break;
      default:
        restart();
    }
  }

  void restart() {
    _storyNumber = 0;
  }

  bool buttonShouldBeVisible() {
    return _storyNumber <= 2;
  }
}