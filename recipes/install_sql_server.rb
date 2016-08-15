full_path_iso_file = 'C:\Deploy\en_sql_server_2014_developer_edition_with_service_pack_2_x64_dvd_8967821.iso'
files_folder = File.expand_path('../files', File.dirname(__FILE__))
setup_ini_file = "#{files_folder}/SQL_Server_Setup_Config.ini"

powershell_script 'Install SQL Server' do
  code <<-EOH
  Mount-DiskImage -ImagePath #{full_path_iso_file}
  $driveLetter = (Get-DiskImage #{full_path_iso_file} | Get-Volume).DriveLetter
  iex "$($driveLetter):\\setup.exe /CONFIGURATIONFILE=#{setup_ini_file} /IAcceptSQLServerLicenseTerms /SAPWD=!sql2014"
  Dismount-DiskImage -ImagePath #{full_path_iso_file}
  EOH
  not_if <<-EOH
    Test-Path "HKLM:\\Software\\Microsoft\\Microsoft SQL Server\\Instance Names\\SQL"
  EOH
  notifies :reboot_now, 'reboot[if_pending]', :immediate
end

reboot 'if_pending' do
  action :nothing
  reason 'There is a pending reboot.'
  only_if { reboot_pending? }
end
