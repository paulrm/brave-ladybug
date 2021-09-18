# brave-ladybug

## Log
- [x] postgres en la nube 🎉
  - access desde Home
    - habiltar red  
    - resetear el pass del user postgres
- [x] pruebas con postgres dockerizado
- [x] pruebas de Cloud functions en la nube 
- [x] 1er cloudfunction disparada desde CloudStorage
- [ ] orquestar MPV Input 
  - [ ] cloud verificar mp4 + xml
  - [ ] post -> Google Workflow
- [ ] pruebas de cloudFunction con Authentication 🚧
  - [x] prueba basica
      - [x] get ip and geo location 
    - make web-deploy
    - make web-check
    - make web-info
  - [ ] Mejora
    - tomar la data gcloud functions describe helloHttp 
    - construir el proximo con esa data (ej: versionId + 1  )
  - [ ] prueba con auth 

## Auth 1st error fail 

En la consola
```
ERROR: (gcloud.functions.deploy) OperationError: code=3, message=Function failed on loading user code. This is likely due to a bug in the user code. Error message: Error: please examine your function logs to see the error cause: https://cloud.google.com/functions/docs/monitoring/logging#viewing_logs. Additional troubleshooting documentation can be found at https://cloud.google.com/functions/docs/troubleshooting#logging. Please visit https://cloud.google.com/functions/docs/troubleshooting for in-depth troubleshooting documentation.
```

En los logs
```
Function cannot be initialized. Error: function terminated. Recommended action: inspect logs for termination reason. Additional troubleshooting documentation can be found at https://cloud.google.com/functions/docs/troubleshooting#logging
```