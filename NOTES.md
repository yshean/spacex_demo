## Tips and tricks

- One class per file, preferably
- For common widgets and utilities, if there is a lot, put them into a separate package so they can be reused across different apps or packages.
- https://brickhub.dev/bricks/app_ui/0.0.4
- For UI packages, there are many ways to structure it. It depends on your need.
--project_name app
├── app_ui
│   ├── assets
│   │   └── fonts
│   │   │   └── .ttfs
│   ├── lib
│   │   ├── src
│   │   │   ├── layout
│   │   │   │   ├── breakpoints.dart
│   │   │   │   └── layout.dart
│   │   │   ├── typography
│   │   │   │   ├── font_weights.dart
│   │   │   │   ├── text_styles.dart
│   │   │   │   └── typography.dart
│   │   │   ├── widgets
│   │   │   │   ├── responsive_layout_builder.dart
│   │   │   │   └── widgets.dart
│   │   │   ├── colors.dart
│   │   │   └── theme.dart
│   │   └── app_ui.dart
│   └──
└── ...
- You can use this structure to put the design system and branding of your app. Most likely they will be shared across widgets and packages related to your branding.

- Each feature does not have to be in a separate Dart package, but it's still good to think of them that way (help us to isolate the responsibilities of each feature).

## Basic structure of a feature (say `home`)
- lib
├── home
│   ├── home.dart // Barrel file
│   ├── view
│   │   └── home_page.dart // Contains your usage of widgets/*, and possibly BlocProvider(s)
│   ├── widgets
│   │   ├── widgets.dart // Barrel file
│   │   │── home_page_content.dart // Might contain other widgets, and possibly consume blocs/cubits
│   │   │── spacex_category_card.dart
│   ├── cubit // optional: or bloc, treat this as your 'view model'
│   │   ├── cubit.dart // Barrel file, can have multiple cubits
│   │   │── home_cubit.dart // Contain all logics related to your feature/view
│   │   │── home_state.dart