import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDocPanel extends StatefulWidget {
  final String title;
  final String docContent;
  final String? imagePath;
  final List<String>? screenshots;

  const ProjectDocPanel({
    super.key,
    required this.title,
    required this.docContent,
    this.imagePath,
    this.screenshots,
  });

  @override
  State<ProjectDocPanel> createState() => _ProjectDocPanelState();
}

class _ProjectDocPanelState extends State<ProjectDocPanel> {
  final ScrollController _scrollController = ScrollController();

  // Regular expressions to detect store links
  final RegExp _appStoreRegex = RegExp(r'Appstore:\s+(https?://[^\s]+)');
  final RegExp _playStoreRegex = RegExp(r'Playstore:\s+(https?://[^\s]+)');

  // Extracted store links
  String? _appStoreLink;
  String? _playStoreLink;

  @override
  void initState() {
    super.initState();
    _extractStoreLinks();
  }

  void _extractStoreLinks() {
    List<String> lines = widget.docContent.split('\n');

    for (String line in lines) {
      if (_appStoreRegex.hasMatch(line)) {
        final match = _appStoreRegex.firstMatch(line)!;
        _appStoreLink = match.group(1);
      } else if (_playStoreRegex.hasMatch(line)) {
        final match = _playStoreRegex.firstMatch(line)!;
        _playStoreLink = match.group(1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/project/concentric_circle.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close button
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // Project image (if provided)
                if (widget.imagePath != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.imagePath!,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.image_not_supported,
                              color: Colors.white54,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Store buttons
                if (_appStoreLink != null || _playStoreLink != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        if (_playStoreLink != null)
                          Expanded(
                            child: _buildStoreButton(
                              'Play Store',
                              _playStoreLink!,
                              Icons.android,
                            ),
                          ),
                        if (_playStoreLink != null && _appStoreLink != null)
                          const SizedBox(width: 12),
                        if (_appStoreLink != null)
                          Expanded(
                            child: _buildStoreButton(
                              'App Store',
                              _appStoreLink!,
                              Icons.apple,
                            ),
                          ),
                      ],
                    ),
                  ),

                const SizedBox(height: 20),

                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildContentWidgets(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildContentWidgets() {
    List<Widget> widgets = [];
    List<String> lines = widget.docContent.split('\n');

    for (String line in lines) {
      // Handle screenshots section
      if (line.trim() == '📸 Screenshots') {
        widgets.add(const SizedBox(height: 16));
        widgets.add(
          const Text(
            '📸 Screenshots',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
        widgets.add(const SizedBox(height: 12));

        // Add horizontal list of screenshots if available
        if (widget.screenshots != null && widget.screenshots!.isNotEmpty) {
          widgets.add(_buildScreenshotsList());
        } else {
          widgets.add(
            const Text(
              'No screenshots available',
              style: TextStyle(
                color: Colors.white70,
                fontStyle: FontStyle.italic,
              ),
            ),
          );
        }

        widgets.add(const SizedBox(height: 16));
        continue;
      }

      // Skip store link lines
      if (_appStoreRegex.hasMatch(line) || _playStoreRegex.hasMatch(line)) {
        continue;
      }

      // Handle regular text
      widgets.add(_buildTextLine(line));
    }

    return widgets;
  }

  Widget _buildScreenshotsList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.screenshots!.length,
        itemBuilder: (context, index) {
          final path = widget.screenshots![index];
          final isNetwork = path.startsWith('http');

          return Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  isNetwork
                      ? Image.network(
                          path,
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _placeholderImage();
                          },
                        )
                      : Image.asset(
                          path,
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _placeholderImage();
                          },
                        ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white.withOpacity(0.2),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _placeholderImage() {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Icon(
        Icons.image_not_supported,
        color: Colors.white54,
        size: 50,
      ),
    );
  }

  Widget _buildTextLine(String text) {
    if (text.trim().isEmpty) {
      return const SizedBox(height: 8);
    }

    // Section headers
    if (text.startsWith('💡') ||
        text.startsWith('🧑‍💻') ||
        text.startsWith('🛠️') ||
        text.startsWith('📸') ||
        text.startsWith('📊') ||
        text.startsWith('🧰') ||
        text.startsWith('📣')) {
      return Padding(
        padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    // Client
    if (text.startsWith('Client:')) {
      return _iconLine(Icons.business, text);
    }

    // Role
    if (text.startsWith('Role:')) {
      return _iconLine(Icons.person, text);
    }

    // Platforms
    if (text.startsWith('Platforms:')) {
      return _iconLine(Icons.devices, text);
    }

    // Bullet points
    if (text.startsWith('•') || text.startsWith('-')) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
        child: Text(text, style: const TextStyle(color: Colors.white70)),
      );
    }

    // Highlights
    if (text.startsWith('🔄') ||
        text.startsWith('🚀') ||
        text.startsWith('🌐') ||
        text.startsWith('🔒') ||
        text.startsWith('🌦️') ||
        text.startsWith('🌋') ||
        text.startsWith('📧') ||
        text.startsWith('💬') ||
        text.startsWith('📱')) {
      return Padding(
        padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Text(text, style: const TextStyle(color: Colors.white70)),
    );
  }

  Widget _iconLine(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreButton(String storeName, String url, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: storeName == 'App Store'
              ? [Colors.black87, Colors.black54]
              : [Colors.green.shade800, Colors.green.shade600],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(
          storeName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => _launchURL(url),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not launch $url'),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
