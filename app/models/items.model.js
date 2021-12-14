module.exports = (sequelize, Sequelize) => {
    const Items = sequelize.define("items", {
      collectionId: {
        type: Sequelize.STRING
      },
      tokenId: {
        type: Sequelize.INTEGER
      },
      category: {
        type: Sequelize.INTEGER
      },
      metadata: {
        type: Sequelize.STRING
      },
      assetType: {
        type: Sequelize.STRING
      },
      txHash: {
        type: Sequelize.STRING
      },
      image: {
        type: Sequelize.STRING
      },
      name: {
        type: Sequelize.STRING
      },
      external_link: {
        type: Sequelize.STRING
      },
      description: {
        type: Sequelize.STRING
      },
      property: {
        type: Sequelize.STRING
      },
      price: {
        type: Sequelize.DECIMAL
      },
      mint_price: {
        type: Sequelize.DECIMAL
      },
      creator: {
        type: Sequelize.STRING
      },
      owner: {
        type: Sequelize.STRING
      },
      is_active: {
        type: Sequelize.TINYINT
      },
      is_delete: {
        type: Sequelize.TINYINT
      },
      status: {
        type: Sequelize.TINYINT
      },
      createdAt: {
        type: Sequelize.DATE
      },
      updatedAt: {
        type: Sequelize.DATE
      }
    });
    return Items;
  };
