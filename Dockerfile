

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /source

COPY ./*.csproj ./edora_cloud_test/
WORKDIR /source/edora_cloud_test
RUN dotnet restore 

WORKDIR /source
COPY ./. ./edora_cloud_test/
WORKDIR /source/edora_cloud_test
RUN dotnet publish -c release -o /app 

FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "edora_cloud_test.dll"]
