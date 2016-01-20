import smx
from pprint import pprint
with open('/home/insserver/serverfiles/insurgency/addons/sourcemod/plugins/insurgency.smx', 'rb') as fp:
    plugin = smx.SourcePawnPlugin(fp)
#    print 'Loaded %s...' % plugin

#pprint(plugin.Pubvar(plugin,0,'myinfo').value)
print plugin.myinfo['version']
#sp_file_hdr().version())
