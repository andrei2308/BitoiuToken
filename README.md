# BitoiuToken

BitoiuToken is a simple implementation of an ERC-20 token using the standard provided by the OpenZeppelin library. The project offers basic functionalities required for an ERC-20 token.

## Features

- Transfer tokens to other addresses.
- Approve and allocate tokens to other addresses.
- Functions to check balances and available allocations.
- Ability to mint or burn tokens.

## Technologies Used

- **Solidity**: Programming language for smart contracts.
- **OpenZeppelin**: Standard library for secure and efficient smart contracts.

## How to Use

1. Clone the repository:
   ```bash
   git clone https://github.com/andrei2308/BitoiuToken.git
   cd BitoiuToken
   ```

2. Install dependencies:
   ```bash
   forge install
   ```

3. Compile the contracts:
   ```bash
   forge build
   ```

4. Test the functionalities with the command:
   ```bash
   forge test
   ```

5. Deploy the contract on an Ethereum network:
   ```bash
   forge script scripts/Deploy.s.sol --rpc-url <network-rpc-url> --private-key <your-private-key> --broadcast
   ```

## Key Functions

- `transfer(address to, uint256 amount)`: Transfers tokens to another address.
- `approve(address spender, uint256 amount)`: Approves an address to spend tokens.
- `allowance(address owner, address spender)`: Checks the available allocation for an address.
- `mint(address to, uint256 amount)`: Mints new tokens.
- `burn(uint256 amount)`: Burns existing tokens.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

