#!/bin/sh

# exit immediately if password-manager-binary is already in $PATH
type op >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
    brew install 1password-cli
    ;;
Linux)
    case "$(uname -m)" in
    x86_64)
        ARCH="amd64"
        ;;
    aarch64 | arm64)
        ARCH="arm64"
        ;;
    *)
        echo "unsupported architecture"
        exit 1
        ;;
    esac

    OP_VERSION="v$(curl https://app-updates.agilebits.com/check/1/0/CLI2/en/2.0.0/N -s | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+')";
    curl -sSfo op.zip https://cache.agilebits.com/dist/1P/op2/pkg/"$OP_VERSION"/op_linux_"$ARCH"_"$OP_VERSION".zip
    unzip -o op.zip -d "$HOME/.local/bin"
    chmod +x "$HOME/.local/bin/op"
    rm op.zip
    ;;
*)
    echo "unsupported OS"
    exit 1
    ;;
esac
