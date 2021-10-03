rm -rf ./config_volume
mkdir config_volume

rm -rf ./modules_volume
mkdir modules_volume

rm -rf ./MagicMirror
git clone https://github.com/MichMich/MagicMirror

cp -R ./MagicMirror/modules/default ./modules_volume
cp -R ./config.js ./config_volume
