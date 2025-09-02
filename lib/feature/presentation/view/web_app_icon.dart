import 'dart:html' as html;

void setFavicon(String iconPath) {
  final head = html.document.head!;

  // Remove existing favicon links
  final oldIcons = head.querySelectorAll("link[rel='icon']");
  for (var icon in oldIcons) {
    icon.remove();
  }

  // Create new favicon link
  final newIcon = html.LinkElement()
    ..rel = 'icon'
    ..type = 'image/png'
    ..href = iconPath;

  head.append(newIcon);
}
