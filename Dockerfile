FROM node

RUN npm i -g npx@10.2.0
RUN npm i -g typescript
RUN npm i -g ts-node
RUN npm i @types/node

ENTRYPOINT ["npx"]
