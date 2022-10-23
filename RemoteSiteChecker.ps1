Start-Process "https://github.com/tarikozluk"
Start-Sleep -Seconds 2.5
[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)

   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
}

$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, 1250, 1250)
screenshot $bounds "C:\screenshot_of_site.png"
Start-Sleep -Seconds 2.5
Send-MailMessage -From 'e_mail1>' -To 'e_mail2>' -Subject 'Screenshot of the Developed Site' -Body "You can reach the screenshot of the site in developing process in attachment." -Attachments .C:\screenshot_of_site.png -Priority High -DeliveryNotificationOption OnSuccess, OnFailure -SmtpServer 'ip:port'
