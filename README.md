# brave-ladybug / Sandbox para pruebas con GPC

## En commit (y push) en main
- Ejecuta -> cloudbuild.yaml
  - deploy helloWorld (declarado en ./index.js)

## Actual Objective 🚧 
- helloWorld (en varias areas)
  - https://southamerica-east1-brave-ladybug.cloudfunctions.net/helloWorld
  - https://europe-west1-brave-ladybug.cloudfunctions.net/helloWorld
  - https://asia-northeast2-brave-ladybug.cloudfunctions.net/helloWorld
  - https://us-central1-brave-ladybug.cloudfunctions.net/helloWorld
  - llama a nodo central https://us-central1-brave-ladybug.cloudfunctions.net/helloHttp
    - `Error: could not handle the request`

## Log
- [x] postgres en la nube 🎉
  - access desde Home
    - habiltar red  
    - resetear el pass del user postgres
- [x] pruebas con postgres dockerizado
- [x] pruebas de Cloud functions en la nube 
- [x] 1er cloudfunction disparada desde CloudStorage
- [ ] pruebas de cloudFunction con Authentication 🚧
  - [x] prueba basica
      - [x] get ip and geo location 
    - make web-deploy
    - make web-check
    - make web-info
    - make web-getlogs
  - [ ] Mejora
    - [ ] tomar la data gcloud functions describe helloHttp 
    - [ ] construir el proximo con esa data (ej: versionId + 1  )
    - [x] Mejora de ciclo de prueba `make web-check` `make web-getlogs` (get logs from last execution)
  - [ ] prueba con auth 
    - [ ] integrar auth 🚧 
      - Logre que no explote por librerias, pero la funcion que mando no llega a ejecutarse
        - se muere mi funcion antes que haga algo❓
- [ ] pruebas de Cloud Run
- OnHold 
  - [ ] orquestar MPV Input 
    - [ ] cloud verificar mp4 + xml
    - [ ] post -> Google Workflow

## Next Steps
- 2022-03-19 restart project
