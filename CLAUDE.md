# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This directory contains static HTML mockups and demonstrations for the DAFCG Benchmarking Study project. All files are standalone HTML documents with embedded CSS and JavaScript, designed to showcase different aspects of the study workflow, participant journey, and technical architecture.

## Project Structure

```
dafcg-mockups/
├── index.html                    # Main navigation hub for all mockups
├── participant-journey.html      # Interactive participant journey flowchart
├── dafcg-roadmap-pillars.html   # Project roadmap timeline (5 pillars)
├── typeform-mockup.html         # Complete survey experience demo
├── project-gantt.html           # Interactive Gantt chart timeline
├── tech-stack-visual.html       # Technical architecture visualization
├── fonts/                       # Cooper Hewitt brand font files
│   └── CooperHewitt-Bold.woff2
└── CLAUDE.md                    # This file
```

## Brand Guidelines

### Color Palette
- **Primary Purple**: `#391892` (backgrounds, primary brand color)
- **Secondary Purple**: `#6A44AE` (accents, metadata text)
- **Success Green**: `#18DD89` (CTAs, positive actions, borders)
- **Text Dark**: `#212C40` (main content text)
- **Background Gray**: `#F7F7F7` (card backgrounds)
- **Border Gray**: `#D1D2D2` (card borders)

### Typography
- **Brand Font**: Cooper Hewitt Bold (for headings, loaded via @font-face)
- **Body Font**: Inter (system fallbacks: -apple-system, BlinkMacSystemFont, 'Segoe UI')
- **Font Sizes**: 2.5rem (h1), 1.5rem (h2), 1.2rem (subheadings), 1rem (body)

### Component Patterns
- **Cards**: Rounded corners (15px), shadow elevation, hover animations with translateY(-4px)
- **Buttons**: Multiple variants (primary, secondary, accent) with hover states
- **Status Badges**: Color-coded with transparency (live, demo, interactive)
- **Grid Layout**: Responsive auto-fit grid with 350px minimum column width

## Development Guidelines

### File Organization
- All mockups are self-contained HTML files with embedded styles
- No external dependencies except Google Fonts and brand font files
- Each file follows consistent structure: head > styles > body content

### Responsive Design
- Mobile-first approach with `@media (max-width: 768px)` breakpoints  
- Grid collapses to single column on mobile
- Reduced padding and font sizes for mobile viewport

### Interactive Elements
- Hover states on all clickable elements
- Smooth transitions (0.3s ease) for interactive feedback
- Box shadow elevations for depth and engagement

## Common Development Tasks

### Adding New Mockups
1. Create new HTML file following existing naming pattern
2. Copy head section from `index.html` for consistent branding
3. Use established CSS class patterns for cards, buttons, text
4. Add entry to main navigation in `index.html`
5. Test responsive behavior across viewport sizes

### Brand Consistency
- Always use Cooper Hewitt font for headings via existing @font-face
- Maintain color palette consistency across all new elements
- Follow established button and card styling patterns
- Ensure proper contrast ratios for accessibility

### File Linking
- Use relative paths for internal navigation
- Link to parent project documentation with `../docs/` paths
- External links (like live deployed sites) should open in new tabs

## Architecture Notes

### Static Nature
- All files are standalone HTML with no build process required
- No package managers, dependencies, or compilation steps needed  
- Can be opened directly in browsers for development and testing

### Font Loading
- Cooper Hewitt font files must be present in `./fonts/` directory
- Uses `font-display: swap` for optimal loading performance
- Includes proper fallbacks to system fonts

### Cross-Browser Compatibility
- Uses modern CSS Grid with fallbacks
- Includes vendor prefixes where necessary (-webkit-, -moz-)
- Tested across major browsers (Chrome, Firefox, Safari, Edge)

## Related Documentation

This mockups directory is part of the larger DAFCG Benchmarking Study project. For complete context:

- **Main Project**: `../CLAUDE.md` - Full project documentation
- **Business Context**: `../docs/business/` - Study requirements and criteria  
- **Technical Docs**: `../docs/technical/` - Architecture and setup guides
- **Live Deployment**: https://benchmark-2026-landing.pages.dev/