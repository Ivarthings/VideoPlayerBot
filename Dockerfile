FROM debian:latest

# Install system packages
RUN apt update && apt upgrade -y && \
    apt install -y git python3 python3-pip python3-venv ffmpeg

# Set up working directory
RUN mkdir /safone/
WORKDIR /safone/

# Copy your code
COPY . /safone/

# Create a virtual environment and activate it
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Install Python dependencies in the venv
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Run your app
CMD ["python", "main.py"]
