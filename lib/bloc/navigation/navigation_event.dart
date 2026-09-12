abstract class NavigationEvent {
}
class NavigateToTabEvent extends NavigationEvent{
  final int tabIndex;
  NavigateToTabEvent({required this.tabIndex});
}
