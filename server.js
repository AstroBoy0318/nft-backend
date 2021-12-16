const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const swagger = require('./app/lib/swagger');

const app = express();
const router = express.Router();

// var corsOptions = {
//   origin: "localhost:3000"
// };

var corsOptions = {
    //  origin: "http://localhost:3000"
    origin: "*"
};

app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const db = require("./app/models");
const Role = db.role;

app.get("/", (req, res) => {
    // res.json({ message: "Welcome to bezkoder application." });
    res.send('todo app with jwt swagger UI doc => <a href="/api-docs">/docs</a>');
});

require('./app/routes/auth.routes')(app);
require('./app/routes/user.routes')(app);
require('./app/routes/categories.routes')(app);
require('./app/routes/accounts.routes')(app);
require('./app/routes/collections.routes')(app);
require('./app/routes/items.routes')(app);

//app.use('/api/v1/', router);

swagger(app);

const PORT = process.env.PORT || 8080;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}.`);
});