cask 'agentrg-wine-stable' do
  version '6.0.2-stable'
  sha256 "b3dbbdeb43726c25e14fe5aa84d1c976d881bdce914aa1fe791ccf804b54e4c0"

  url "https://github.com/AgentRG/swtor_on_mac/releases/download/#{version}/wine-stable-6.0.2-osx64.tar.xz"

  name 'Wine-stable'
  homepage 'https://github.com/AgentRG/swtor_on_mac'
  desc "Clone of Gcenx stable Wine build. Compatibility layer to run Windows applications"

  depends_on formula: 'xz'


  conflicts_with cask: [
    "wine-devel",
    "wine-staging",
  ]

  app "Wine Stable.app"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/start/bin/appdb"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/start/bin/winehelp"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/msiexec"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/notepad"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/regedit"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/regsvr32"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wine"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wine64"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wineboot"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winecfg"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wineconsole"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winedbg"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winefile"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winemine"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/winepath"
  binary "#{appdir}/Wine Stable.app/Contents/Resources/wine/bin/wineserver"

  caveats <<~EOS
    #{token} supports both 32-bit and 64-bit. It is compatible with an existing
    32-bit wine prefix, but it will now default to 64-bit when you create a new
    wine prefix. The architecture can be selected using the WINEARCH environment
    variable which can be set to either win32 or win64.
    To create a new pure 32-bit prefix, you can run:
      $ WINEARCH=win32 WINEPREFIX=~/.wine32 winecfg
    See the Wine FAQ for details: https://wiki.winehq.org/FAQ#Wineprefixes
  EOS

end