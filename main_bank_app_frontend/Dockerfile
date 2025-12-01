FROM node:18-alpine



COPY . .

RUN npm install --save-dev @babel/plugin-proposal-private-property-in-object
RUN npm install --save react react-dom @types/react @types/react-dom
RUN npm install react-scripts@3.0.1  --save
RUN npm install

# Attempt to fix vulnerabilities, but continue if it fails
RUN npm audit fix --force || echo "Continuing despite npm audit fix failures"

EXPOSE 3000

CMD ["npm", "start"]