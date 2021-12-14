const { authJwt } = require("../middleware");
const controller = require("../controllers/items.controller");

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
   * /items:
   *   get:
   *     summary: List all items
   *     description: List all collections as an JSON array
   *     tags: [Items]
   *     produces:
   *       - application/json
   *     parameters:
   *       - in: query
   *         name: sortBy
   *         schema:
   *           type: string
   *           description: sortBy
   *       - in: query
   *         name: page
   *         schema:
   *          type: number
   *       - in: query
   *         name: limit
   *         schema:
   *          type: number
   *       - in: query
   *         name: owner
   *         schema:
   *          type: string
   *       - in: query
   *         name: category
   *         schema:
   *          type: number
   *       - in: query
   *         name: sortDir
   *         schema:
   *          type: string
   *       - in: query
   *         name: search
   *         schema:
   *          type: string
   *       - in: query
   *         name: collectionId
   *         schema:
   *          type: string
   *     responses:
   *       200:
   *         description: "successful operation"
   */

  app.get("/api/v1/items", controller.all);
  /**
   * @swagger
   * /items/add:
   *   post:
   *     summary: Add new records in items list
   *     description: "This API is for Adding new records in items list"
   *     tags: [Items]
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
   *            - tokenId
   *            - metadata
   *            - collectionId
   *            - creator
   *            - owner
   *          properties:
   *            name:
   *              type: string
   *            assetType:
   *              type: string
   *            category:
   *              type: number
   *            tokenId:
   *              type: number
   *            metadata:
   *              type: string
   *            txHash:
   *              type: string
   *            external_link:
   *              type: string
   *            description:
   *              type: string
   *            property:
   *              type: string
   *            mint_price:
   *              type: number
   *            price:
   *              type: number
   *            collectionId:
   *              type: string
   *            creator:
   *              type: string
   *            owner:
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
  app.post("/api/v1/items/add", controller.add);
  /**
   * @swagger
   * /items/update/{id}:
   *   put:
   *     summary: update item by id
   *     description: This API is for updating.
   *     tags: [Items]
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
   *            status:
   *              type: number
   *            name:
   *              type: string
   *            tokenId:
   *              type: number
   *            metadata:
   *              type: string
   *            txHash:
   *              type: string
   *            assetType:
   *              type: string
   *            external_link:
   *              type: string
   *            description:
   *              type: string
   *            property:
   *              type: string
   *            mint_price:
   *              type: number
   *            price:
   *              type: number
   *            collectionId:
   *              type: string
   *            creator:
   *              type: string
   *            owner:
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
  app.put("/api/v1/items/update/:id", controller.update);

  app.get("/api/v1/items/:collectionId/:tokenId", controller.one);

};
