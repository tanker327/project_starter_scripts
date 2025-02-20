#!/bin/bash

# Check if project_name parameter is provided
if [ -z "$1" ]; then
    echo "No project name provided. Please enter a project name (or press Enter for default 'my_module'):"
    read PROJECT_NAME
    if [ -z "$PROJECT_NAME" ]; then
        PROJECT_NAME="my_module"  # Default name if nothing is entered
    fi
else
    PROJECT_NAME="$1"  # Use the provided parameter
fi

# Configuration
VERSION="0.1.0"                   # Version of your module
AUTHOR="Your Name"                # Your name
EMAIL="your.email@example.com"    # Your email
DESCRIPTION="A simple utility module"  # Short description

# Create directory structure
echo "Creating directory structure for $PROJECT_NAME..."
mkdir -p "$PROJECT_NAME/$PROJECT_NAME" "$PROJECT_NAME/tests"
cd "$PROJECT_NAME" || exit

# Create __init__.py
echo "Creating $PROJECT_NAME/__init__.py..."
cat > "$PROJECT_NAME/__init__.py" <<EOL
from .core import add_numbers, multiply_numbers

__all__ = ['add_numbers', 'multiply_numbers']
EOL

# Create core.py
echo "Creating $PROJECT_NAME/core.py..."
cat > "$PROJECT_NAME/core.py" <<EOL
def add_numbers(a, b):
    """Add two numbers."""
    return a + b

def multiply_numbers(a, b):
    """Multiply two numbers."""
    return a * b
EOL

# Create setup.py
echo "Creating setup.py..."
cat > "setup.py" <<EOL
from setuptools import setup, find_packages

setup(
    name="$PROJECT_NAME",
    version="$VERSION",
    author="$AUTHOR",
    author_email="$EMAIL",
    description="$DESCRIPTION",
    packages=find_packages(exclude=['tests']),
    install_requires=[],
    python_requires='>=3.6',
)
EOL

# Create README.md with updated instructions
echo "Creating README.md..."
cat > "README.md" <<EOL
# $PROJECT_NAME

$DESCRIPTION

This module provides basic utility functions for mathematical operations. It is designed to be reusable across multiple Python projects.

## Installation

To use \`$PROJECT_NAME\` in your project, follow these steps:

1. **Clone or download the module** (if you have the source code):
   \`\`\`bash
   git clone <repository-url>
   cd $PROJECT_NAME
   \`\`\`

2. **Install the module**:
   - To install the module locally in editable mode (recommended for development):
     \`\`\`bash
     pip install -e .
     \`\`\`
     This allows you to modify the code without reinstalling the module.
   - For a standard installation:
     \`\`\`bash
     pip install .
     \`\`\`

3. **(Optional) Install testing dependencies**:
   \`\`\`bash
   pip install pytest
   \`\`\`

## Usage

Here are some examples of how to use the module in your Python projects:

### Adding Numbers
\`\`\`python
import $PROJECT_NAME

result = ${PROJECT_NAME}.add_numbers(2, 3)
print(result)  # Output: 5
\`\`\`

### Multiplying Numbers
\`\`\`python
import $PROJECT_NAME

result = ${PROJECT_NAME}.multiply_numbers(4, 5)
print(result)  # Output: 20
\`\`\`

### Combining Functions
\`\`\`python
import $PROJECT_NAME

sum_result = ${PROJECT_NAME}.add_numbers(10, 20)
product_result = ${PROJECT_NAME}.multiply_numbers(sum_result, 2)
print(product_result)  # Output: 60
\`\`\`

## Running Tests

The module includes unit tests to ensure functionality. To run them:

1. Ensure \`pytest\` is installed:
   \`\`\`bash
   pip install pytest
   \`\`\`

2. Run the tests:
   \`\`\`bash
   pytest tests/
   \`\`\`

   You should see output indicating whether the tests passed (e.g., \`2 passed in 0.01s\`).

## Adding a New Dependency

If your module requires additional Python libraries, follow these steps to add them:

1. **Update \`setup.py\`**:
   - Open \`setup.py\` and add the library to the \`install_requires\` list. For example, to add \`numpy\`, modify it like this:
     \`\`\`python
     install_requires=['numpy>=1.21.0'],
     \`\`\`
   - Multiple dependencies can be added as a list:
     \`\`\`python
     install_requires=['numpy>=1.21.0', 'pandas>=1.3.0'],
     \`\`\`

2. **(Optional) Update \`requirements.txt\`**:
   - Add the dependency to \`requirements.txt\` for development purposes (e.g., if not all dependencies are required for the module to function):
     \`\`\`
     numpy>=1.21.0
     \`\`\`
   - Install these dependencies locally with:
     \`\`\`bash
     pip install -r requirements.txt
     \`\`\`

3. **Reinstall the module**:
   - After updating dependencies, reinstall the module to include them:
     \`\`\`bash
     pip install -e .
     \`\`\`

4. **Test your changes**:
   - Ensure your code and tests still work with the new dependency.

Example: If you add \`numpy\` and use it in \`core.py\`, update your code and tests accordingly.

## Project Structure

\`\`\`
$PROJECT_NAME/
├── $PROJECT_NAME/
│   ├── __init__.py   # Module initialization
│   └── core.py       # Core functionality
├── tests/
│   └── test_core.py  # Unit tests
├── setup.py          # Packaging script
├── README.md         # This file
├── LICENSE           # License file
└── requirements.txt  # Dependencies
\`\`\`

## Contributing

1. Fork or clone the repository.
2. Make your changes in a new branch.
3. Add or update tests in the \`tests/\` folder.
4. Submit a pull request or push your changes.

Feel free to customize the module by adding new functions to \`$PROJECT_NAME/core.py\` and corresponding tests.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
EOL

# Create LICENSE (MIT License as an example)
echo "Creating LICENSE..."
cat > "LICENSE" <<EOL
MIT License

Copyright (c) $(date +%Y) $AUTHOR

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOL

# Create requirements.txt (with pytest for testing)
echo "Creating requirements.txt..."
cat > "requirements.txt" <<EOL
pytest>=7.0.0
EOL

# Create test file in tests/
echo "Creating tests/test_core.py..."
cat > "tests/test_core.py" <<EOL
import $PROJECT_NAME

def test_add_numbers():
    assert $PROJECT_NAME.add_numbers(2, 3) == 5
    assert $PROJECT_NAME.add_numbers(-1, 1) == 0
    assert $PROJECT_NAME.add_numbers(0, 0) == 0

def test_multiply_numbers():
    assert $PROJECT_NAME.multiply_numbers(2, 3) == 6
    assert $PROJECT_NAME.multiply_numbers(-2, 3) == -6
    assert $PROJECT_NAME.multiply_numbers(0, 5) == 0
EOL

# Make the module installable locally
echo "Installing the module locally in editable mode..."
pip install -e .

# Install pytest for testing
echo "Installing pytest for running tests..."
pip install pytest

echo "Module $PROJECT_NAME has been created and installed successfully!"
echo "You can test it by running: python -c 'import $PROJECT_NAME; print($PROJECT_NAME.add_numbers(2, 3))'"
echo "To run the tests, use: pytest tests/"
