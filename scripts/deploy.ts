import { ethers } from "hardhat";



async function main() {
  const Launchpad = await ethers.getContractFactory("Launchpad");

  
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });