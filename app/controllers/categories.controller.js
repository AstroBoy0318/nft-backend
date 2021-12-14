const db = require("../models");
const Categories = db.categories;

exports.all = (req, res) => {
    Categories.findAll({})
        .then(datas => {
            res.status(200).send({categories: datas});
        })
        .catch(err => {
            res.status(500).send([]);
        });
};

exports.add = (req, res) => {
    Categories.create({
        name: req.body.name,
    }).then(res_data => {
        return res.status(200).send({ status: 'success', message: 'Category is successfully added'});
    }).catch(err => {
        return res.status(500).send({ status: 'fail', message: err.message});
    })
}

exports.update = (req, res) => {
    let item = req.body;
    Categories.update(
        item,
        {where: {id: req.params.id}}
    )
    .then(res_data => {
        return res.status(200).send({ status:'success', message: "Category is successfully updated" });
    })
    .catch(err => {
        return res.status(500).send({ status:'fail', message: err.message });
    });
}
