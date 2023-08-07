# Interpréteur avec Lex et Yacc pour faire des calculs arithmétiques et logiques
###### Projet réalisé en Bachelor Architecture Logicielle à l'ESGI dans la matière Théorie des Langages et Compilation ######



## INTRODUCTION
L’interpréteur développé permet d’effectuer des opérations arithmétiques et logiques. Il est développé avec les outils lex pour la partie analyse lexicale et yacc pour la partie syntaxique. 
L’interpréteur peut gérer : 

- 3 types de variables : Int, Float, Bool

    <table>
        <tr>
        <td><strong>Type</strong></td>
            <td><strong>Signification</strong></td>
            <td><strong>Plage</strong></td>
        </tr>
        <tr>
            <td>Int</td>
            <td>Entier</td>
            <td>-2 147 483 648 à 2 147 483 647</td>
        </tr>
        <tr>
            <td>Float</td>
            <td>Flottant (réel)</td>
            <td>3.4*10-38 à 3.4*10-38</td>
        </tr>
        <tr>
            <td>Bool</td>
            <td>Boolean (Vrai/Faux)</td>
            <td>True ou False</td>
        </tr>
    </table>

- Les commentaires ( mono ligne et multilignes )
- Les opérations arithmétiques : ‘+’ l’addition, ‘-‘ la soustraction, ‘\*’ le produit, ‘/’ la division
- Les opérations logiques :  ‘OR’ : opérateur d’union, ‘AND’ : opérateur d’intersection, ‘XOR’ : OU exclusif, ‘NOT’ : l’inverse d’une proposition
- Les opérations trigonométriques : ‘SIN’ le sinus, ‘COS’ le cosinus

## Utilisation

### Installation

1. Cloner le projet
2. Installer flex, bison, gcc et make
```bash	
sudo apt-get install flex bison gcc make
```
3. Se placer dans le dossier du projet
4. Compiler le projet
```bash
make
```
5. Lancer le projet
```bash
./calc
```

### Exemple d'utilisation

```bash
./calc < input-demo.txt
```

## SYNTAXE

### Déclaration d’une variable

Type variable Nom Valeur ;

- **Type** : Int, Float, Bool
- **Nom :** Commence par une lettre (a-z, A-Z) et contient soit des lettres, des chiffres, les caractère \_ $
- **Valeur :** Non obligatoire lors de la déclaration

```bash 
Int a 5;
Float b 3.5;
Bool c True;
Int d;
```

### Commentaire

- **Mono ligne :** #  Commentaire
- **Multilignes :** /# Commmentaire multilignes #/
    
```bash
# Ceci est un commentaire
/# Ceci est un commentaire multilignes #/
```

### Opérations

Set nom-variable (opération) ;

- **Nom variable :** Nom d’une variable existante
- **Opération :**
    - **-	Les opérations arithmétiques :** 
        - ‘+’ l’addition, ‘-‘ la soustraction, ‘\*’ le produit, ‘/’ la division
    - **-	Les opérations logiques :** 
        - ‘OR’ : opérateur d’union, ‘AND’ : opérateur d’intersection, ‘XOR’ : OU exclusif, ‘NOT’ : l’inverse d’une proposition
    - **-	Les opérations trigonométriques :**
        - ‘SIN’ le sinus, ‘COS’ le cosinus

```bash
Set a (5 + 3);
Set b (a * 2);
Set c (a / b);
...
```

### Affichage

Print nom-variable;

- **Nom variable :** Nom d’une variable existante

```bash
Print a;
```




