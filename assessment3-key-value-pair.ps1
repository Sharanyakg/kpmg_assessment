#get value of nested object
$jsoni = $( Read-Host "Input object, please" )
$inpstr=$( Read-Host "Input key, please" )
$inpobj=$jsoni | convertFrom-json
$count=0
foreach($i in $inpstr.Split("/"))
 {	

 if( $count -eq 0)
 {
 $obj=$inpobj.($i)
 }
 else
 {
 $obj=$obj.$i
 } 
$count=$count +1
 
 }
write-host $obj
