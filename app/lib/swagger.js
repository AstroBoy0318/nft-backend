'use strict';

const config       = require('./config')();
const swaggerJSDoc = require('swagger-jsdoc');
const express      = require('express');
const appRoot   = require('app-root-path');


const pathToSwaggerUi = require('swagger-ui-dist').absolutePath();
const swaggerUi = require("swagger-ui-express");

const swagger = (app) => {
  const swaggerSpec = swaggerJSDoc({
    swaggerDefinition : config.swagger,
    apis              : [`${appRoot}/app/routes/**/*.js`]
  });

  app.use(
	  "/api-docs",
	  swaggerUi.serve,
	  swaggerUi.setup(swaggerSpec, { explorer: true })
  );
};

module.exports = swagger;
