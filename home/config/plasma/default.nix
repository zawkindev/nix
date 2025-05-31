{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    #
    # Some high-level settings:
    #
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 32;
      };
      iconTheme = "Papirus-Dark";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920.png";
    };

    input.touchpads = [
      {
        enable = true;
        name = "Elan Touchpad";
        vendorId = "04f3";
        productId = "00e2";
        naturalScroll = true;
        tapToClick = true;
        tapAndDrag = true;
        tapDragLock = true;
        scrollMethod = "twoFingers";
        scrollSpeed = 0.3;
        rightClickMethod = "twoFingers";
        twoFingerTap = "rightClick";
        pointerSpeed = 0.5;
        accelerationProfile = "default";
        disableWhileTyping = true;
      }
    ];

    # hotkeys.commands = {
    #   open-terminal = {
    #     name = "Open Terminal";
    #     key = "Meta+Return"; # Meta+Enter (Return key)
    #     command = "konsole"; # Change this if you want a different terminal
    #     logs.enabled = false; # You can enable logging if you want
    #   };

    #   open-spotlight = {
    #     name = "Open Spotlight";
    #     key = "Meta+Space"; # Command+Space
    #     command = "krunner"; # KDE's launcher, like Spotlight
    #     logs.enabled = false;
    #   };
    # };


    fonts = {
      general = {
        family = "SF Pro Text";
        pointSize = 13;
        weight = "medium";
      };

      fixedWidth = {
        family = "SF Mono";
        pointSize = 12;
      };

      small = {
        family = "SF Pro Text";
        pointSize = 11;
      };

      toolbar = {
        family = "SF Pro Text";
        pointSize = 13;
      };

      menu = {
        family = "SF Pro Text";
        pointSize = 13;
      };

      windowTitle = {
        family = "SF Pro Text";
        pointSize = 13;
        weight = "bold";
      };
    };

    desktop.icons = {
      size = 4;
      alignment = "right";
      arrangement = "topToBottom";
      folderPreviewPopups = true;
      sorting.foldersFirst = true;
      sorting.mode = "type";

      previewPlugins = [
        "audiothumbnail"
        "comicbookthumbnail"
        "directorythumbnail"
        "exrthumbnail"
        "fontthumbnail"
        "htmlthumbnail"
        "imagethumbnail"
        "jpegthumbnail"
        "krita"
        "mjpegthumbnail"
        "mobithumbnail"
        "opendocumentthumbnail"
        "pdfthumbnail"
        "rawthumbnail"
        "svgthumbnail"
        "textthumbnail"
        "videothumbnail"
      ];
    };

    krunner = {
      historyBehavior = "enableSuggestions";
      position = "center";
    };

    panels = [
      # macos dock-like panel at the bottom
      {
        location = "bottom";
        alignment = "center";
        hiding = "none";
        lengthMode = "fit";
        opacity = "translucent";
        screen = "all";
        height = 44;
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-white";
                alphaSort = true;
              };
            };
          }
          {
            kickoff = {
              sortAlphabetically = true;
              icon = "nix-snowflake-white";
            };
          }
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
              ];
            };
          }
          {
            name = "org.kde.plasma.icontasks";
            config = {
              General = {
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                ];
              };
            };
          }
        ];
      }
      # Application name, Global menu and Song information and playback controls at the top
      {
        location = "top";
        lengthMode = "fill";
        opacity = "translucent";
        screen = "all";
        height = 28;
        widgets = [
          {
            applicationTitleBar = {
              behavior = {
                activeTaskSource = "activeTask";
              };
              layout = {
                elements = [ "windowTitle" ];
                horizontalAlignment = "left";
                showDisabledElements = "deactivated";
                verticalAlignment = "center";
              };
              overrideForMaximized.enable = false;
              titleReplacements = [
                {
                  type = "regexp";
                  originalTitle = "^Brave Web Browser$";
                  newTitle = "Brave";
                }
                {
                  type = "regexp";
                  originalTitle = ''\\bDolphin\\b'';
                  newTitle = "File manager";
                }
              ];
              windowTitle = {
                font = {
                  bold = true;
                  fit = "fixedSize";
                  size = 12;
                };
                hideEmptyTitle = true;
                margins = {
                  bottom = 0;
                  left = 10;
                  right = 5;
                  top = 0;
                };
                source = "appName";
              };
            };
          }
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          {
            plasmusicToolbar = {
              panelIcon = {
                albumCover = {
                  useAsIcon = false;
                  radius = 8;
                };
                icon = "view-media-track";
              };
              playbackSource = "auto";
              musicControls.showPlaybackControls = true;
              songText = {
                displayInSeparateLines = true;
                maximumWidth = 640;
                scrolling = {
                  behavior = "alwaysScroll";
                  speed = 3;
                };
              };
            };
          }
          {
            digitalClock = {
              calendar.firstDayOfWeek = "sunday";
              time.format = "12h";
            };
          }
          {
            systemTray.items = {
              # We explicitly show bluetooth and battery
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.bluetooth"
              ];
              # And explicitly hide networkmanagement and volume
              hidden = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.volume"
              ];
            };
          }
        ];
      }
    ];

    windows.allowWindowsToRememberPositions = true;

    window-rules = [
      {
        description = "Dolphin";
        match = {
          window-class = {
            value = "dolphin";
            type = "substring";
          };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = {
            value = true;
            apply = "force";
          };
          # `apply` defaults to "apply-initially"
          maximizehoriz = true;
          maximizevert = true;
        };
      }
    ];

    powerdevil = {
      AC = {
        powerButtonAction = "lockScreen";
        autoSuspend = {
          action = "shutDown";
          idleTimeout = 1000;
        };
        turnOffDisplay = {
          idleTimeout = 1000;
          idleTimeoutWhenLocked = "immediately";
        };
      };
      battery = {
        powerButtonAction = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
      };
      lowBattery = {
        whenLaptopLidClosed = "hibernate";
      };
    };

    kwin = {
      borderlessMaximizedWindows = false;
      edgeBarrier = 0; # Disables the edge-barriers introduced in plasma 6.1
      cornerBarrier = true;

      scripts.polonium.enable = true;

      titlebarButtons.left = [
        "close"
        "minimize"
        "maximize"
      ];

      titlebarButtons.right = null;

      effects = {
        blur = {
          enable = true;
          strength = 5;
          noiseStrength = 8;
        };
        desktopSwitching.animation = "slide";
        dimAdminMode.enable = true;
        minimization.animation = "magiclamp";
        minimization.duration = 200;
        translucency.enable = true;
        windowOpenClose.animation = "off";
      };
    };

    kscreenlocker = {
      lockOnResume = true;
      timeout = 10;
    };

    session.general.askForConfirmationOnLogout = true;
    session.sessionRestore.restoreOpenApplicationsOnLogin = "whenSessionWasManuallySaved";

    spectacle.shortcuts.captureEntireDesktop = "Shift+Print";
    spectacle.shortcuts.captureRectangularRegion = "Print";
  };
}
