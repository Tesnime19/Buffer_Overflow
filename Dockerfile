# Utiliser une image Ubuntu minimaliste
FROM ubuntu:20.04

# Désactiver les questions interactives
ENV DEBIAN_FRONTEND=noninteractive

# Installer les outils nécessaires
RUN apt update && apt install -y gcc gdb python3

# Copier les fichiers dans l'image
WORKDIR /app
COPY vuln.c exploit.py ./

# Compiler le programme vulnérable
RUN gcc vuln.c -o vuln -fno-stack-protector -z execstack -no-pie

# Donner les permissions d'exécution
RUN chmod +x vuln exploit.py

# Lancer un shell interactif
CMD ["/bin/bash"]
