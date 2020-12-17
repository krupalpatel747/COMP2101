function NetworkAdapter {
get-ciminstance win32_networkadapterconfiguration | where-object ipenabled -eq True | select-object Index,Description,ipaddress,IPSubnet,DNSDomain,DNSServerSearchOrder | format-list *
}


function HardwareDescription
{
    "==========Hardware Information======================================================================================"
    Get-WmiObject win32_computersystem 
}

function OperatingSystem
{
"======================OperatingSystem Information=========================================================================="
Get-wmiobject win32_operatingsystem | select-object name,version
}

function Processor
{
"================Processor Information================================================================================"
Get-wmiobject win32_processor | select-object CurrentClockSpeed,NumberofCores,L2CacheSize,L3CacheSize
}

function PhysicalMemory {
"====================Physicalmemory info======================================================================"

    $totalcapacity = 0
    get-wmiobject -class win32_physicalmemory |
    foreach { 
            new-object -TypeName psobject -property @{
                Manufacturer = $_.manufacturer
                description = $_.description
                "Size(MB)" = $_.capacity
                Bank = $_.banklabel
                Slot = $_.devicelocator
         
                
         }
    $totalcapacity += $_.capacity     
    }|
    ft Manufacturer, description, "Size(MB)","Bank",Slot
    "InstalledRam = $totalcapacity"
}


function PhysicalDiskInfo{
"=======================PhysicalDiskInfos========================================================================="

$diskdrives = Get-CIMInstance CIM_diskdrive
	foreach ($disk in $diskdrives) 
		{ 
		$partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition 
		foreach ($partition in $partitions) 
			{ 
			$logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk 
			foreach ($logicaldisk in $logicaldisks) 
				{ 
				new-object -typename psobject -property @{
					Drive=$logicaldisk.deviceid 
					Manufacturer=$disk.Manufacturer 
					Model=$disk.Model
					"SizeOfPhysicaldisk(GB)"=$disk.Size / 1gb -as [int]
					“Size(GB)”=$logicaldisk.size / 1gb -as [int]
					"freespace(GB)"=$logicaldisk.freespace / 1gb -as [int] 
					"freespace(%)"=((100)*($logicaldisk.freespace))/($logicaldisk.size) -as [int]

					} | ft Drive,Manufacturer,Model,"SizeOfPhysicalDisk(GB)","Size(GB)","freespace(GB)","freespace(%)"

				} 
			} 
		}

}



function VideoCard {
"======================VideoCard Info============================================================================"
Get-WmiObject win32_videocontroller | Select-Object Manufacturer,Description,VideoModeDescription
}


function get-mydisk {

Get-PhysicalDisk | ft -AutoSize Manufacturer,Model,SerialNumber,Firmwareversion,Size

}