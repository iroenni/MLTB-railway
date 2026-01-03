FROM anasty17/mltb:latest

# Actualiza e instala dependencias básicas
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .

# Opción 1: Con entorno virtual (recomendado)
RUN python3 -m venv /venv
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt
ENV PATH="/venv/bin:$PATH"

# Opción 2: Sin entorno virtual
# RUN pip3 install --no-cache-dir --break-system-packages -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]