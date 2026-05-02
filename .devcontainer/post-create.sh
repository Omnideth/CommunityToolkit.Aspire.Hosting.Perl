sudo apt-get update && \
    sudo apt upgrade -y && \
    sudo apt-get install -y cpanminus protobuf-compiler libprotobuf-dev libprotoc-dev cmake g++ && \
    sudo apt-get install -y dos2unix libsecret-1-0 xdg-utils libnss3 libnspr4 libdbus-1-3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libatspi2.0-0 libx11-6 libxcomposite1 libxdamage1 libxext6 libxfixes3 libxrandr2 libgbm1 libxcb1 libxkbcommon0 libpango-1.0-0 libcairo2 libasound2 && \
    sudo apt clean -y && \
    sudo rm -rf /var/lib/apt/lists/*

# Note: DNegstad wrote a VS Code extension to do the auto trust for you.  https://github.com/dnegstad/devcontainer-dev-certs

echo Install Aspire
curl -sSL https://aspire.dev/install.sh | bash

echo Installing Bun
curl -fsSL https://bun.sh/install | bash

echo Setting up dapr
dapr init

echo "Setting up perl dependencies for packages"
# Note: CPAN module names are Pascal case (e.g. Carton), but installed binaries are lowercase (e.g. carton).
sudo cpanm Carton --notest --force

echo Done!
