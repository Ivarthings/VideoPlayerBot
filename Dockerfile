FROM debian

# Install system dependencies
RUN apt update && apt install -y git ffmpeg && apt clean

# Set working directory
WORKDIR /safone/

# Copy your project files
COPY . .

# Install Python dependencies
RUN pip install -r requirements.txt

# Default command
CMD ["python", "main.py"]
