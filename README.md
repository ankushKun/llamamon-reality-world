# Llamamon Reality World

Submission for [aoTheComputer](https:/x.com/aoTheComputer) Reality Protocol world quest

![map](./assets/full_map.png)

## Description

This is an attempt to recreate the p###mon style GBA games on the reality protocol, where every player, every entity, every interaction, every battle exists on the Arweave protocol and computation is done on aoTheComputer.

## Screenshots

<details>
<summary>Click to expand</summary>

![1](./screenshots/1.png)
![2](./screenshots/2.png)
![3](./screenshots/3.png)

</details>

## How to play

Visit https://reality-viewer.arweave.net/#/LyaolZK47aoDyQjuUM5DEhwpSJQLKYr7eOQYzgslwhI and login with an Arweave wallet

## Run your own world

> PRO TIP: Open the project with BetterIDEa IDE for quick and easy setup:

[![coded in betteridea](https://img.shields.io/badge/Coded_in-BetterIDEa-lightgreen?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAZCAYAAAABmx/yAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAf5JREFUOI2VkktrU1EURtc+9yZqG5UKJmlw2omlEymCf0AcOhERCtGKSS0UJVWCiIPitKlWpEkqFHwg4kD9A2IRdCQIVgvFUZWYlASh9qVN7t0OgjFX8+oHZ7bXOYt9Psl+u3zEUd24GLm9xA5iXOjHmPfpfCL7cOVqd8cggMAeMQxvqvM5kx+/0DEIgGIr9GJ0MlNIfMgWrhzuDPx7wT5gQHHmM4XEg7lScm9nYC1yEOFMuVJeaqTfAmytb7cE6/QVBsCdT+cTzwPGSrR+sV4cUOgR4eSaukeNYi0qfAV+tWGLIjwt+yt9o+HUK1FVZvPxLtd0Xwei6tIr4vmmLYScayQ6Gky9rRmoam3mbikZscvlGUSOgQaBosCchDduxMiWPer1IED6y7Ue8f18hpFBEXkhwfXhfyEPOMGEHcqvjoEmMBJC8YFsgeZ8Rs+eD9568x84U7x0wnKsaRUiKIEGiykJvN72V86NHbjzA8AKjaydslQeKUQAf5ONdoH0WY5E362/zA0Gjn+yRd3dKtKwj96oDRwS3PuZlfHNzpoDiLCqKssiOhQPTS20B4WKuFoQY92Mh1L3oLrNdpXLq8uT7V1Ofyw4OfsHgiYlr2qxbIShWHhqodGMF2yi1Sg1VYWiqj5upNXqxUUR5/RIaPpjq2FPst+T+1WrDdrJ+Q08kgLwyCsoJwAAAABJRU5ErkJggg==)](https://ide.betteridea.dev)
[![open with betteridea](https://img.shields.io/badge/Import_this_project-grey?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAZCAYAAAABmx/yAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAf5JREFUOI2VkktrU1EURtc+9yZqG5UKJmlw2omlEymCf0AcOhERCtGKSS0UJVWCiIPitKlWpEkqFHwg4kD9A2IRdCQIVgvFUZWYlASh9qVN7t0OgjFX8+oHZ7bXOYt9Psl+u3zEUd24GLm9xA5iXOjHmPfpfCL7cOVqd8cggMAeMQxvqvM5kx+/0DEIgGIr9GJ0MlNIfMgWrhzuDPx7wT5gQHHmM4XEg7lScm9nYC1yEOFMuVJeaqTfAmytb7cE6/QVBsCdT+cTzwPGSrR+sV4cUOgR4eSaukeNYi0qfAV+tWGLIjwt+yt9o+HUK1FVZvPxLtd0Xwei6tIr4vmmLYScayQ6Gky9rRmoam3mbikZscvlGUSOgQaBosCchDduxMiWPer1IED6y7Ue8f18hpFBEXkhwfXhfyEPOMGEHcqvjoEmMBJC8YFsgeZ8Rs+eD9568x84U7x0wnKsaRUiKIEGiykJvN72V86NHbjzA8AKjaydslQeKUQAf5ONdoH0WY5E362/zA0Gjn+yRd3dKtKwj96oDRwS3PuZlfHNzpoDiLCqKssiOhQPTS20B4WKuFoQY92Mh1L3oLrNdpXLq8uT7V1Ofyw4OfsHgiYlr2qxbIShWHhqodGMF2yi1Sg1VYWiqj5upNXqxUUR5/RIaPpjq2FPst+T+1WrDdrJ+Q08kgLwyCsoJwAAAABJRU5ErkJggg==)](https://ide.betteridea.dev/import?id=LyaolZK47aoDyQjuUM5DEhwpSJQLKYr7eOQYzgslwhI)


Just create a new project and upload the files in the `src` directory, then run the following lua files in order:
- dbadmin.lua
- llama-herder.lua
- main.lua
- world-template.lua
- chat.lua

> For aos cli users just clone the repo and run the files

---

- Positions for Llama NPCs are in `world-template.lua`
- Editable world map is in `assets/Primary.json`
- World Tileset is in `assets/Primary.png`

---

For every Llama NPC you need to spawn a different process and load a file from the `src/llamas` directory, then copy its process id and paste in the `world-template.lua` `RealityEntitiesStatic` variable

>The IDE makes it easier to use multiple processes for different files at the same time. Just checkout `File Processes` under settings

---

To edit the world, open it in Tiled and export it as a JSON file, then upload the JSON file to Arweave and replace the Tilemap TxId in `world-template.lua`s `RealityParameters` variable

## Tileset

[Deviant Art](https://www.deviantart.com/chaoticcherrycake/art/Pokemon-Tileset-From-Public-Tiles-358379026)

[Credits](https://www.deviantart.com/chaoticcherrycake/journal/Credits-for-Tiles-367931482)