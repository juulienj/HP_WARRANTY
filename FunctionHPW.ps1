############   URLs   ############
$getAccessToken = 'https://css.api.hp.com/oauth/v1/token'
$queries = 'https://css.api.hp.com/productWarranty/v1/queries'

############   INFORMATIONS   ############
$sn = (Get-WmiObject Win32_BIOS).SerialNumber
$reg = get-itemproperty -path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS" 
$model = $reg.SystemProductName
$sku = $reg.SystemSKU

############    TOKEN   ############
$body = @{
    apiKey = "YOUR_API_KEY"
    apiSecret = 'YOUR_API_SECRET'
    grantType = 'client_credentials'
    scope = 'warranty'
    }

$tokenHeader = @{
    Accept = 'application/json'
    ContentType = 'application/x-www-urlencoded'
    }

$getToken = Invoke-RestMethod -Method Post -Headers $tokenHeader -Uri $getAccessToken -body $body -Verbose
$token = $getToken.access_token
Start-Sleep -s 1

############    QUERIES  ############
function Get-War {

$json = @"
[
  {
    "sn": "$sn",
    "pn": "$sku"
  }
]
"@

$dateHeader = @{
    Accept = 'application/json'
    Authorization = 'Bearer ' + $token
    }

$getDate = Invoke-RestMethod -Method POST -Headers $dateHeader -Uri $queries -ContentType "application/json"  -Body $json -Verbose
$endDate = (Get-Date $getDate.endDate -Format 'dd/MM/yyyy')
$startDate = (Get-Date $getDate.startDate -Format 'dd/MM/yyyy')


return $getDate
}


