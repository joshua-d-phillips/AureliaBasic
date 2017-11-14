SET PWD=%cd%

rmdir %PWD%\PublishOutput /s /q

dotnet publish %PWD%\test.csproj --configuration Release --output %PWD%\PublishOutput\test

REM xcopy wwwroot %PWD%\PublishOutput\test /E

cd  %PWD%

cf target -s rubicon-sandbox

cf push -p PublishOutput\test -f manifest.sandbox.yml