md Build
cd Build
cmake ..
MSBuild nc_full.vcxproj /t:Build /p:Configuration=Release
