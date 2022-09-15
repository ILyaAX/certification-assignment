[build]
%{ for ip in build ~}
${ip} ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/AWS_ax.pem
%{ endfor ~}

[web]
%{ for ip in web ~}
${ip} ansible_ssh_private_key_file=/var/lib/jenkins/.ssh/AWS_ax.pem
%{ endfor ~}