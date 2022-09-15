[build]
%{ for ip in build ~}
${ip}
%{ endfor ~}

[web]
%{ for ip in web ~}
${ip}
%{ endfor ~}