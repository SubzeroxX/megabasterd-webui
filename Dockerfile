# Pull the baseimage.
FROM jlesage/baseimage-gui:alpine-3.19-v4

# Install xterm.
RUN add-pkg xterm curl openjdk21 ttf-dejavu fontconfig font-noto-cjk

RUN curl -# -L -o /defaults/megabasterd.jar https://github.com/tonikelope/megabasterd/releases/download/v8.22/MegaBasterd_8.22.jar
RUN \
    APP_ICON_URL=https://raw.githubusercontent.com/tonikelope/megabasterd/master/src/main/resources/images/pica_roja_big.png && \
    install_app_icon.sh "$APP_ICON_URL"
# Set the application name.
RUN set-cont-env APP_NAME "Megabasterd"

RUN mkdir -p /output/.megabasterd8.22
RUN mkdir /output/.megabasterd_old_backups
RUN chown -R 1000:1000 /output

VOLUME ["/output"]
EXPOSE 1337
EXPOSE 9999
# Copy the start script.
COPY startapp.sh /startapp.sh