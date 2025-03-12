fx_version('cerulean')
game'gta5'
lua54'yes'

name "Rename Items Using Ox inventory"
description'Rename items Specficly Fully Customable (needed ox inventory)' 
author 'Kai (1210317287324651550)'
version '1.0.0'

use_experimental_fxv2_oal 'yes'

client_scripts{'client/*.lua'}

server_scripts{'server/*.lua'}

shared_scripts{'@ox_lib/init.lua','shared/*.lua'}


