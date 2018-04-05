FROM ibmcom/ibmnode

ADD public/StoreWebApp /StoreWebApp

WORKDIR /StoreWebApp

# Install app dependencies
ADD https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 /usr/local/bin/jq
RUN chmod a+x /usr/local/bin/jq

RUN npm install
RUN npm -g install bower
RUN bower --allow-root install --force

RUN mv bower_components/ public/resources

ENV NODE_ENV production
ENV PORT 3000

EXPOSE 3000
CMD ["npm", "start"]
