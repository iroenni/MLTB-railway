FROM anasty17/mltb:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .

# Crea y usa entorno virtual
RUN python3 -m venv /venv
RUN /venv/bin/pip install --no-cache-dir -r requirements.txt

# Configura PATH para usar el entorno virtual
ENV PATH="/venv/bin:$PATH"

COPY . .

CMD ["bash", "start.sh"]