import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/personal_info.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        children: [
          Text(
            'My Projects',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Here are some of my recent projects',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 40 : 60),
          LayoutBuilder(
            builder: (context, constraints) {
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: ResponsiveBreakpoints.of(context)
                          .largerThan(DESKTOP)
                      ? 4
                      : ResponsiveBreakpoints.of(context).largerThan(TABLET)
                          ? 3
                          : ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                              ? 2
                              : 1,
                  childAspectRatio: isMobile ? 0.65 : 0.75,
                  crossAxisSpacing: isMobile ? 8 : 16,
                  mainAxisSpacing: isMobile ? 8 : 16,
                ),
                itemCount: PersonalInfo.projects.length,
                itemBuilder: (context, index) {
                  final project = PersonalInfo.projects[index];
                  return _ProjectCard(
                    title: project['title'] as String,
                    description: project['description'] as String,
                    techStack: project['techStack'] as List<String>,
                    imageUrl: project['imageUrl'] as String,
                    githubUrl: project['githubUrl'] as String,
                    demoUrl: project['demoUrl'] as String,
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

// class _ProjectCard extends StatelessWidget {
//   final String title;
//   final String description;
//   final List<String> techStack;
//   final String imageUrl;
//   final String githubUrl;
//   final String demoUrl;

//   const _ProjectCard({
//     required this.title,
//     required this.description,
//     required this.techStack,
//     required this.imageUrl,
//     required this.githubUrl,
//     required this.demoUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isMobile = ResponsiveBreakpoints.of(context).isMobile;

//     return Container(
//       margin: EdgeInsets.fromLTRB(0, 0,0,100),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//             child: AspectRatio(
//               aspectRatio: 16 / 9,
//               child: Stack(
//                 children: [
//                   Image.network(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                     width: double.infinity,
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 6, vertical: 3),
//                       decoration: BoxDecoration(
//                         color: Colors.black.withOpacity(0.7),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const FaIcon(
//                             FontAwesomeIcons.code,
//                             size: 10,
//                             color: Colors.white,
//                           ),
//                           const SizedBox(width: 4),
//                           Text(
//                             techStack[0],
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 10,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(isMobile ? 6 : 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: isMobile ? 14 : 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 6),
//                 Text(
//                   description,
//                   style: TextStyle(
//                     fontSize: isMobile ? 10 : 12,
//                     color: Colors.grey[600],
//                     height: 1.3,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 8),
//                 Wrap(
//                   spacing: 6,
//                   runSpacing: 6,
//                   children: techStack.map((tech) {
//                     return Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: Colors.blue.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         tech,
//                         style: TextStyle(
//                           color: Colors.blue[700],
//                           fontSize: isMobile ? 8 : 10,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//                 const SizedBox(height: 18),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: ElevatedButton.icon(
//                         onPressed: () => _launchUrl(githubUrl),
//                         icon: FaIcon(
//                           FontAwesomeIcons.github,
//                           size: isMobile ? 10 : 12,
//                         ),
//                         label: Text(
//                           'Code',
//                           style: TextStyle(fontSize: isMobile ? 10 : 12),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           foregroundColor: Colors.white,
//                           padding: EdgeInsets.symmetric(
//                             vertical: isMobile ? 6 : 8,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: OutlinedButton.icon(
//                         onPressed: () => _launchUrl(demoUrl),
//                         icon: FaIcon(
//                           FontAwesomeIcons.externalLinkAlt,
//                           size: isMobile ? 10 : 12,
//                         ),
//                         label: Text(
//                           'Demo',
//                           style: TextStyle(fontSize: isMobile ? 10 : 12),
//                         ),
//                         style: OutlinedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(
//                             vertical: isMobile ? 6 : 8,
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _launchUrl(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     }
//   }
// }




class _ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> techStack;
  final String imageUrl;
  final String githubUrl;
  final String demoUrl;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.techStack,
    required this.imageUrl,
    required this.githubUrl,
    required this.demoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return Card(
      margin: EdgeInsets.symmetric(vertical: isMobile ? 82:  42), // Reduced & elegant spacing
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  // Tech tag top right
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const FaIcon(FontAwesomeIcons.code, size: 10, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            techStack.isNotEmpty ? techStack[0] : '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: isMobile ? 10 : 12,
                    color: Colors.grey[700],
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),

                // Tech tags
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: techStack.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tech,
                        style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: isMobile ? 10 : 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                 SizedBox(height: isMobile?30: 20),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _launchUrl(githubUrl),
                        icon: FaIcon(
                          FontAwesomeIcons.github,
                          size: isMobile ? 12 : 14,
                        ),
                        label: Text(
                          'Code',
                          style: TextStyle(fontSize: isMobile ? 12 : 14),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: isMobile ? 6 : 8,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => _launchUrl(demoUrl),
                        icon: FaIcon(
                          FontAwesomeIcons.externalLinkAlt,
                          size: isMobile ? 12 : 14,
                        ),
                        label: Text(
                          'Demo',
                          style: TextStyle(fontSize: isMobile ? 12 : 14),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            vertical: isMobile ? 8 : 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
