function xc
  if test (echo $argv | wc -w) -ge 1
    open -a "Xcode" $argv
  else
    set currentDirectory (ls -fd -1 $PWD/*{xcworkspace,xcodeproj})
    if test (echo $currentDirectory[1] | wc -w) -ge 1
      if [ $currentDirectory[1] != "." ]
        open -a "Xcode" $currentDirectory[1]
      else
        set subDirectories (ls -fd -1 $PWD/*/*{xcworkspace,xcodeproj})
        if test (echo $subDirectories[1] | wc -w) -ge 1
          if [ $subDirectories[1] != "." ]
            open -a "Xcode" $subDirectories[1]
          else
            echo "No xcworkspace/xcodeproj file found in the current directory."
          end
        end
      end
    else
      echo "No xcworkspace/xcodeproj file found in the current directory."
    end
  end
end
