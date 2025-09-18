# نظام شكاوى بيرقرين - Peregrine Complaints System

## Overview  
A comprehensive Flutter-based complaints management system with full Arabic RTL support and offline-first functionality. This project has been successfully imported from GitHub and configured to run in the Replit environment.

## Project Architecture
- **Type**: Flutter Web Application
- **Framework**: Flutter 3.32.0 with Material Design 3
- **State Management**: Riverpod for reactive state management  
- **Navigation**: go_router for declarative routing
- **Language Support**: Full Arabic RTL interface with Cairo and Roboto fonts
- **Database**: Drift (SQLite) for local data storage
- **Data Storage**: Local SQLite database with offline-first functionality

## Key Features
- **Offline-first operation**: All data stored locally using localStorage
- **Full Arabic RTL support**: Complete right-to-left interface with Arabic fonts
- **Three user roles**: Client, Support Committee, Coordination Committee
- **PIN-protected access**: SHA-256 encrypted PIN system for committees
- **Multi-step complaint form**: 5-step comprehensive complaint submission
- **Role-specific dashboards**: Customized dashboards with detailed statistics
- **Comprehensive complaint categories**: 40+ categories as per specifications
- **Export/Import functionality**: JSON backup system
- **Dark/Light theme**: Theme switching with persistent settings

## Technical Setup
- **Build System**: Flutter build web pipeline
- **Web Server**: Python HTTP server on port 5000 serving built Flutter web assets
- **Built Files**: Located in `peregrine_offline_complaints/build/web/` directory  
- **Deployment**: Configured for autoscale deployment target with build and run commands
- **Host Configuration**: Properly configured for Replit proxy environment

## Current Status
✅ Successfully running in Replit environment  
✅ All files properly served  
✅ Application initializing correctly  
✅ Data seeding working  
✅ Workflow configured on port 5000  
✅ Deployment configuration set up  

## File Structure
```
peregrine_offline_complaints/
├── web/
│   ├── index.html    # Main application interface
│   ├── app.js        # Application logic and data management
│   ├── styles.css    # Arabic RTL styling and themes
│   └── manifest.json # PWA configuration
├── pubspec.yaml      # Project metadata (not used for runtime)
└── README.md         # Detailed project documentation in Arabic
```

## Default Access
- **Support Committee PIN**: 1234
- **Coordination Committee PIN**: 5678

## Recent Changes
- **September 18, 2025**: Successfully imported Flutter project and configured for Replit
- Fixed Flutter version compatibility issues (CardTheme → CardThemeData)
- Built Flutter web application successfully
- Configured Flutter Web Server workflow on port 5000
- Set up deployment configuration with build and run commands
- Database tables temporarily commented out pending build_runner setup

## User Preferences
- The application is designed for Arabic-speaking users
- Fully offline-capable for environments without internet connectivity
- Focus on government/institutional complaint management workflows