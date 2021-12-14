const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

module.exports = function(app) {
  
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  app.get("/api/v1/user/all",[authJwt.verifyToken, authJwt.isAdmin],controller.userAll);
  app.get("/api/v1/user/deactiveall",[authJwt.verifyToken, authJwt.isAdmin],controller.userDeactiveAll);
  app.get("/api/v1/user/activeall",[authJwt.verifyToken, authJwt.isAdmin],controller.userActiveAll);
  app.post("/api/v1/user/one",[authJwt.verifyToken],controller.userOne);
  app.post("/api/v1/user/update", [authJwt.verifyToken], controller.update);
  app.post("/api/v1/user/updatePassword", [authJwt.verifyToken], controller.updatePassword);
  app.post("/api/v1/user/delete", [authJwt.verifyToken, authJwt.isAdmin], controller.delete);
  app.post("/api/v1/user/setActive", [authJwt.verifyToken, authJwt.isAdmin], controller.setActive);

};
