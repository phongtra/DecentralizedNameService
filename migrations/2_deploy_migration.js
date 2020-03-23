const DNS = artifacts.require('DecentralizedNameService');

module.exports = function(deployer) {
  deployer.deploy(DNS);
};
