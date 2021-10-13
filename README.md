# Cognos Analytics - Content Backup and Restore 

Copy or download added shell scripts files to upload or download or list the deployments from   CPD - CA pod (CA deployment directory)


### Download deployments from CPD-CA extension 
usage: ./download_deployment.sh -d deployment -n namespace

-h prints help to the console

-d deployment  (required)

-n namespace  or project (required)

EX:
```
$ ./download_deployment.sh -d ExportContent.zip -n CPD-OC-Project
```

### List available deployments from CPD-CA extension
usage: ./list_deployment.sh  -n namespace

-h prints help to the console

-n namespace or project (required)

EX:
```
$ ./list_deployment.sh  -n CPD-OC-Project
```

### Upload Deployment content into CPD-CA extension
usage: ./upload_deployment.sh -d deployment -n namespace

-h prints help to the console

-d deployment deployment (required)

-n namespace namespace or project (required)

EX:
```
$ ./upload_deployment.sh -d SampleImport.zip -n CPD-OC-Project
```




