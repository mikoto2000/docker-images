FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build-env

RUN cd /opt \
    && git clone https://github.com/mikoto2000/MicrosoftGraphApiExcelEditMcp.git \
    && cd MicrosoftGraphApiExcelEditMcp \
    && dotnet build --configuration Release


FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime-env

COPY --from=build-env \
     /opt/MicrosoftGraphApiExcelEditMcp/bin/Release/net10.0 \
     /opt/edit-excel

ENTRYPOINT ["/opt/edit-excel/edit-excel", "--urls", "http://0.0.0.0:3001"]

