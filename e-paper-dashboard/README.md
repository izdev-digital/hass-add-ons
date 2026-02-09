# izBoard Add-on

A dashboard interface optimized for izBoard displays, providing a clean, low-power way to view your Home Assistant data. Perfect for wall-mounted displays or remote monitoring stations.

**Project Repository**: [izBoard](https://github.com/izdev-digital/e-paper-dashboard)

## Features

- Optimized for e-paper display refresh rates
- Low power consumption
- Clean, readable interface
- Auto-start on system boot

## Installation

1. Add this repository to your Home Assistant instance:
   - Navigate to **Supervisor** → **Add-on Store** → **⋮ (menu)** → **Repositories**
   - Add the repository URL: `https://github.com/izdev-digital/hass-add-ons`
   - Click "Add"

2. Find "izBoard" in the Add-on Store

3. Click "Install"

4. Configure the add-on (see Configuration section below)

5. Click "Start"

## Configuration

The add-on requires the following configuration options:

### Required Settings

**CLIENT_URL** (string)
- The URL of your izBoard client device
- Example: `http://192.168.1.100` or `http://epaper.local`

**SUPERUSER_USERNAME** (string)
- Username for administrative access to the dashboard
- Example: `admin`

**SUPERUSER_PASSWORD** (password)
- Password for the superuser account
- Use a strong, unique password
- **Important**: This password is used for initial setup only. It is strongly recommended to change it through the application after first login for security purposes.

**STATE_SIGNING_KEY** (password)
- Cryptographic key for signing state data
- Generate a random secure key (recommended: 32+ characters)
- Example: Use a password generator or `openssl rand -hex 32`

### Example Configuration

```yaml
CLIENT_URL: "http://192.168.1.100"
SUPERUSER_USERNAME: "admin"
SUPERUSER_PASSWORD: "your-secure-password"
STATE_SIGNING_KEY: "your-random-signing-key"
```

## Usage

1. After starting the add-on, access it through:
   - Home Assistant sidebar (Ingress)

2. Log in with your configured superuser credentials

3. Configure your dashboard layout and entities

4. Connect your izBoard client to the configured URL

## Support

For issues, feature requests, or questions:
- [Report an issue](https://github.com/izdev-digital/hass-add-ons/issues)
- [View repository](https://github.com/izdev-digital/hass-add-ons)

## Architecture Support

- amd64 (x86-64)
- aarch64 (ARM 64-bit)
