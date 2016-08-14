features = %w(
  Web-Server
  Web-WebServer
  Web-Common-Http
  Web-Default-Doc
  Web-Dir-Browsing
  Web-Http-Errors
  Web-Static-Content
  Web-Http-Redirect
  Web-DAV-Publishing
  Web-Health
  Web-Http-Logging
  Web-Custom-Logging
  Web-Log-Libraries
  Web-ODBC-Logging
  Web-Request-Monitor
  Web-Http-Tracing
  Web-Performance
  Web-Stat-Compression
  Web-Dyn-Compression
  Web-Security
  Web-Filtering
  Web-Basic-Auth
  Web-CertProvider
  Web-Client-Auth
  Web-Digest-Auth
  Web-Cert-Auth
  Web-IP-Security
  Web-Url-Auth
  Web-Windows-Auth
  Web-App-Dev
  Web-Net-Ext
  Web-Net-Ext45
  Web-AppInit
  Web-ASP
  Web-Asp-Net
  Web-Asp-Net45
  Web-CGI
  Web-ISAPI-Ext
  Web-ISAPI-Filter
  Web-Includes
  Web-WebSockets
  Web-Mgmt-Tools
  NET-Framework-Features
  NET-Framework-Core
)

# Then we install each feature
features.each do |feature|
  windows_feature "Install #{feature}" do
    feature_name feature
    action :install
    all true
    provider :windows_feature_powershell
  end
end
