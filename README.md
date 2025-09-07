# flakes-E
a django web app for searching movies with tmdb


# How to run
## Global
**NOTE**: Before you start you need to set the **Google client id and Secret** in the _.env_ for Google oAuth

## Linux
Requirements:
* **Pip** and **Python**
* UV package manager

1. Clone the repo and change the directory to the Projects directory. Optionally source the venv:
```bash
uv venv
source .venv/bin/activate
```

2. Install all dependencies:
```bash
uv sync
```

3. Run server
```bash
uv run manage.py runserver
```

All commands:
```bash
uv venv
source .venv/bin/activate
uv sync
uv run manager.py runserver
```

## Docker
Requirements: Docker cli

1. Build the container
```bash
docker build -tag flakes:latest .
```

2. Run the container:
```bash
docker run flakes:latest
```

All commands:
```bash
docker build -tag flakes:latest .
docker run -p 8000:8000 flakes:latest
```
The docker file uses **ASGI** 

**_NOTE:_ The app will run on port 8000 on localhost and 0.0.0.0**
