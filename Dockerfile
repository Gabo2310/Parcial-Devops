# Etapa 1: build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copiar todos los archivos de la solución
COPY *.sln ./
COPY HolaMundoApp/*.csproj ./HolaMundoApp/
COPY HolaMundoApp.Tests/*.csproj ./HolaMundoApp.Tests/

# Restaurar dependencias
RUN dotnet restore

# Copiar todo el código fuente
COPY . .

# Construir la solución
RUN dotnet build --no-restore -c Release

# Etapa 2: runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app

# Copiar la salida de build
COPY --from=build /app/HolaMundoApp/bin/Release/net9.0/publish/ ./

# Exponer puerto
EXPOSE 80

# Ejecutar la aplicación
ENTRYPOINT ["dotnet", "HolaMundoApp.dll"]
