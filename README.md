# kizzycode/nginx-cgi

A tiny docker image with nginx and fcgiwrap to serve files and execute CGI binaries.


## The following environment variables are valid for CGI applications
```sh
GATEWAY_INTERFACE=CGI/1.1
DOCUMENT_URI=...
SUPERVISOR_GROUP_NAME=fcgiwrap
HOSTNAME=...
REMOTE_ADDR=...
SHLVL=1
QUERY_STRING=...
FCGI_ROLE=RESPONDER
DOCUMENT_ROOT=...
REMOTE_PORT=...
HTTP_USER_AGENT=...
HTTP_ACCEPT=...
CONTENT_LENGTH=...
HTTP_HOST=...
REQUEST_URI=...
SERVER_SOFTWARE=nginx/1.22.1
REQUEST_SCHEME=http
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SERVER_PROTOCOL=HTTP/1.1
SUPERVISOR_ENABLED=1
REQUEST_METHOD=...
SERVER_ADDR=...
SUPERVISOR_PROCESS_NAME=fcgiwrap
PWD=...
SERVER_PORT=...
SCRIPT_NAME=...
```


## ⚠️ Important ⚠️
Important security notes:
- Nginx directory listing is enabled
