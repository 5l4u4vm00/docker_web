docker run -v ${env:USERPROFILE}\.ssh:/root/.ssh:ro -v ${PSScriptRoot}\workSpace:/root/workspace -p 5173:5173 -p 5209:5209 --name vudu -td ubuntu-vudu /bin/bash
