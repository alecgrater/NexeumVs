# NexeumVs - Complete Directory Structure & Configuration Guide

## 📁 Full Project Directory Structure

```
NexeumVs/
├── 📄 project.godot                    # Godot project configuration
├── 📄 export_presets.cfg               # Export platform configurations
├── 📄 .gitignore                       # Git ignore patterns
├── 📄 .gitattributes                   # Git LFS and line ending rules
├── 📄 README.md                        # Project overview
├── 📄 LICENSE                          # Project license
├── 📄 CHANGELOG.md                     # Version history
├── 📄 CONTRIBUTING.md                  # Contribution guidelines
│
├── 📁 config/                          # 🔧 Configuration Management
│   ├── 📁 game/                        # Game-specific configurations
│   │   ├── 📄 combat_settings.json     # Combat system parameters
│   │   ├── 📄 movement_settings.json   # Movement mechanics config
│   │   ├── 📄 building_settings.json   # Building system config
│   │   ├── 📄 balance_config.json      # Game balance parameters
│   │   └── 📄 default_keybinds.json    # Default input mappings
│   │
│   ├── 📁 network/                     # Network configurations
│   │   ├── 📄 server_config.json       # Server settings
│   │   ├── 📄 client_config.json       # Client network settings
│   │   └── 📄 matchmaking_config.json  # Matchmaking parameters
│   │
│   ├── 📁 audio/                       # Audio configurations
│   │   ├── 📄 audio_settings.json      # Audio system config
│   │   ├── 📄 music_config.json        # Music playback settings
│   │   └── 📄 sfx_config.json          # Sound effects config
│   │
│   ├── 📁 graphics/                    # Graphics configurations
│   │   ├── 📄 render_settings.json     # Rendering pipeline config
│   │   ├── 📄 quality_presets.json     # Graphics quality presets
│   │   └── 📄 platform_overrides.json  # Platform-specific settings
│   │
│   └── 📁 development/                 # Development configurations
│       ├── 📄 debug_config.json        # Debug mode settings
│       ├── 📄 test_config.json         # Testing configurations
│       └── 📄 build_config.json        # Build pipeline settings
│
├── 📁 src/                             # 💻 Source Code
│   ├── 📁 core/                        # Core game systems
│   │   ├── 📄 game_manager.gd          # Main game state management
│   │   ├── 📄 scene_manager.gd         # Scene transitions and loading
│   │   ├── 📄 input_manager.gd         # Input handling and mapping
│   │   ├── 📄 settings_manager.gd      # Configuration management
│   │   ├── 📄 event_bus.gd             # Global event system
│   │   ├── 📄 resource_manager.gd      # Asset loading and caching
│   │   └── 📄 performance_monitor.gd   # Performance tracking
│   │
│   ├── 📁 systems/                     # Game-specific systems
│   │   ├── 📁 player/                  # Player-related systems
│   │   │   ├── 📄 player_controller.gd # Main player controller
│   │   │   ├── 📄 player_stats.gd      # Player statistics
│   │   │   ├── 📄 player_state.gd      # Player state machine
│   │   │   ├── 📄 player_input.gd      # Player input handling
│   │   │   └── 📄 player_animation.gd  # Animation controller
│   │   │
│   │   ├── 📁 combat/                  # Combat mechanics
│   │   │   ├── 📄 combat_manager.gd    # Combat system coordinator
│   │   │   ├── 📄 hit_detection.gd     # Hit detection and collision
│   │   │   ├── 📄 damage_system.gd     # Damage calculation
│   │   │   ├── 📄 combo_system.gd      # Combo mechanics
│   │   │   ├── 📄 attack_data.gd       # Attack definitions
│   │   │   ├── 📄 health_system.gd     # Health management
│   │   │   └── 📄 combat_effects.gd    # Visual/audio feedback
│   │   │
│   │   ├── 📁 building/                # Building system
│   │   │   ├── 📄 building_manager.gd  # Building system coordinator
│   │   │   ├── 📄 grid_system.gd       # Grid-based placement
│   │   │   ├── 📄 resource_system.gd   # Building resources
│   │   │   ├── 📄 edit_system.gd       # Building editing
│   │   │   ├── 📄 validation_system.gd # Placement validation
│   │   │   ├── 📁 pieces/              # Building piece types
│   │   │   │   ├── 📄 base_piece.gd    # Base building piece
│   │   │   │   ├── 📄 wall_piece.gd    # Wall building piece
│   │   │   │   ├── 📄 floor_piece.gd   # Floor building piece
│   │   │   │   ├── 📄 ramp_piece.gd    # Ramp building piece
│   │   │   │   └── 📄 custom_piece.gd  # Custom building pieces
│   │   │   └── 📄 building_preview.gd  # Preview system
│   │   │
│   │   ├── 📁 movement/                # Movement mechanics
│   │   │   ├── 📄 movement_controller.gd # Movement coordinator
│   │   │   ├── 📄 dash_system.gd       # Dash mechanics
│   │   │   ├── 📄 wall_kick_system.gd  # Wall-kick mechanics
│   │   │   ├── 📄 momentum_system.gd   # Momentum-based movement
│   │   │   ├── 📄 ground_detection.gd  # Ground/surface detection
│   │   │   └── 📄 movement_effects.gd  # Movement visual effects
│   │   │
│   │   ├── 📁 camera/                  # Camera systems
│   │   │   ├── 📄 camera_controller.gd # Third-person camera
│   │   │   ├── 📄 camera_shake.gd      # Screen shake effects
│   │   │   ├── 📄 camera_transitions.gd # Camera transitions
│   │   │   └── 📄 camera_collision.gd  # Camera collision handling
│   │   │
│   │   └── 📁 audio/                   # Audio management
│   │       ├── 📄 audio_manager.gd     # Audio system coordinator
│   │       ├── 📄 music_player.gd      # Background music
│   │       ├── 📄 sfx_player.gd        # Sound effects
│   │       └── 📄 audio_mixer.gd       # Audio mixing and levels
│   │
│   ├── 📁 ui/                          # User interface
│   │   ├── 📁 menus/                   # Menu systems
│   │   │   ├── 📄 main_menu.gd         # Main menu controller
│   │   │   ├── 📄 settings_menu.gd     # Settings menu
│   │   │   ├── 📄 pause_menu.gd        # Pause menu
│   │   │   ├── 📄 matchmaking_menu.gd  # Matchmaking interface
│   │   │   └── 📄 results_menu.gd      # Match results screen
│   │   │
│   │   ├── 📁 hud/                     # Heads-up display
│   │   │   ├── 📄 game_hud.gd          # Main game HUD
│   │   │   ├── 📄 health_bar.gd        # Health display
│   │   │   ├── 📄 building_ui.gd       # Building interface
│   │   │   ├── 📄 combat_ui.gd         # Combat feedback UI
│   │   │   └── 📄 minimap.gd           # Minimap display
│   │   │
│   │   └── 📁 components/              # Reusable UI components
│   │       ├── 📄 button_component.gd  # Custom button
│   │       ├── 📄 slider_component.gd  # Custom slider
│   │       ├── 📄 progress_bar.gd      # Progress bar component
│   │       └── 📄 notification.gd      # Notification system
│   │
│   ├── 📁 network/                     # Multiplayer networking
│   │   ├── 📄 network_manager.gd       # Network system coordinator
│   │   ├── 📄 client_manager.gd        # Client-side networking
│   │   ├── 📄 server_manager.gd        # Server-side networking
│   │   ├── 📄 state_synchronizer.gd    # State synchronization
│   │   ├── 📄 packet_manager.gd        # Packet handling
│   │   ├── 📄 matchmaking.gd           # Matchmaking system
│   │   └── 📄 lag_compensation.gd      # Lag compensation
│   │
│   └── 📁 utils/                       # Utility functions
│       ├── 📄 math_utils.gd            # Mathematical utilities
│       ├── 📄 debug_utils.gd           # Debug helpers
│       ├── 📄 file_utils.gd            # File operations
│       ├── 📄 string_utils.gd          # String manipulation
│       ├── 📄 constants.gd             # Game constants
│       └── 📄 extensions.gd            # GDScript extensions
│
├── 📁 assets/                          # 🎨 Game Assets
│   ├── 📁 models/                      # 3D models
│   │   ├── 📁 characters/              # Character models
│   │   │   ├── 📄 player_model.fbx     # Main player model
│   │   │   ├── 📁 animations/          # Character animations
│   │   │   │   ├── 📄 idle.fbx         # Idle animation
│   │   │   │   ├── 📄 walk.fbx         # Walking animation
│   │   │   │   ├── 📄 run.fbx          # Running animation
│   │   │   │   ├── 📄 jump.fbx         # Jumping animation
│   │   │   │   ├── 📄 dash.fbx         # Dash animation
│   │   │   │   ├── 📄 wall_kick.fbx    # Wall-kick animation
│   │   │   │   ├── 📄 attack_basic.fbx # Basic attack
│   │   │   │   ├── 📄 attack_combo.fbx # Combo attacks
│   │   │   │   └── 📄 death.fbx        # Death animation
│   │   │   └── 📄 character_rig.fbx    # Character armature
│   │   │
│   │   ├── 📁 building_pieces/         # Building components
│   │   │   ├── 📄 wall_basic.fbx       # Basic wall piece
│   │   │   ├── 📄 wall_window.fbx      # Wall with window
│   │   │   ├── 📄 wall_door.fbx        # Wall with door
│   │   │   ├── 📄 floor_basic.fbx      # Basic floor piece
│   │   │   ├── 📄 ramp_basic.fbx       # Basic ramp piece
│   │   │   ├── 📄 stairs.fbx           # Stair piece
│   │   │   └── 📄 roof.fbx             # Roof piece
│   │   │
│   │   └── 📁 environment/             # Environment models
│   │       ├── 📄 arena_base.fbx       # Arena foundation
│   │       ├── 📄 terrain.fbx          # Terrain mesh
│   │       ├── 📄 props.fbx            # Environmental props
│   │       └── 📄 skybox.fbx           # Skybox model
│   │
│   ├── 📁 textures/                    # Texture files
│   │   ├── 📁 characters/              # Character textures
│   │   │   ├── 📄 player_diffuse.png   # Player base texture
│   │   │   ├── 📄 player_normal.png    # Player normal map
│   │   │   └── 📄 player_roughness.png # Player roughness map
│   │   │
│   │   ├── 📁 building_pieces/         # Building textures
│   │   │   ├── 📄 wall_diffuse.png     # Wall base texture
│   │   │   ├── 📄 floor_diffuse.png    # Floor base texture
│   │   │   └── 📄 ramp_diffuse.png     # Ramp base texture
│   │   │
│   │   ├── 📁 environment/             # Environment textures
│   │   │   ├── 📄 ground_diffuse.png   # Ground texture
│   │   │   ├── 📄 sky_hdri.exr         # Sky HDRI
│   │   │   └── 📄 props_atlas.png      # Props texture atlas
│   │   │
│   │   └── 📁 ui/                      # UI textures
│   │       ├── 📄 button_normal.png    # Button normal state
│   │       ├── 📄 button_hover.png     # Button hover state
│   │       ├── 📄 button_pressed.png   # Button pressed state
│   │       ├── 📄 health_bar.png       # Health bar texture
│   │       └── 📄 icons_atlas.png      # UI icons atlas
│   │
│   ├── 📁 audio/                       # Audio files
│   │   ├── 📁 music/                   # Background music
│   │   │   ├── 📄 menu_theme.ogg       # Main menu music
│   │   │   ├── 📄 combat_theme.ogg     # Combat music
│   │   │   ├── 📄 victory_theme.ogg    # Victory music
│   │   │   └── 📄 ambient_loop.ogg     # Ambient background
│   │   │
│   │   ├── 📁 sfx/                     # Sound effects
│   │   │   ├── 📁 combat/              # Combat sounds
│   │   │   │   ├── 📄 hit_impact.wav   # Hit impact sound
│   │   │   │   ├── 📄 sword_swing.wav  # Sword swing sound
│   │   │   │   ├── 📄 block.wav        # Block sound
│   │   │   │   └── 📄 critical_hit.wav # Critical hit sound
│   │   │   │
│   │   │   ├── 📁 movement/            # Movement sounds
│   │   │   │   ├── 📄 footstep.wav     # Footstep sound
│   │   │   │   ├── 📄 jump.wav         # Jump sound
│   │   │   │   ├── 📄 dash.wav         # Dash sound
│   │   │   │   ├── 📄 wall_kick.wav    # Wall-kick sound
│   │   │   │   └── 📄 landing.wav      # Landing sound
│   │   │   │
│   │   │   ├── 📁 building/            # Building sounds
│   │   │   │   ├── 📄 place_piece.wav  # Place building piece
│   │   │   │   ├── 📄 destroy_piece.wav # Destroy building piece
│   │   │   │   ├── 📄 edit_piece.wav   # Edit building piece
│   │   │   │   └── 📄 invalid_place.wav # Invalid placement
│   │   │   │
│   │   │   └── 📁 ui/                  # UI sounds
│   │   │       ├── 📄 button_click.wav # Button click
│   │   │       ├── 📄 button_hover.wav # Button hover
│   │   │       ├── 📄 menu_open.wav    # Menu open
│   │   │       ├── 📄 menu_close.wav   # Menu close
│   │   │       └── 📄 notification.wav # Notification sound
│   │   │
│   │   └── 📁 voice/                   # Voice lines
│   │       ├── 📄 victory_line.ogg     # Victory voice line
│   │       ├── 📄 defeat_line.ogg      # Defeat voice line
│   │       └── 📄 taunt_lines.ogg      # Taunt voice lines
│   │
│   ├── 📁 materials/                   # Material resources
│   │   ├── 📁 character_materials/     # Character materials
│   │   │   ├── 📄 player_material.tres # Player material
│   │   │   └── 📄 player_outline.tres  # Player outline material
│   │   │
│   │   ├── 📁 building_materials/      # Building materials
│   │   │   ├── 📄 wall_material.tres   # Wall material
│   │   │   ├── 📄 floor_material.tres  # Floor material
│   │   │   └── 📄 ramp_material.tres   # Ramp material
│   │   │
│   │   └── 📁 environment_materials/   # Environment materials
│   │       ├── 📄 ground_material.tres # Ground material
│   │       ├── 📄 sky_material.tres    # Sky material
│   │       └── 📄 water_material.tres  # Water material
│   │
│   ├── 📁 particles/                   # Particle effects
│   │   ├── 📄 hit_sparks.tres          # Hit impact particles
│   │   ├── 📄 dash_trail.tres          # Dash trail effect
│   │   ├── 📄 building_dust.tres       # Building placement dust
│   │   └── 📄 destruction_debris.tres  # Destruction particles
│   │
│   └── 📁 fonts/                       # Font files
│       ├── 📄 ui_font_regular.ttf      # Regular UI font
│       ├── 📄 ui_font_bold.ttf         # Bold UI font
│       ├── 📄 hud_font.ttf             # HUD font
│       └── 📄 title_font.ttf           # Title/header font
│
├── 📁 scenes/                          # 🎬 Godot Scenes
│   ├── 📁 main/                        # Main scenes
│   │   ├── 📄 Main.tscn                # Entry point scene
│   │   ├── 📄 GameManager.tscn         # Game management scene
│   │   ├── 📄 NetworkManager.tscn      # Network handling scene
│   │   └── 📄 AudioManager.tscn        # Audio management scene
│   │
│   ├── 📁 gameplay/                    # Gameplay scenes
│   │   ├── 📄 Arena.tscn               # Main arena scene
│   │   ├── 📄 Player.tscn              # Player character scene
│   │   ├── 📄 BuildingPiece.tscn       # Building piece template
│   │   ├── 📄 CombatEffects.tscn       # Combat visual effects
│   │   ├── 📄 Camera.tscn              # Camera system scene
│   │   └── 📄 GameHUD.tscn             # Game HUD scene
│   │
│   ├── 📁 ui/                          # UI scenes
│   │   ├── 📄 MainMenu.tscn            # Main menu scene
│   │   ├── 📄 SettingsMenu.tscn        # Settings menu scene
│   │   ├── 📄 PauseMenu.tscn           # Pause menu scene
│   │   ├── 📄 MatchmakingMenu.tscn     # Matchmaking interface
│   │   ├── 📄 ResultsScreen.tscn       # Match results scene
│   │   └── 📄 LoadingScreen.tscn       # Loading screen scene
│   │
│   └── 📁 test/                        # Test scenes
│       ├── 📄 MovementTest.tscn        # Movement testing scene
│       ├── 📄 CombatTest.tscn          # Combat testing scene
│       ├── 📄 BuildingTest.tscn        # Building testing scene
│       ├── 📄 NetworkTest.tscn         # Network testing scene
│       └── 📄 PerformanceTest.tscn     # Performance testing scene
│
├── 📁 scripts/                         # 📜 Reusable Scripts
│   ├── 📁 autoload/                    # Autoload scripts
│   │   ├── 📄 GameGlobals.gd           # Global variables and constants
│   │   ├── 📄 EventBus.gd              # Global event system
│   │   ├── 📄 SceneTransition.gd       # Scene transition manager
│   │   └── 📄 SaveSystem.gd            # Save/load system
│   │
│   ├── 📁 components/                  # Reusable components
│   │   ├── 📄 Health.gd                # Health component
│   │   ├── 📄 Damageable.gd            # Damageable component
│   │   ├── 📄 Interactable.gd          # Interactable component
│   │   ├── 📄 StateMachine.gd          # State machine component
│   │   └── 📄 Timer.gd                 # Timer component
│   │
│   └── 📁 interfaces/                  # Interface definitions
│       ├── 📄 IDamageable.gd           # Damageable interface
│       ├── 📄 IBuildable.gd            # Buildable interface
│       ├── 📄 INetworkSyncable.gd      # Network syncable interface
│       └── 📄 IInteractable.gd         # Interactable interface
│
├── 📁 resources/                       # 📦 Game Resources
│   ├── 📁 game_data/                   # Game configuration resources
│   │   ├── 📄 player_stats.tres        # Player statistics resource
│   │   ├── 📄 combat_settings.tres     # Combat settings resource
│   │   ├── 📄 building_config.tres     # Building configuration resource
│   │   └── 📄 balance_data.tres        # Game balance resource
│   │
│   ├── 📁 themes/                      # UI themes
│   │   ├── 📄 main_theme.tres          # Main UI theme
│   │   ├── 📄 hud_theme.tres           # HUD theme
│   │   └── 📄 menu_theme.tres          # Menu theme
│   │
│   └── 📁 input_maps/                  # Input configurations
│       ├── 📄 default_input.tres       # Default input map
│       ├── 📄 controller_input.tres    # Controller input map
│       └── 📄 custom_input.tres        # Custom input map
│
├── 📁 addons/                          # 🔌 Godot Plugins
│   ├── 📁 networking_plugin/           # Custom networking plugin
│   ├── 📁 debug_tools/                 # Debug tools plugin
│   └── 📁 performance_profiler/        # Performance profiling plugin
│
├── 📁 exports/                         # 📤 Build Outputs
│   ├── 📁 windows/                     # Windows builds
│   ├── 📁 linux/                       # Linux builds
│   ├── 📁 mac/                         # macOS builds
│   ├── 📁 web/                         # Web/HTML5 builds
│   ├── 📁 android/                     # Android builds
│   └── 📁 ios/                         # iOS builds
│
├── 📁 docs/                            # 📚 Documentation
│   ├── 📁 api/                         # Code documentation
│   │   ├── 📄 combat_system_api.md     # Combat system API
│   │   ├── 📄 building_system_api.md   # Building system API
│   │   └── 📄 network_api.md           # Network API
│   │
│   ├── 📁 design/                      # Design documents
│   │   ├── 📄 game_design_document.md  # Game design document
│   │   ├── 📄 technical_design.md      # Technical design document
│   │   └── 📄 art_style_guide.md       # Art style guide
│   │
│   └── 📁 tutorials/                   # Development guides
│       ├── 📄 setup_guide.md           # Setup guide
│       ├── 📄 building_guide.md        # Building system guide
│       └── 📄 multiplayer_guide.md     # Multiplayer guide
│
├── 📁 tests/                           # 🧪 Testing
│   ├── 📁 unit/                        # Unit tests
│   │   ├── 📄 test_combat_system.gd    # Combat system tests
│   │   ├── 📄 test_building_system.gd  # Building system tests
│   │   └── 📄 test_movement_system.gd  # Movement system tests
│   │
│   ├── 📁 integration/                 # Integration tests
│   │   ├── 📄 test_player_combat.gd    # Player combat integration
│   │   └── 📄 test_multiplayer.gd      # Multiplayer integration
│   │
│   └── 📁 performance/                 # Performance tests
│       ├── 📄 test_rendering.gd        # Rendering performance
│       └── 📄 test_networking.gd       # Network performance
│
└── 📁 tools/                           # 🛠️ Development Tools
    ├── 📁 asset_pipeline/              # Asset processing tools
    │   ├── 📄 model_importer.gd        # Model import automation
    │   ├── 📄 texture_processor.gd     # Texture processing
    │   └── 📄 audio_converter.gd       # Audio format conversion
    │
    ├── 📁 build_scripts/               # Build automation
    │   ├── 📄 build_all_platforms.sh   # Multi-platform build script
    │   ├── 📄 deploy_script.sh         # Deployment script
    │   └── 📄 version_bump.sh          # Version management
    │
    └── 📁 automation/                  # Development automation
        ├── 📄 code_formatter.gd        # Code formatting tool
        ├── 📄 asset_validator.gd       # Asset validation
        └── 📄 performance_profiler.gd  # Performance profiling
```

---

## 🔧 Configuration Management Strategy

### Configuration File Organization

The [`config/`](config/:1) directory uses a hierarchical structure to organize different types of configurations:

#### 1. **Game Configurations** ([`config/game/`](config/game/:1))
Contains gameplay-related settings that affect game mechanics and balance.

**Example: [`combat_settings.json`](config/game/combat_settings.json:1)**
```json
{
  "base_damage": 25,
  "critical_multiplier": 1.5,
  "combo_window": 0.8,
  "hit_stun_duration": 0.3,
  "block_damage_reduction": 0.7,
  "max_combo_count": 5,
  "damage_scaling": {
    "combo_2": 0.9,
    "combo_3": 0.8,
    "combo_4": 0.7,
    "combo_5": 0.6
  }
}
```

**Example: [`movement_settings.json`](config/game/movement_settings.json:1)**
```json
{
  "walk_speed": 5.0,
  "run_speed": 8.0,
  "jump_force": 12.0,
  "dash_force": 15.0,
  "dash_cooldown": 1.5,
  "wall_kick_force": 10.0,
  "momentum_decay": 0.95,
  "air_control": 0.3,
  "gravity": 25.0
}
```

#### 2. **Network Configurations** ([`config/network/`](config/network/:1))
Handles multiplayer networking settings.

**Example: [`server_config.json`](config/network/server_config.json:1)**
```json
{
  "max_players": 2,
  "tick_rate": 60,
  "timeout_duration": 30.0,
  "lag_compensation_buffer": 0.1,
  "anti_cheat_enabled": true,
  "server_regions": ["us-west", "us-east", "eu-west"],
  "matchmaking": {
    "skill_variance": 100,
    "max_wait_time": 120,
    "region_preference": true
  }
}
```

#### 3. **Audio Configurations** ([`config/audio/`](config/audio/:1))
Manages audio system settings.

**Example: [`audio_settings.json`](config/audio/audio_settings.json:1)**
```json
{
  "master_volume": 1.0,
  "music_volume": 0.7,
  "sfx_volume": 0.8,
  "voice_volume": 0.9,
  "audio_quality": "high",
  "spatial_audio": true,
  "audio_buses": {
    "master": 0,
    "music": -5,
    "sfx": -3,
    "voice": -2
  }
}
```

#### 4. **Graphics Configurations** ([`config/graphics/`](config/graphics/:1))
Controls rendering and visual quality settings.

**Example: [`quality_presets.json`](config/graphics/quality_presets.json:1)**
```json
{
  "presets": {
    "low": {
      "render_scale": 0.75,
      "shadow_quality": "low",
      "texture_quality": "medium",
      "anti_aliasing": "none",
      "post_processing": false,
      "particle_density": 0.5
    },
    "medium": {
      "render_scale": 1.0,
      "shadow_quality": "medium",
      "texture_quality": "high",
      "anti_aliasing": "fxaa",
      "post_processing": true,
      "particle_density": 0.75
    },
    "high": {
      "render_scale": 1.0,
      "shadow_quality": "high",
      "texture_quality": "high",
      "anti_aliasing": "msaa_4x",
      "post_processing": true,
      "particle_density": 1.0
    }
  }
}
```

#### 5. **Development Configurations** ([`config/development/`](config/development/:1))
Development and debugging settings.

**Example: [`debug_config.json`](config/development/debug_config.json:1)**
```json
{
  "debug_mode": true,
  "show_fps": true,
  "show_collision_shapes": false,
  "show_navigation_mesh": false,
  "log_level": "debug",
  "profiling_enabled": true,
  "hot_reload": true,
  "skip_intro": true,
  "god_mode": false,
  "infinite_resources": false
}
```

---

## 🏗️ Configuration Management Implementation

### Settings Manager ([`src/core/settings_manager.gd`](src/core/settings_manager.gd:1))

```gdscript
extends Node

# Configuration file paths
const CONFIG_PATHS = {
    "combat": "res://config/game/combat_settings.json",
    "movement": "res://config/game/movement_settings.json",
    "building": "res://config/game/building_settings.json",
    "network": "res://config/network/server_config.json",
    "audio": "res://config/audio/audio_settings.json",
    "graphics": "res://config/graphics/quality_presets.json"
}

# Cached configuration data
var config_cache = {}
var user_settings = {}

func _ready():
    load_all_configs()
    load_user_settings()

func load_all_configs():
    for config_name in CONFIG_PATHS:
        load_config(config_name)

func load_config(config_name: String) -> Dictionary:
    if config_name in config_cache:
        return config_cache[config_name]
    
    var file_path = CONFIG_PATHS.get(config_name, "")
    if file_path.is_empty():
        push_error("Unknown config: " + config_name)
        return {}
    
    var file = FileAccess.open(file_path, FileAccess.READ)
    if not file:
        push_error("Failed to load config: " + file_path)
        return {}
    
    var json_text = file.get_as_text()
    file.close()
    
    var json = JSON.new()
    var parse_result = json.parse(json_text)
    
    if parse_result != OK:
        push_error("Failed to parse JSON in: " + file_path)
        return {}
    
    config_cache[config_name] = json.data
    return json.data

func get_config_value(config_name: String, key_path: String, default_value = null):
    var config = load_config(config_name)
    return get_nested_value(config, key_path, default_value)

func get_nested_value(dict: Dictionary, key_path: String, default_value = null):
    var keys = key_path.split(".")
    var current = dict
    
    for key in keys:
        if current.has(key):
            current = current[key]
        else:
            return default_value
    
    return current

func save_user_setting(key: String, value):
    user_settings[key] = value
    save_user_settings()

func get_user_setting(key: String, default_value = null):
    return user_settings.get(key, default_value)

func save_user_settings():
    var file = FileAccess.open("user://settings.save", FileAccess.WRITE)
    if file:
        file.store_string(JSON.stringify(user_settings))
        file.close()

func load_user_settings():
    var file = FileAccess.open("user://settings.save", FileAccess.READ)
    if file:
        var json_text = file.get_as_text()
        file.close()
        
        var json = JSON.new()
        if json.parse(json_text) == OK:
            user_settings = json.data
```

---

## 📋 Configuration Best Practices

### 1. **Separation of Concerns**
- **Game Config**: Gameplay mechanics, balance, and rules
- **User Settings**: Player preferences and customizations
- **System Config**: Technical settings and platform-specific options
- **Development Config**: Debug and development-only settings

### 2. **Configuration Hierarchy**
```
Priority Order (highest to lowest):
1. Command line arguments
2. User settings (user://settings.save)
3. Platform-specific overrides
4. Default configuration files
```

### 3. **Environment-Specific Configs**
```
config/
├── game/
│   ├── combat_settings.json          # Base settings
│   ├── combat_settings.dev.json      # Development overrides
│   ├── combat_settings.test.json     # Testing overrides
│   └── combat_settings.prod.json     # Production overrides
```

### 4. **Configuration Validation**
```gdscript
func validate_config(config_name: String, config_data: Dictionary) -> bool:
    match config_name:
        "combat":
            return validate_combat_config(config_data)
        "movement":
            return validate_movement_config(config_data)
        _:
            return true

func validate_combat_config(config: Dictionary) -> bool:
    var required_keys = ["base_damage", "critical_multiplier", "combo_window"]
    for key in required_keys:
        if not config.has(key):
            push_error("Missing required config key: " + key)
            return false
    
    if config.base_damage <= 0:
        push_error("base_damage must be positive")
        return false
    
    return true
```

### 5. **Hot Reloading Support**
```gdscript
func _input(event):
    if event.is_action_pressed("reload_configs") and OS.is_debug_build():
        reload_all_configs()

func reload_all_configs():
    config_cache.clear()
    load_all_configs()
    EventBus.emit_signal("configs_reloaded")
```

### 6. **Platform-Specific Overrides**
```gdscript
func load_config_with_overrides(config_name: String) -> Dictionary:
    var base_config = load_base_config(config_name)
    var platform_override = load_platform_override(config_name)
    
    return merge_configs(base_config, platform_override)

func load_platform_override(config_name: String) -> Dictionary:
    var platform = OS.get_name().to_lower()
    var override_path = "res://config/platform_overrides/" + platform + "/" + config_name + ".json"
    
    if FileAccess.file_exists(override_path):
        return load_json_file(override_path)
    
    return {}
```

### 7. **Configuration Schema Documentation**
Each configuration file should have a corresponding schema file:

**Example: [`config/schemas/combat_settings.schema.json`](config/schemas/combat_settings.schema.json:1)**
```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Combat Settings",
  "type": "object",
  "properties": {
    "base_damage": {
      "type": "number",
      "minimum": 1,
      "description": "Base damage value for attacks"
    },
    "critical_multiplier": {
      "type": "number",
      "minimum": 1.0,
      "maximum": 5.0,
      "description": "Damage multiplier for critical hits"
    },
    "combo_window": {
      "type": "number",
      "minimum": 0.1,
      "maximum": 2.0,
      "description": "Time window for combo inputs in seconds"
    }
  },
  "required": ["base_damage", "critical_multiplier", "combo_window"]
}
```

---

## 🔄 Configuration Workflow

### Development Workflow
1. **Modify config files** in [`config/`](config/:1) directory
2. **Test changes** using hot reload (F5 in debug mode)
3. **Validate configs** using schema validation
4. **Commit changes** to version control
5. **Deploy configs** with application builds

### User Settings Workflow
1. **User modifies settings** through in-game menus
2. **Settings saved** to `user://settings.save`
3. **Settings applied** at runtime with immediate effect
4. **Settings persist** across game sessions

### Platform Deployment
1. **Base configs** deployed with all builds
2. **Platform overrides** applied automatically
3. **User settings** remain local to each platform
4. **Cloud sync** available for cross-platform users

---

## 🚀 Advanced Configuration Features

### 1. **Configuration Profiles**
Support multiple configuration profiles for different game modes:
```
config/profiles/
├── competitive.json    # Competitive play settings
├── casual.json        # Casual play settings
├── training.json      # Training mode settings
└── tournament.json    # Tournament settings
```

### 2. **A/B Testing Support**
```gdscript
func get_ab_test_config(test_name: String, user_id: String) -> Dictionary:
    var test_group = hash(user_id + test_name) % 2
    var config_path = "res://config/ab_tests/" + test_name + "_" + str(test_group) + ".json"
    return load_json_file(config_path)
```

### 3. **Remote Configuration**
```gdscript
func fetch_remote_config():
    var http_request = HTTPRequest.new()
    add_child(http_request)
    http_request.request_completed.connect(_on_remote_config_received)
    http_request.request("https://api.nexeumvs.com/config/latest")

func _on_remote_config_received(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
    if response_code == 200:
        var remote_config = JSON.parse_string(body.get_string_from_utf8())
        merge_remote_config(remote_config)
```

---

## 🎯 Implementation Recommendations

### 1. **Start Simple**
Begin with basic JSON configuration files for core systems:
- [`combat_settings.json`](config/game/combat_settings.json:1)
- [`movement_settings.json`](config/game/movement_settings.json:1)
- [`audio_settings.json`](config/audio/audio_settings.json:1)

### 2. **Gradual Enhancement**
Add advanced features as the project grows:
- Environment-specific overrides
- Hot reloading for development
- Schema validation
- Remote configuration updates

### 3. **User Experience Focus**
- Provide sensible defaults
- Clear setting descriptions
- Immediate visual feedback
- Easy reset to defaults

### 4. **Performance Considerations**
- Cache frequently accessed configs
- Lazy load rarely used configs
- Minimize file I/O during gameplay
- Use binary formats for large datasets

This comprehensive configuration management system provides the flexibility and scalability needed for NexeumVs while maintaining simplicity during early development phases.