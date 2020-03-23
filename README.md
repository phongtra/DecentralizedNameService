"# DecentralizedNameService"

**About this project**

This is a service where users can pass their crypto addresses and they will receive a domain name which will represent their addresses. There are countless time where users cannot remember their long complicated addresses, so this service is intended for any users who has a lot of crypto addresses and do not want to go through the hassel of looking up and copy and paste their addresses.

This is similar to Domain Name Service where it can translate domain name into ip addresses. This is essentially the same thing but from domain name to crypto addresses.

**To run**

First, run `npm install`

Then `truffle compile` to compile the project.

Then `truffle test` to run test.

Finally, `truffle migrate` to deploy the project. The project will be deployed to local network. If you would like to deploy to Rinkeby or Rapston, modify `truffle-config.js` accordingly.

Example code

```
 rinkeby: {
      // Special function to setup the provider
      provider: function() {
        // Setting the provider with the Infura Rinkeby address and Token
        return new HDWalletProvider(
          keys.mnemonic,
          `https://rinkeby.infura.io/v3/${keys.token}`
        );
      },
      // Network id is 4 for Rinkeby
      network_id: 4
    }
```

Paste that code snippet underneath development. This code snippet is for Rinkeby deployment. Make sure you have your own mnemonic phrases and token.
