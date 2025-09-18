# نظام شكاوى بيرقرين - Peregrine Complaints System

## Overview
A complete offline-first web complaints management system with full Arabic RTL support. This project was successfully imported from GitHub and configured to run in the Replit environment.

## Project Architecture
- **Type**: Static web application (HTML/CSS/JavaScript)
- **Framework**: Vanilla JavaScript with localStorage for offline-first functionality
- **Language Support**: Arabic RTL interface with local Arabic fonts
- **Data Storage**: Browser localStorage for complete offline functionality

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
- **Web Server**: Python HTTP server on port 5000
- **Files**: Located in `peregrine_offline_complaints/web/` directory
- **Deployment**: Configured for autoscale deployment target
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
- **September 18, 2025**: Successfully imported and configured for Replit
- Added missing manifest.json file for PWA functionality
- Configured proper static web server workflow
- Set up deployment configuration for production

## User Preferences
- The application is designed for Arabic-speaking users
- Fully offline-capable for environments without internet connectivity
- Focus on government/institutional complaint management workflows