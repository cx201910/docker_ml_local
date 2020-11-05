# Dockerfile

# Pull base image
FROM python:3.8

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1 
ENV DJANGO_DEBUG=0

RUN mkdir /code

# Set work directory
WORKDIR /code

# Create directory for static files
RUN mkdir /code/staticfiles

# Install dependencies
COPY requirements.txt /code/
RUN pip install -r requirements.txt

# Copy project
COPY . /code/

# Collect static files
RUN python manage.py collectstatic --noinput

#CMD gunicorn ml_service.wsgi:application --bind 0.0.0.0:$PORT
