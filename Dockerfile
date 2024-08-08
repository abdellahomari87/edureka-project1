# Étape 1: Construire l'application avec Maven
FROM maven:3.8.4-openjdk-17 AS build

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app_project1

# Copiez le fichier pom.xml et téléchargez les dépendances
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiez le reste des fichiers du projet
COPY src ./src

# Compilez l'application et générez le fichier WAR
RUN mvn package

# Étape 2: Configurer Tomcat et déployer l'application
FROM tomcat:10.1.10-jdk17-temurin-jammy

# Supprimer l'application par défaut dans Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copier le fichier WAR généré dans le dossier webapps de Tomcat
COPY --from=build /app_project1/target/ABCtechnologies-1.0.war /usr/local/tomcat/webapps/

# Exposer le port par défaut de Tomcat
EXPOSE 8081

# Démarrer Tomcat
CMD ["catalina.sh", "run"]
