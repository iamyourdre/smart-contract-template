require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

const NETWORK_URL = process.env.NETWORK_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

module.exports = {
  solidity: "0.8.28",
  networks: {
    localhost: {
      url: `http://${NETWORK_URL}`,
      accounts: [PRIVATE_KEY],
    },
  },
};