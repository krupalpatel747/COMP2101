
function PhysicalDiskInfo
{
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
PhysicalDiskInfo
