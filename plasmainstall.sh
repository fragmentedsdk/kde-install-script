echo "This script will install kde-plasma and recommended apps for Void Linux..."
    read -p "Updating system..."
        sudo xbps-install -Su
      ;;
    esac
      sudo xbps-install -S void-repo-multilib void-repo-multilib-nonfree void-repo-nonfree      # Enables multilib and nonfree repos.
      sudo xbps-install -Su
    echo "Multilib and non-free repos have been installed..."
        sudo xbps-install  vulkan-loader amdvlk mesa-vaapi mesa-vdpau mesa-dri      # Graphic drivers AMD ONLY.
        sudo xbps-install  fontconfig font-iosevka ttf-material-icons nerd-fonts ttf-ubuntu-font-family terminus-font     # Recommended fonts.
        sudo xbps-install  pulseaudio
        sudo xbps-install  kde-plasma kde-baseapps NetworkManager     # This installs kde plasma and the kde plasma apps too.
        sudo xbps-install  unzip wget bluez unrar
      # Additional apps are being installed below, these are not needed but are recommended.
        sudo xbps-install -Su && sudo xbps-install fastfetch qbittorrent element-desktop flatpak kate nano vim okular firefox flameshot gimp vlc obs
    echo "Enabling necessary services..."
    sudo ln -s /etc/sv/dbus /var/service/
    sudo ln -s /etc/sv/sddm /var/service/
    sudo ln -s /etc/sv/NetworkManager /var/service/

    echo "Starting necessary services..."
    sudo sv up dbus
    sudo sv up sddm
    sudo sv up NetworkManager

    echo "Finished, rebooting..."
  ;;
esac
