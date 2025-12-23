# Tic Tac Toe (Java / Spring Boot)

Small Tic Tac Toe web app using Spring Boot and Thymeleaf.

**Prerequisites, install on laptop**
- Java 17
- Maven 3.6+

**Build**

```bash
mvn clean package
```

**Run (development)**

```bash
mvn spring-boot:run
```

**Run (jar)**

```bash
java -jar target/*.jar
```

**Project layout**
- `src/main/java` — application code (`com.example.tictactoe`)
- `src/main/resources/templates` — Thymeleaf templates (HTML)

If you want, I can also add a short section describing endpoints or how to run in Docker.

## Endpoints

- **GET /**: Returns the main web UI (Thymeleaf template `index.html`). This is served by `GameController`.

## Docker

You can build the runnable jar and run it in Docker.

1. Build the jar:

```bash
mvn clean package
```

2. Example `Dockerfile`:

```dockerfile
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

3. Build and run the image:

```bash
docker build -t tic-tac-toe-java .
docker run -p 8080:8080 tic-tac-toe-java
```

Optional `docker-compose.yml`:

```yaml
version: '3.8'
services:
	app:
		build: .
		ports:
			- "8080:8080"

```

The app will be available at `http://localhost:8080/`.
