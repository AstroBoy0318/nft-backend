'use strict';

const fs     = require('fs');
const yaml   = require('js-yaml');

const assign = Object.assign;

const config = () => {
  const env = process.env.NODE_ENV || 'local';
  const global = yaml.safeLoad(fs.readFileSync('./app/config/config.yml', 'utf8'));
  return assign(global);
};

module.exports = config;
