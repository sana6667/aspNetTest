# ------------ Stage 1: Build ------------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# 1) Копируем csproj отдельно — чтобы кешировался restore
COPY AspNetLoginApp.csproj ./
RUN dotnet restore ./AspNetLoginApp.csproj

# 2) Копируем остальной код и публикуем
COPY . ./
RUN dotnet publish ./AspNetLoginApp.csproj -c Release -o /app/publish

# ------------ Stage 2: Runtime ------------
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

# Явно указываем порт 80 внутри контейнера
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

# Копируем опубликованные артефакты
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "AspNetLoginApp.dll"]
