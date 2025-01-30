#include <stdio.h>
#include <string.h>

void vuln_function() {
    char buffer[40];
    printf("Entrez votre payload : ");
    gets(buffer); // 🚨 Fonction dangereuse
    printf("Données reçues : %s\n", buffer);
}

int main() {
    vuln_function();
    return 0;
}
