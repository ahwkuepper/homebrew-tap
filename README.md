# Homebrew tap for Vesta

[Vesta](https://github.com/ahwkuepper/Vesta) is a macOS menu-bar controller for Philips
Hue. This maintainer-operated tap installs the same signed, notarized universal
app distributed on the project's GitHub releases. Requires macOS 14 or later.

## Install

```bash
brew install --cask ahwkuepper/tap/vesta-hue
```

If you already installed the **identical release** from its DMG, Homebrew can adopt
that copy without installing a second app:

```bash
brew install --cask --adopt ahwkuepper/tap/vesta-hue
```

`--adopt` checks that the existing app matches. If an older or locally built copy
is present, quit Vesta and move that app to the Trash before installing.
Keep its settings and Keychain credentials so the new copy can reuse the pairing.

The token is `vesta-hue`, not `vesta`: Homebrew's `vesta` cask is an unrelated
scientific visualization app. Both use `Vesta.app`/`VESTA.app`, which conflict on
case-insensitive filesystems; this cask declares that conflict.

## Update

```bash
brew update
brew upgrade --cask ahwkuepper/tap/vesta-hue
```

Homebrew checks for updates when you run it. Vesta itself makes no update checks.
The current release is 0.2.0, published upstream as a prerelease. This tap tracks
releases explicitly promoted by the maintainer, not every newly created tag.

## Uninstall

```bash
brew uninstall --cask vesta-hue
```

Uninstall quits and removes the app. Settings and Keychain pairing credentials
are retained. This tap does not provide a `zap` operation.

## Maintaining the cask

After publishing each signed, notarized Vesta release:

1. Download the published DMG and release manifest from
   [GitHub releases](https://github.com/ahwkuepper/Vesta/releases).
2. Confirm the DMG's SHA-256 matches `dmg-sha256` in the manifest.
3. Update `version` and `sha256` in `Casks/vesta-hue.rb`, and this README's current
   version. If the release is a prerelease, update the version-specific entry in
   `audit_exceptions/github_prerelease_allowlist.json`; remove that entry for a
   stable release. Keep the versioned URL and real checksum; never use `latest` or
   `:no_check`.
4. Run `brew style ahwkuepper/tap/vesta-hue` and
   `brew audit --cask --strict --online ahwkuepper/tap/vesta-hue` against the updated
   checkout. Verify installation on a clean Mac or test runner.
5. Merge after the tap's CI passes. Existing users receive the new definition on
   `brew update`, then install it with `brew upgrade --cask ahwkuepper/tap/vesta-hue`.

CI checks style, audits the cask, downloads and installs the published app, and
verifies its code signature and Gatekeeper acceptance. Signing keys and Apple
notarization credentials are never needed by this repository.

Licensed under Apache-2.0; see [LICENSE](LICENSE).
