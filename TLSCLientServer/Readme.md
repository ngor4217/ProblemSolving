TLS client/Server example.


Example Certs, Config files, Test Data and SystemD unit included.


For AOT build use:
dotnet publish -r linux-x64 -c Release -p:PublishAot=true -p:SelfContained=true -p:PublishSingleFile=true