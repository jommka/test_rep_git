FROM node:14.16.1

ARG user=app
ARG uid=2000
ARG gid=2000
RUN groupadd --gid $gid $user && useradd --uid $uid --gid $user --shell /bin/bash --create-home $user

RUN mkdir "/vsu" && chown app:app "/vsu"
USER ${user:-app}
WORKDIR /vsu

COPY --chown=app:app package*.json ./

RUN npm install

EXPOSE 3001

COPY --chown=app:app .. .

ENTRYPOINT ["npm", "run", "start"]