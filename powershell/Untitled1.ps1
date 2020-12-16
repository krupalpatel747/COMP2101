function diskinfo  {


    $diskdrives = Get-CIMInstance CIM_diskdrive
 
    foreach ($disk in $diskdrives)

    {
     $partitions = $disk|get-cimassociatedinstance -resultclassname CIM_diskpartition 
	    foreach ($partition in $partitions) 
	    { $logicaldisks = $partition | get-cimassociatedinstance -resultclassname CIM_logicaldisk
		     foreach ($logicaldisk in $logicaldisks) 
		     { new-object -typename psobject -Property @{
                 Manufacturer=$disk.Manufacturer
                 Model = $disk.Model
                 Size = $disk.size 
                 logicaldiskSize= $logicaldisk.Size
                 logicaldiskfreespace= $logicaldisk.freespace
                 freeSpacePercentage=(($logicaldisk.freespace/1gb)/($logicaldisk.size/1gb))*100
                 Drive=$logicaldisk.deviceid 
                 “Size(GB)”=$logicaldisk.size / 1gb -as [int] 
             
		         }
             }
        } 
    } 

    }

"========================================================================="
"disk information "
"========================================================================="
diskinfo