FROM python:3.13-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Install dependencies
COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-install-project --no-dev

# Copy application code
COPY . .

# Expose port
EXPOSE 8000

# Command to run the application
CMD ["uv","run","python","app.py"]