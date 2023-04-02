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

```

sudo ~/umbrel/scripts/app install tiddlywiki
sudo ~/umbrel/scripts/app install wallabag
sudo ~/umbrel/scripts/app install monica
sudo ~/umbrel/scripts/app install mediagoblin
sudo ~/umbrel/scripts/app install minio
sudo ~/umbrel/scripts/app install wireguard_server

```

To uninstall an app from the app store

``` bash

sudo ~/umbrel/scripts/app uninstall tiddlywiki
sudo ~/umbrel/scripts/app uninstall wallabag
sudo ~/umbrel/scripts/app uninstall monica
sudo ~/umbrel/scripts/app uninstall mediagoblin
sudo ~/umbrel/scripts/app uninstall minio
sudo ~/umbrel/scripts/app uninstall wireguard_server

```

To remove an app store:

```
sudo ~/umbrel/scripts/repo remove https://github.com/getumbrel/umbrel-community-app-store.git
```
