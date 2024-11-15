enum OnboadingPagePositions{
  page1,
  page2,
  page3
}
extension OnboadingPagePositionsExtension on OnboadingPagePositions{
  String onboadingPageImage()
  {
    switch(this){
      case OnboadingPagePositions.page1:
        return "assets/images/onb1.png";
      case OnboadingPagePositions.page2:
        return "assets/images/onb2.png";
      case OnboadingPagePositions.page3:
        return "assets/images/onb3.png";
    }
  }
  String onboadingPageTitle()
  {
    switch(this){
      case OnboadingPagePositions.page1:
        return "Manage Tasks";
      case OnboadingPagePositions.page2:
        return "Create Daily Routine";
      case OnboadingPagePositions.page3:
        return "Organize Your Tasks";
    }
  }
  String onboadingPageContent()
  {
    switch(this){
      case OnboadingPagePositions.page1:
        return "You can easily manage all of your daily tasks in DoMe for free";
      case OnboadingPagePositions.page2:
        return "In Uptodo  you can create your personalized routine to stay productive";
      case OnboadingPagePositions.page3:
        return "You can organize your daily tasks by adding your tasks into separate categories";
    }
  }
}