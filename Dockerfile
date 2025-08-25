# Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

COPY *.sln .
COPY HolaMundoApp/*.csproj ./HolaMundoApp/
RUN dotnet restore

COPY HolaMundoApp/. ./HolaMundoApp/
WORKDIR /app/HolaMundoApp
RUN dotnet publish -c Release -o out

# Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/HolaMundoApp/out .
ENTRYPOINT ["dotnet", "HolaMundoApp.dll"]
