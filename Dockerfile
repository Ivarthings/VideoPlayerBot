FROM python:3.9.2-slim

# Install dependencies
RUN apt update && apt install -y git ffmpeg && apt clean

# Create and set working directory
WORKDIR /safone/

# Copy project files
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Run the app
CMD ["python", "main.py"]
