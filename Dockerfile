# 1. Usar a imagem base do Python Alpine, conforme sua preferência.
FROM python:3.13.5-alpine3.22

# 2. Definir o diretório de trabalho dentro do contêiner
WORKDIR /app

# 3. Copiar o arquivo de requisitos e instala as dependências
COPY requirements.txt .

# 4. Instalar as dependências
# Usar --no-cache-dir mantém o tamanho da imagem menor
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# 6. Expõe a porta em que a aplicação FastAPI irá rodar (padrão é 8000)
EXPOSE 8000

# 7. Definir o comando para executar a aplicação
# Use 0.0.0.0 para torná-la acessível de fora do contêiner.
# A flag --reload é para desenvolvimento e foi removida para um ambiente de produção.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]