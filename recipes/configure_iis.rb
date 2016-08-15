directory 'C:\AdventureWorksWebApp' do
  action :create
end

files_folder = File.expand_path('../files', File.dirname(__FILE__))

file 'C:\AdventureWorksWebApp\Default.aspx' do
  content ::File.read("#{files_folder}/default.aspx")
  action :create
end

iis_app 'Configure AdventureWorks Web App' do
  action :add
  site_name 'Default Web Site'
  path '/AdventureWorks'
  physical_path 'C:\AdventureWorksWebApp'
end
