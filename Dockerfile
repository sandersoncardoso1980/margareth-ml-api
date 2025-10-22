# Escolhendo Python 3.12 slim para evitar problemas de compilação
FROM python:3.12-slim

# Define diretório de trabalho
WORKDIR /app

# Copia somente o requirements primeiro para otimizar cache do Docker
COPY requirements.txt .

# Atualiza pip e instala dependências
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Copia todo o projeto para o container
COPY . .

# Porta que o uvicorn vai expor
EXPOSE 8000

# Configura variáveis de ambiente padrão (substituíveis no Render)
ENV PORT=8000
ENV HOST=0.0.0.0

# Comando para rodar FastAPI
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
