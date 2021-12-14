const db = require("../models");
const Collections = db.collections;
const Accounts = db.accounts;

exports.all = (req, res) => {
    Accounts.findAll({})
        .then(datas => {
            res.status(200).send({ user: datas });
        })
        .catch(err => {
            res.status(500).send({ user: [] });
        });
};

exports.one = (req, res) => {
    Accounts.findOne({
            where: {
                address: req.params.address
            }
        })
        .then(user => {
            res.status(200).send({ user: user })
        })
        .catch(err => {
            res.status(500).send({ user: {} })
        });
}

exports.add = (req, res) => {
    Accounts.create({
        name: req.body.name,
        contract: req.body.contract,
        token_id: req.body.token_id,
        token_uri: req.body.token_uri,
        external_link: req.body.external_link,
        description: req.body.description,
        property: req.body.property,
        mint_price: req.body.mint_price,
        price: req.body.price,
        creator: req.body.creator,
        owner: req.body.owner,
    }).then(res_data => {
        return res.status(200).send({ status: 'success', message: 'Account is successfully added' });
    }).catch(err => {
        return res.status(500).send({ status: 'fail', message: err.message });
    })
}

exports.login = async(req, res) => {
    const res_token = req.body.signature;
    let existAccount = await Accounts.findOne({ where: { address: req.body.address } });
    if (existAccount == null || existAccount.length <= 0) {
        Accounts.create({
            address: req.body.address,
            signature: req.body.signature
        }).then(res_data => {
            return res.status(200).send({ status: 'success', message: 'Account is successfully added', token: res_token });
        }).catch(err => {
            return res.status(500).send({ status: 'fail', message: err.message });
        })
    } else {
        return res.status(200).send({ status: 'success', message: 'Account is successfully logged in', token: res_token });
    }

}

exports.update = (req, res) => {
    let item = req.body;
    Accounts.update(
            item, { where: { id: req.params.id } }
        )
        .then(res_data => {
            return res.status(200).send({ status: 'success', message: "Account is successfully updated" });
        })
        .catch(err => {
            return res.status(500).send({ status: 'fail', message: err.message });
        });
}

exports.save = async(req, res) => {
    let item = req.body;
    let account = await Accounts.findOne({
        where: {
            address: req.body.address
        }
    });
    if (!account) {
        Accounts.create(req.body).then(res_data => {
            return res.status(200).send({ status: 'success', message: 'Account is successfully added' });
        }).catch(err => {
            return res.status(500).send({ status: 'fail', message: err.message });
        })
    } else {

        let account_id = account.id;

        let updated_data = {
            name: req.body.name,
            description: req.body.description,
            avatar: req.body.avatar,
            twitter: req.body.twitter,
            telegram: req.body.telegram,
            instagram: req.body.instagram
        }

        Accounts.update(
                updated_data, { where: { id: account_id } }
            )
            .then(res_data => {
                return res.status(200).send({ status: 'success', message: "Account is successfully updated" });
            })
            .catch(err => {
                return res.status(500).send({ status: 'fail', message: err.message });
            });
    }

}