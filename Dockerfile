FROM node

RUN npm install -g npx@10.2.0
RUN npm install -g typescript
RUN npm install -g ts-node

ENTRYPOINT ["npx"]
