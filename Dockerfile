#Pull Base image from Docker
FROM python:3.7-alpine

# Set the working directory to /app
WORKDIR /app

#Copy main server runner file app-web.py to container path
COPY app-web-db.py /app/app-web-db.py
#Copy requirements/dependencies file to container path
COPY requirements.txt requirements.txt

#Install Dependencies
# RUN apk add --no-cache gcc musl-dev linux-headers
RUN pip install -r requirements.txt
# Install gcc and other dependencies
RUN apk add --no-cache gcc musl-dev linux-headers

# Set environment variables used by flask
ENV FLASK_APP=app-web-db.py
ENV FLASK_RUN_HOST=0.0.0.0

# Copy the current directory to the workdir . in the image.
COPY . .

#Command to run flask run in the container
CMD ["flask", "run"]
