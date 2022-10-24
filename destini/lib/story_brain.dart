import 'story.dart';

class StoryBrain {
  List<Story> _storyData = [
    Story(
        'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        'I\'ll hop in. Thanks for the help!',
        'Better ask him if he\'s a murderer first.'),
    Story(
        'He nods slowly, unphased by the question.',
        'At least he\'s honest. I\'ll climb in.',
        'Wait, I know how to change a tire.'),
    Story(
        'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        'I love Elton John! Hand him the cassette tape.',
        'It\'s him or me! You take the knife and stab him.'),
    Story(
        'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        'Restart',
        ''),
    Story(
        'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        'Restart',
        ''),
    Story(
        'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        'Restart',
        '')
  ];

  getStory() {
    return _storyData[storyNumber].storyTitle;
  }

  getChoice1() {
    return _storyData[storyNumber].choice1;
  }

  getChoice2() {
    return _storyData[storyNumber].choice2;
  }

  int _storyNumber = 0;

  int get storyNumber => _storyNumber;

  set storyNumber(int storyNumber) {
    _storyNumber = storyNumber;
  }

  void nextStory(int choiceNumber) {
    List<int> storyEndNum = [3, 4, 5];

    if (storyEndNum.contains(storyNumber)) {
      restart();
    } else {
      if (choiceNumber == 1) {
        if (storyNumber == 0) {
          storyNumber = 2;
        } else if (storyNumber == 1) {
          storyNumber = 2;
        } else if (storyNumber == 2) {
          storyNumber = 5;
        }
      } else if (choiceNumber == 2) {
        if (storyNumber == 0) {
          storyNumber = 1;
        } else if (storyNumber == 1) {
          storyNumber = 3;
        } else if (storyNumber == 2) {
          storyNumber = 4;
        }
      }
    }
  }

  bool buttonShouldBeVisible() {
    List _listNum = [0, 1, 2];

    if (_listNum.contains(_storyNumber)) {
      return true;
    } else {
      return false;
    }
  }

  void restart() {
    storyNumber = 0;
  }
}
