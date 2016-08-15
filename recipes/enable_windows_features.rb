features = %w(
  Web-Default-Doc
  Web-Dir-Browsing
  Web-Http-Errors
  Web-Static-Content
  Web-Http-Redirect
  Web-Http-Logging
  Web-Custom-Logging
  Web-Log-Libraries
  Web-ODBC-Logging
  Web-Request-Monitor
  Web-Http-Tracing
  Web-Performance
  Web-Stat-Compression
  Web-Dyn-Compression
  Web-Filtering
  Web-Basic-Auth
  Web-CertProvider
  Web-Client-Auth
  Web-Digest-Auth
  Web-Cert-Auth
  Web-IP-Security
  Web-Url-Auth
  Web-Windows-Auth
  Web-Net-Ext
  Web-Net-Ext45
  Web-AppInit
  Web-Asp-Net
  Web-Asp-Net45
  Web-Mgmt-Console
  Web-Scripting-Tools
  NET-Framework-Features
  NET-Framework-Core
  Application-Server
  AS-NET-Framework
  AS-Web-Support
  AS-WAS-Support
  AS-HTTP-Activation
  PowerShellRoot
  PowerShell
  PowerShell-V2
  PowerShell-ISE
)

# Then we install each feature
features.each do |feature|
  windows_feature "Install #{feature}" do
    feature_name feature
    action :install
    provider :windows_feature_powershell
  end
end
