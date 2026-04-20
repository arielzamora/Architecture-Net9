# Consulte https://aka.ms/customizecontainer para aprender a personalizar su contenedor de depuración y cómo Visual Studio usa este Dockerfile para compilar sus imágenes para una depuración más rápida.

# Esta fase se usa cuando se ejecuta desde VS en modo rápido (valor predeterminado para la configuración de depuración)
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081


# Esta fase se usa para compilar el proyecto de servicio
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["Pacagroup.Ecommerce.Services.WebApi/Pacagroup.Ecommerce.Services.WebApi.csproj", "Pacagroup.Ecommerce.Services.WebApi/"]
COPY ["Pacagroup.Ecommerce.Application.Dto/Pacagroup.Ecommerce.Application.Dto.csproj", "Pacagroup.Ecommerce.Application.Dto/"]
COPY ["Pacagroup.Ecommerce.Application.Interface/Pacagroup.Ecommerce.Application.Interface.csproj", "Pacagroup.Ecommerce.Application.Interface/"]
COPY ["Pacagroup.Ecommerce.Transversal.Common/Pacagroup.Ecommerce.Transversal.Common.csproj", "Pacagroup.Ecommerce.Transversal.Common/"]
COPY ["Pacagroup.Ecommerce.Domain.Entity/Pacagroup.Ecommerce.Domain.Entity.csproj", "Pacagroup.Ecommerce.Domain.Entity/"]
COPY ["Pacagroup.Ecommerce.Application.Main/Pacagroup.Ecommerce.Application.Main.csproj", "Pacagroup.Ecommerce.Application.Main/"]
COPY ["Pacagroup.Ecommerce.Domain.Interface/Pacagroup.Ecommerce.Domain.Interface.csproj", "Pacagroup.Ecommerce.Domain.Interface/"]
COPY ["Pacagroup.Ecommerce.Transversal.Logging/Pacagroup.Ecommerce.Transversal.Logging.csproj", "Pacagroup.Ecommerce.Transversal.Logging/"]
COPY ["Pacagroup.Ecommerce.Domain.Core/Pacagroup.Ecommerce.Domain.Core.csproj", "Pacagroup.Ecommerce.Domain.Core/"]
COPY ["Pacagroup.Ecommerce.Infrastructure.Interface/Pacagroup.Ecommerce.Infrastructure.Interface.csproj", "Pacagroup.Ecommerce.Infrastructure.Interface/"]
COPY ["Pacagroup.Ecommerce.Infrastructure.Repository/Pacagroup.Ecommerce.Infrastructure.Repository.csproj", "Pacagroup.Ecommerce.Infrastructure.Repository/"]
COPY ["Pacagroup.Ecommerce.Infrastructure.Data/Pacagroup.Ecommerce.Infrastructure.Data.csproj", "Pacagroup.Ecommerce.Infrastructure.Data/"]
RUN dotnet restore "./Pacagroup.Ecommerce.Services.WebApi/Pacagroup.Ecommerce.Services.WebApi.csproj"
COPY . .
WORKDIR "/src/Pacagroup.Ecommerce.Services.WebApi"
RUN dotnet build "./Pacagroup.Ecommerce.Services.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/build

# Esta fase se usa para publicar el proyecto de servicio que se copiará en la fase final.
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./Pacagroup.Ecommerce.Services.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# Esta fase se usa en producción o cuando se ejecuta desde VS en modo normal (valor predeterminado cuando no se usa la configuración de depuración)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Pacagroup.Ecommerce.Services.WebApi.dll"]