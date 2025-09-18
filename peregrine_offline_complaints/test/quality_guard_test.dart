import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Quality Guard Tests', () {
    test('No empty Text widgets should exist in codebase', () async {
      final libDir = Directory('lib');
      expect(libDir.existsSync(), true, reason: 'lib directory should exist');
      
      final List<String> violations = [];
      
      await for (final file in libDir.list(recursive: true)) {
        if (file is File && file.path.endsWith('.dart')) {
          final content = await file.readAsString();
          final lines = content.split('\n');
          
          for (int i = 0; i < lines.length; i++) {
            final line = lines[i].trim();
            // Check for empty Text widgets
            if (line.contains('Text("")') || 
                line.contains("Text('')") || 
                line.contains('Text("   ")') ||
                line.contains("Text('   ')")) {
              violations.add('${file.path}:${i + 1} - Empty Text widget found: $line');
            }
          }
        }
      }
      
      if (violations.isNotEmpty) {
        fail('Found empty Text widgets:\n${violations.join('\n')}');
      }
    });
  });
}