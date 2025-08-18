FROM python:3.11-slim

WORKDIR /app

# Copy dependency files first
COPY pyproject.toml uv.lock ./

# Install dependencies
RUN pip install uv
RUN uv sync

# Copy the rest of your application code
COPY . .

EXPOSE 8000

# Run migrations (now that Django is correctly installed)
RUN uv run manage.py migrate

CMD ["uv","run", "uvicorn", "Flakes_E.asgi:application", "--host", "0.0.0.0", "--port", "8000"]
