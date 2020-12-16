$totalcapacity = 0
get-wmiobject -class win32_physicalmemory |
foreach { 
            new-object -TypeName psobject -property @{
                Manufacturer = $_.manufacturer
                "speed(MHz)" = $_.speed
                "Size(MB)" = $_.capacity
                Bank = $_.banklabel
                Slot = $_.devicelocator

         }
         $totalcapacity += $_.capacity
}|
ft Manufacturer, "Size(MB)","Speed(MHz)","Bank",Slot,"Total RAM:${totalcapacity}MB"