const { authJwt } = require("../middleware");
const controller = require("../controllers/accounts.controller");

module.exports = function(app) {
  
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  /**
   * @swagger
   * /accounts:
   *   get:
   *     summary: List all account
   *     description: List all collections as an JSON array
   *     tags: [Accounts]
   *     produces:
   *       - application/json
   *     responses:
   *       200:
   *         description: "successful operation"
   */

  app.get("/api/v1/accounts", controller.all);
  /**
   * @swagger
   * /accounts/save:
   *   post:
   *     summary: save record in account list
   *     description: "This API is for Adding new records in account list"
   *     tags: [Accounts]
   *     produces:
   *       - application/json
   *     parameters:
   *       - name: body
   *         description: This contains Detail of Collections as JSON Object.
   *         in: body
   *         required: true
   *         schema:
   *          type: object
   *          required:
   *            - name
   *          properties:
   *            name:
   *              type: string
   *            address:
   *              type: string
   *            avatar:
   *              type: string
   *            description:
   *              type: string
   *            twitter:
   *              type: string
   *            telegram:
   *              type: string
   *            instagram:
   *              type: string
   *
   *     responses:
   *       200:
   *         description: This contain to the success message
   *         schema:
   *           type: object
   *           properties:
   *            message:
   *              type: string
   *       426:
   *         description: "Indicate that version in header is not supported"
   *       400:
   *         description: "Indicate body parameters are not valid."
   *       401:
   *         description: "User don't have permissions to execute this API or token is not valid"
   *       498:
   *         description: "Indicate Auth token is invalid or Expired"
   */
  app.post("/api/v1/accounts/save", controller.save);

  /**
   * @swagger
   * /accounts/{address}:
   *   get:
   *     summary: List one account
   *     description: List all collections as an JSON array
   *     tags: [Accounts]
   *     produces:
   *       - application/json
   *     parameters:
   *       - name: address
   *         description: address of item to be updated.
   *         in: path
   *         required: true
   *         type: string
   *     responses:
   *       200:
   *         description: "successful operation"
   */

  app.get("/api/v1/accounts/:address", controller.one);

  /**
   * @swagger
   * /accounts/login:
   *   post:
   *     summary: Add new records in account list
   *     description: "This API is for Adding new records in account list"
   *     tags: [Accounts]
   *     produces:
   *       - application/json
   *     parameters:
   *       - name: body
   *         description: This contains Detail of Collections as JSON Object.
   *         in: body
   *         required: true
   *         schema:
   *          type: object
   *          required:
   *            - name
   *            - token_id
   *            - token_uri
   *            - contract
   *            - creator
   *            - owner
   *          properties:
   *            address:
   *              type: string
   *            signature:
   *              type: string
   *
   *     responses:
   *       200:
   *         description: This contain to the success message
   *         schema:
   *           type: object
   *           properties:
   *            message:
   *              type: string
   *       426:
   *         description: "Indicate that version in header is not supported"
   *       400:
   *         description: "Indicate body parameters are not valid."
   *       401:
   *         description: "User don't have permissions to execute this API or token is not valid"
   *       498:
   *         description: "Indicate Auth token is invalid or Expired"
   */
  app.post("/api/v1/accounts/login", controller.login);

};
