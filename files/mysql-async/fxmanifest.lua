fx_version 'adamant'
game 'common'


server_script 'mysql-async.js'
client_script 'mysql-async-client.lua'

files {
  'ui/index.html',
  'ui/js/app.js',
  'ui/css/app.css',
  'ui/fonts/fira-sans-v9-latin-700.woff',
  'ui/fonts/fira-sans-v9-latin-700.woff2',
  'ui/fonts/fira-sans-v9-latin-italic.woff',
  'ui/fonts/fira-sans-v9-latin-italic.woff2',
  'ui/fonts/fira-sans-v9-latin-regular.woff',
  'ui/fonts/fira-sans-v9-latin-regular.woff2',
  'ui/fonts/MaterialIcons-Regular.eot',
  'ui/fonts/MaterialIcons-Regular.ttf',
  'ui/fonts/MaterialIcons-Regular.woff',
  'ui/fonts/MaterialIcons-Regular.woff2',
}

ui_page 'ui/index.html'
