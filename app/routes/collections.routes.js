const { authJwt } = require("../middleware");
const controller = require("../controllers/collections.controller");

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
   * /collections:
   *   get:
   *     summary: List all collections
   *     description: List all collections as an JSON array
   *     tags: [Collections]
   *     produces:
   *       - application/json
   *     parameters:
   *       - in: query
   *         name: account
   *         schema:
   *          type: string
   *          description: account address of colleciton
   *       - in: query
   *         name: limit
   *         schema:
   *          type: integer
   *          description: The numbers of items to return
   *     responses:
   *       200:
   *         description: "successful operation"

   */
  app.get("/api/v1/collections", controller.all);
  /**
   * @swagger
   * /collections/add:
   *   post:
   *     summary: Add new records in collections list
   *     description: "This API is for Adding new records in collections list"
   *     tags: [Collections]
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
   *            - address
   *            - creator
   *            - owner
   *          properties:
   *            name:
   *              type: string
   *            address:
   *              type: string
   *            creator:
   *              type: string
   *            txhash:
   *              type: string
   *            logo_uri:
   *              type: string
   *            feature_uri:
   *              type: string
   *            banner_uri:
   *              type: string
   *            custom_uri:
   *              type: string
   *            status:
   *              type: string
   *            description:
   *              type: string
   *            image:
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
  app.post("/api/v1/collections/add", controller.add);
  /**
   * @swagger
   * /collections/update/{id}:
   *   put:
   *     summary: update collection by id
   *     description: This API is for updating.
   *     tags: [Collections]
   *     produces:
   *       - application/json
   *     parameters:
   *       - name: body
   *         description: Application Version.
   *         in: body
   *         required: true
   *         schema:
   *          type: object
   *          properties:
   *            name:
   *              type: string
   *            address:
   *              type: string
   *            txhash:
   *              type: string
   *            creator:
   *              type: string
   *            logo_uri:
   *              type: string
   *            feature_uri:
   *              type: string
   *            banner_uri:
   *              type: string
   *            custom_uri:
   *              type: string
   *            status:
   *              type: string
   *            description:
   *              type: string
   *            image:
   *              type: string
   *       - name: id
   *         description: id of item to be updated.
   *         in: path
   *         required: true
   *         type: string
   *     responses:
   *       200:
   *         description: Response contain success message.
   *         schema:
   *           type: object
   *           properties:
   *            message:
   *              type: string
   *       426:
   *         description: "Indicate that version in header is not supported"

   *       404:
   *         description: "Indicate driver_id is not valid."

   *       401:
   *         description: "User don't have permissions to execute this API or token is not valid"

   *       498:
   *         description: "Indicate Auth token is invalid or Expired"

   */
  app.put("/api/v1/collections/update/:id", controller.update);
};
