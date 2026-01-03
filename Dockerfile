FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# Asegúrate de tener las herramientas necesarias
RUN apt-get update && \
    apt-get install -y python3-venv python3-pip && \
    apt-get clean

COPY requirements.txt .

# Crea entorno virtual
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Instala dependencias
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]