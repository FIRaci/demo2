@echo off
powershell -Command "$conn = Get-NetTCPConnection -LocalPort 8080 -ErrorAction SilentlyContinue; if ($conn) { $conn.OwningProcess | Select-Object -Unique | ForEach-Object { if ($_ -gt 0) { Stop-Process -Id $_ -Force -ErrorAction SilentlyContinue } } }"
.\mvnw.cmd spring-boot:run
