$conn = Get-NetTCPConnection -LocalPort 8080 -ErrorAction SilentlyContinue
if ($conn) {
    $processIds = $conn.OwningProcess | Select-Object -Unique | Where-Object { $_ -gt 0 }
    foreach ($procId in $processIds) {
        Write-Host "Freeing port 8080 (Stopping PID $procId)..." -ForegroundColor Yellow
        Stop-Process -Id $procId -Force -ErrorAction SilentlyContinue
    }
    Start-Sleep -Seconds 1
}
Write-Host "Starting Spring Boot..." -ForegroundColor Green
.\mvnw.cmd spring-boot:run
