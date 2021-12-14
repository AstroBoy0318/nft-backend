const db = require("../models");
const Accounts = db.accounts;
const Collections = db.collections;
const Items = db.items;
const Categories = db.categories;

const Sequelize = require('sequelize');
const Op = Sequelize.Op;

exports.all = (req, res) => {
    let query = {};
    let condition = {};
    let mysort = [];
    let sort = "";

    if (req.query.search != undefined && req.query.search != '') {
        query.name = {
            [Op.like]: '%'+req.query.search+'%'
        }
    }
    if (req.query.owner != undefined && req.query.owner != '') {
        query.owner = req.query.owner;
    }
    if (req.query.collectionId != undefined && req.query.collectionId != '') {
        query.collectionId = req.query.collectionId;
    }
    if( req.query.category != undefined && req.query.category != '' && req.query.category > 0 ) {
        query.category = req.query.category;
    }
    condition.length = req.query.limit * 1;
    condition.start = req.query.page * req.query.limit;

    if (req.query.sortBy == 'createdAt') {
        sort = 'createdAt';
    } else if (req.query.sortBy == 'views') {
        sort = 'views';
    } else if (req.query.sortBy == 'price') {
        sort = 'price';
    }
    if (req.query.sortDir == 'asc') {
        mysort[sort] = "ASC";
    } else {
        mysort[sort] = "DESC";
    }



    Items.findAll({
        where : query,
        limit: condition.length,
        offset: condition.start,
        order: mysort,
        include: [
            {
                model: Collections
            },
            {
                model: Accounts
            }
        ]
    })
        .then(datas => {
            res.status(200).send({items: datas});
        })
        .catch(err => {
            console.log(err);
            res.status(500).send({items: []});
        });
};

exports.add = (req, res) => {
    Items.create({
        category: req.body.category,
        name: req.body.name,
        collectionId: req.body.collectionId,
        assetType: req.body.assetType,
        tokenId: req.body.tokenId,
        txHash: req.body.txHash,
        metadata: req.body.metadata,
        external_link: req.body.external_link,
        description: req.body.description,
        image: req.body.image,
        property: req.body.property,
        mint_price: req.body.mint_price,
        price: req.body.price,
        creator: req.body.creator,
        owner: req.body.owner,
    }).then(res_data => {
        return res.status(200).send({ status: 'success', message: 'NFT item is successfully added'});
    }).catch(err => {
        return res.status(500).send({ status: 'fail', message: err.message});
    })
}

exports.update = (req, res) => {
    let item = req.body;
    Items.update(
        item,
        {where: {id: req.params.id}}
    )
    .then(res_data => {
        return res.status(200).send({ status:'success', message: "NFT item is successfully updated" });
    })
    .catch(err => {
        return res.status(500).send({ status:'fail', message: err.message });
    });
}

exports.one = (req, res) => {
    Items.findOne({
        where: {
            collectionId: req.params.collectionId,
            tokenId: req.params.tokenId,
        }
    })
    .then(async result => {
        let creatorObj = await Accounts.findOne({where: {address: result.creator.toLowerCase()}});
        let ownerObj = await Accounts.findOne({where: {address: result.owner.toLowerCase()}});
        let category = await Categories.findOne({where: {id: result.category}});
        console.log(ownerObj)
        result.creatorObj = creatorObj;
        result.ownerObj = ownerObj;
        let data = {
            id: result.id,
            category: category.name,
            tokenId: result.tokenId,
            collectionId: result.collectionId,
            name: result.name,
            price: result.price,
            mint_price: result.mint_price,
            assetType: result.assetType,
            metadata: result.metadata,
            image: result.image,
            creator: result.creator,
            owner: result.owner,
            description: result.description,
            txHash: result.txHash,
            createdAt: result.createdAt,
            updatedAt: result.updatedAt,
            creatorObj: creatorObj,
            ownerObj: ownerObj,
        };
        res.status(200).send({item: data})
    })
    .catch(err => {
        res.status(500).send({item: {}})
    });
}
