directory 'C:\AdventureWorksDB' do
  action :create
end

files_folder = File.expand_path('../files', File.dirname(__FILE__))
sql_command = ::File.read("#{files_folder}/restore_database.sql")
bak_file_path = 'C:\Deploy\AdventureWorks2012-Full Database Backup.bak'

powershell_script 'Restore AdventureWorks database' do
  code <<-EOH
If (!(Get-Module sqlps -ListAvailable -EA SilentlyContinue)) {
    Import-Module "C:\\Program Files (x86)\\Microsoft SQL Server\\120\\Tools\\PowerShell\\Modules\\SQLPS\\SQLPS.PSD1"
}
Else {
    Import-Module sqlps
}
$query = @'
#{sql_command}
'@
Import-Module SqlPs
Invoke-Sqlcmd -ServerInstance localhost -Database 'master' -QueryTimeout 3600 -Query $query -Username 'sa' -Password '!sql2014'
$timestamp = Get-Date -Format yyyy.MM.dd.HH.mm
$file_after_backup = '#{bak_file_path}.' + $timestamp
Move-Item -Path '#{bak_file_path}' -Destination $file_after_backup
EOH
  only_if { ::File.exist?(bak_file_path) }
end
