const DNS = artifacts.require('DecentralizedNameService');

contract('DecentralizedNameService', accounts => {
  let [alice, bob] = accounts;
  let contract;
  beforeEach(async () => {
    contract = await DNS.new();
  });
  it('should allow user to purchase domain', async () => {
    await contract.purchaseDomainName(alice, 'ibl.com', 0, {
      from: alice,
      value: 1000000000000000
    });
    const name = await contract.ownerOf('ibl.com:btc', {
      from: alice
    });
    assert.equal(name, alice);
  });
  it('should allow user to transfer domain', async () => {
    await contract.purchaseDomainName(alice, 'ibl.com', 0, {
      from: alice,
      value: 1000000000000000
    });
    await contract.transferFrom(alice, bob, 'ibl.com:btc', { from: alice });
    const name = await contract.ownerOf('ibl.com:btc', {
      from: bob
    });
    assert.equal(name, bob);
  });
});
