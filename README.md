# LancePass - Advanced Password Generator

LancePass is a fast, robust, and highly customizable password generator written entirely in Bash. Originally designed as a tool for testing environments and platforms like Hack The Box (HTB), it allows you to generate secure credentials directly from the terminal with a clean and colorful interface.

## Key Features

* **Custom generation:** Total control over the password length.
* **Granular security:** Modular options to include (or exclude) special characters, numbers, and uppercase letters.
* **Error validation:** Input sanitization using Regular Expressions (Regex) to prevent crashes if the user provides invalid data.
* **Visual interface:** Stylized ASCII art banner with ANSI color codes.
## Usage

LancePass uses command-line arguments (flags) for fast, non-interactive execution.

### Available Flags:

| Flag | Description | Example |
| :---: | :--- | :--- |
| `-u` | Specifies the desired password length (must be an integer). | `-u 15` |
| `-s` | Includes special characters (`!@#$%^&*`). | `-s` |
| `-m` | Includes uppercase letters and numbers. | `-m` |
| `-h` | Shows the help panel and exits the program. | `-h` |
<img width="499" height="251" alt="Captura de pantalla 2026-07-04 213122" src="https://github.com/user-attachments/assets/53376232-9aa8-449f-abef-437e71a9b078" />


### Practical Example

To generate a highly secure 24-character password, including numbers, uppercase letters, and special symbols, simply run:

```bash
./lancepass.sh -u 24 -s -m 
```
<img width="658" height="172" alt="Captura de pantalla 2026-07-04 213029" src="https://github.com/user-attachments/assets/194737f4-5767-4e0c-8911-3264aa935051" />

## Installation

Clone this repository to your local machine and grant execution permissions to the script:

```bash
git clone https://github.com/danielbcastell23/lancepass.git
cd lancepass
chmod +x lancepass.sh
