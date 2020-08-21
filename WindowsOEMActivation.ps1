$productKey = (Get-WmiObject -Class SoftwareLicensingService).OA3xOriginalProductKey

if ($productKey){
    & cscript //B C:\windows\system32\slmgr.vbs /ipk $productKey
    & cscript //B C:\windows\system32\slmgr.vbs /ato
    return $productKey
}
else {
    return "No Product key found!"
}
