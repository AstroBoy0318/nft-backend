module.exports = (sequelize, Sequelize) => {
    const Collections = sequelize.define("collections", {
      name: {
        type: Sequelize.STRING
      },
      description: {
        type: Sequelize.STRING
      },
      image: {
        type: Sequelize.STRING
      },
      address: {
        type: Sequelize.STRING
      },
      creator: {
        type: Sequelize.STRING
      },
      owner: {
        type: Sequelize.STRING
      },
      txhash: {
        type: Sequelize.STRING
      },
      logo_uri: {
        type: Sequelize.STRING
      },
      feature_uri: {
        type: Sequelize.STRING
      },
      banner_uri: {
        type: Sequelize.STRING
      },
      custom_uri: {
        type: Sequelize.STRING
      },
      status: {
        type: Sequelize.STRING
      },
      is_active: {
        type: Sequelize.TINYINT
      },
      is_delete: {
        type: Sequelize.TINYINT
      },
      createdAt: {
        type: Sequelize.DATE
      },
      updatedAt: {
        type: Sequelize.DATE
      }
    });
    return Collections;
  };
