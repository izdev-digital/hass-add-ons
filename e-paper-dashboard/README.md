# izBoard Add-on

**izBoard** displays your Home Assistant dashboards on battery-powered E-Paper devices. Your device automatically fetches updated dashboard images from this add-on on a schedule you control. The add-on converts your Home Assistant dashboards into the right format for E-Paper displays. Because the device only uses power during updates, a single battery charge can last weeks or even months.

**Project Repository**: [izBoard](https://github.com/izdev-digital/e-paper-dashboard)

## Configuration

Set `CLIENT_URL` to the LAN URL that your E-Paper displays can reach. The default is
`http://homeassistant.local:8129`. Change the host or port if your network does not resolve
`homeassistant.local`, the add-on port is remapped, or the displays use a separate VLAN.

Do not use the Home Assistant ingress or cloud URL: those routes require a browser session and
are not reachable by the displays. Allow the display network to reach this URL through your
firewall.

## Support

For issues, feature requests, or questions:
- [Report an issue](https://github.com/izdev-digital/hass-add-ons/issues)
- [View add-on repository](https://github.com/izdev-digital/hass-add-ons)
- [View izBoard project](https://github.com/izdev-digital/e-paper-dashboard)

## Supported Architectures

Currently supported architectures:
- `amd64`
- `arm64`

**Note**: This add-on uses Playwright and Chromium to render dashboards, which requires sufficient RAM and CPU resources. It may not run reliably on low-powered devices with limited resources.
