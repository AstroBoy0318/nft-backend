const { authJwt } = require("../middleware");
const controller = require("../controllers/categories.controller");

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
   * /categories:
   *   get:
   *     summary: List all category
   *     description: List all collections as an JSON array
   *     tags: [Categories]
   *     produces:
   *       - application/json
   *     responses:
   *       200:
   *         description: "successful operation"
   */

  app.get("/api/v1/categories", controller.all);
  /**
   * @swagger
   * /categories/add:
   *   post:
   *     summary: Add new records in category list
   *     description: "This API is for Adding new records in items list"
   *     tags: [Categories]
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
   *
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
  app.post("/api/v1/categories/add", controller.add);
  /**
   * @swagger
   * /categories/update/{id}:
   *   put:
   *     summary: update item by id
   *     description: This API is for updating.
   *     tags: [Categories]
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
  app.put("/api/v1/categories/update/:id", controller.update);

};
