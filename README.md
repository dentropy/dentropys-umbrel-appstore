## Dentropy's Umbrel Appstore

The umbrel app store, located at [getumbrel/umbrel-apps](https://github.com/getumbrel/umbrel-apps), did not have the apps I wanted so I made my own app store.

Apps I included are,

* [TiddlyWiki  -- A non-linear personal web notebook](http://tiddlywiki.com/)
* [wallabag    -- Read your articles later](https://www.wallabag.it/en)
* [Monica CRM  -- Personal CRM done right](https://www.monicahq.com/)
* [MediaGoblin -- Media publishing platform that anyone can run](https://mediagoblin.org/)
* [MinIO       -- High Performance Object Storage](https://min.io/)
* Wireguard Server

### Testing

**PLEASE NOTE INSTALLATION OF APP STORE FROM GUI DOES NOT WORK AT THIS TIME**

<!-- To test `Dentropy's Umbrel Appstore`, you can add this repository through the Umbrel user interface as shown in the following demo:

https://user-images.githubusercontent.com/10330103/197889452-e5cd7e96-3233-4a09-b475-94b754adc7a3.mp4

Alternatively, you can use the Umbrel CLI as described below. -->

To test `Dentropy's Umbrel Appstore`, you can add this repository through the Umbrel CLI interface as shown in the following demo:

To add an app store:

``` bash

# Install
sudo ~/umbrel/scripts/repo add https://github.com/dentropy/dentropys-umbrel-appstore

# Update
sudo ~/umbrel/scripts/repo update

```

To install an app from the app store

``` bash

sudo ~/umbrel/scripts/app install tiddlywiki
sudo ~/umbrel/scripts/app install wallabag
sudo ~/umbrel/scripts/app install monica
sudo ~/umbrel/scripts/app install snipe-it
sudo ~/umbrel/scripts/app install wireguard_server

# Since Appstore GUI does not work you need to fetch the mediagoblin password manually
# You can recover password using script at end of README
sudo ~/umbrel/scripts/app install mediagoblin
sudo ~/umbrel/scripts/app install minio

```

To uninstall an app from the app store

``` bash

sudo ~/umbrel/scripts/app uninstall tiddlywiki
sudo ~/umbrel/scripts/app uninstall wallabag
sudo ~/umbrel/scripts/app uninstall monica
sudo ~/umbrel/scripts/app uninstall mediagoblin
sudo ~/umbrel/scripts/app uninstall minio
sudo ~/umbrel/scripts/app uninstall snipe-it
sudo ~/umbrel/scripts/app uninstall wireguard_server

```

To remove an app store:

```
sudo ~/umbrel/scripts/repo remove https://github.com/getumbrel/umbrel-community-app-store.git
```


## Recover Password Script

Run the script below to generate passwords for minio and mediagoblin, generalized script available at [recover\_umbrel\_password.sh](https://gist.github.com/dentropy/13078048ff835a7dae05766da82624aa)

``` bash

# REMEMBER TO CHANGE THIS TO APP YOU WANT PASSWORD FOR
# App name can be found in umbrel-app.yml for example ./mediagoblin/umbrel-app.yml

UMBREL_ROOT="$(readlink -f $(dirname "${BASH_SOURCE[0]}")/..)"
# UMBREL_ROOT when umbrel installed on user dentropy is /home/dentropy/umbrel/app-data
app_entropy_identifier="app-${app}-seed"
derive_entropy () {
  # Make sure we use the seed from the real Umbrel installation if this is
  # an OTA update.
  SEED_FILE="${UMBREL_ROOT}/db/umbrel-seed/seed"
  if [[ ! -f "${SEED_FILE}" ]] && [[ -f "${UMBREL_ROOT}/../.umbrel" ]]; then
    SEED_FILE="${UMBREL_ROOT}/../db/umbrel-seed/seed"
  fi

  identifier="${1}"
  umbrel_seed=$(cat "${SEED_FILE}") || true

  if [[ -z "$umbrel_seed" ]] || [[ -z "$identifier" ]]; then
    >&2 echo "Missing derivation parameter, this is unsafe, exiting."
    exit 1
  fi

  # We need `sed 's/^.* //'` to trim the "(stdin)= " prefix from some versions of openssl
  printf "%s" "${identifier}" | openssl dgst -sha256 -hmac "${umbrel_seed}" | sed 's/^.* //'
}

export mediagoblin_APP_PASSWORD=$(derive_entropy "app-mediagoblin-seed-APP_PASSWORD")
export minio_APP_PASSWORD=$(derive_entropy "app-minio-seed-APP_PASSWORD")
echo "mediagoblin user    : umbrel"
echo "mediagoblin password: $mediagoblin_APP_PASSWORD"
echo "mediagoblin user    : umbrel"
echo "minio       password: $minio_APP_PASSWORD"

```