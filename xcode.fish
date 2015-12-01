function xc
  set project (ls -lrt -d -1 $PWD/*/* | grep 'xc[workspace|project]')
  if test (echo $project[1] | wc -w) -ge 1
    open -a "Xcode" $project[1]
  else
    echo "No xcworkspace/xcodeproj file found in the current directory."
  end
end
