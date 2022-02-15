$productKey = (Get-WmiObject -Class SoftwareLicensingService).OA3xOriginalProductKey

if ($productKey){
    # Uncomment the below two lines to have the script also attempt to activate Windows.
    # & cscript //B C:\windows\system32\slmgr.vbs /ipk $productKey
    # & cscript //B C:\windows\system32\slmgr.vbs /ato  
    return $productKey
}
else {
    return "No Product key found!"
}
