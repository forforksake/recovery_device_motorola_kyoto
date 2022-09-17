### Moto Edge 20 Lite 5G - Recovery Tree
![Moto](https://motorolauk.vtexassets.com/arquivos/motorola-edge-20-lite-lockup-ffffff.svg)

| **Prop** | **spec** |
| --- | --- |
| `Codename` | **Kyoto** |
| `Board` | **MediaTek MT6853** |
| `OS` | **Android 11** |
| `Chipset` | **Dimensity 720** |
| `CPU` | **Octa-core (2xCortex-A76 & 6xCortex-A55 @ 2Ghz)** |
| `GPU` | **Mali-G57 MC3** |
| `RAM` | **8GB** |

#### How to build
```sh
git clone https://github.com/forforksake/android_device_motorola_kyoto-pbrp device/motorola/kyoto
source build/envsetup.sh
make clobber
lunch omni_kyoto-eng && mka pbrp
```
#### not working
- [ ] flashlight
- [ ] Decryption with Passcode - without passcode now works

#### Unlocked bootloader Required
Assuming you've unlocked bootloader, backup anything on data and userdata
```sh
adb reboot bootloader
fastboot flash boot boot.img
fastboot reboot bootloader
```
select **recovery mode** from bootloader screen
**On first boot into recovery - take a full backup!** 

WIP, feel free to assist - ForForkSake - CFKod @ Xdadevelopers_
