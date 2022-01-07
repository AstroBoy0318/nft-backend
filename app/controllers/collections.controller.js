const db = require("../models");
const Collections = db.collections;
const Accounts = db.accounts;
const Items = db.items;

exports.all = (req, res) => {
    const address = req.query.account;
    let limit = req.query.limit;
    if (!limit || limit == "")
        limit = "999";
    let query = {};
    if (address != undefined && address != "") {
        query = { owner: address.toLowerCase() };
    }
    Collections.findAll({
            limit: Number(limit),
            offset: 0,
            where: query,
            include: [{
                model: Accounts
            }]
        }).then(datas => {
            res.status(200).send({ collections: datas });
        })
        .catch(err => {
            res.status(500).send({ collections: [] });
        });
};

exports.add = (req, res) => {
    Collections.create({
        name: req.body.name,
        address: req.body.address,
        creator: req.body.creator,
        owner: req.body.owner,
        logo_uri: req.body.logo_uri,
        feature_uri: req.body.feature_uri,
        banner_uri: req.body.banner_uri,
        custom_uri: req.body.custom_uri,
        status: req.body.status,
        txhash: req.body.txhash,
        description: req.body.description,
        image: req.body.image
    }).then(res_data => {
        return res.status(200).send({ status: 'success', message: 'Collection is successfully added' });
    }).catch(err => {
        return res.status(500).send({ status: 'fail', message: err.message });
    })
}

exports.update = (req, res) => {
    let item = req.body;
    Collections.update(
            item, { where: { id: req.params.id } }
        )
        .then(res_data => {
            return res.status(200).send({ status: 'success', message: "NFT collection is successfully updated" });
        })
        .catch(err => {
            return res.status(500).send({ status: 'fail', message: err.message });
        });
}