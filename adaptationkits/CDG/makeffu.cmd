.\tools\img2ffu.%PROCESSOR_ARCHITECTURE%.exe ^
  --ffu-file "Image_210507-0415_Cityman\Flash.ffu" ^
  --block-size 131072 ^
  --sector-size 512 ^
  --plat-id "Microsoft.MSM8994.P6211" ^
  --os-version 10.0.20279.1002 ^
  --full-flash-update-version V1 ^
  --img-file "Image_210507-0415_Cityman\Flash.vhd" ^
  --device-path VenHw(B615F1F5-5088-43CD-809C-A16E52487D00) ^
  --is-fixed-disk-length false ^
  --blanksectorbuffer-size 100 ^
  --excluded-file .\tools\provisioning-partitions.txt

.\tools\img2ffu.%PROCESSOR_ARCHITECTURE%.exe ^
  --ffu-file "Image_210507-0415_Cityman\Flash_ATT.ffu" ^
  --block-size 131072 ^
  --sector-size 512 ^
  --plat-id "Microsoft.MSM8994.P6211_ATT" ^
  --os-version 10.0.20279.1002 ^
  --full-flash-update-version V1 ^
  --img-file "Image_210507-0415_Cityman\Flash.vhd" ^
  --device-path VenHw(B615F1F5-5088-43CD-809C-A16E52487D00) ^
  --is-fixed-disk-length false ^
  --blanksectorbuffer-size 100 ^
  --excluded-file .\tools\provisioning-partitions.txt

.\tools\img2ffu.%PROCESSOR_ARCHITECTURE%.exe ^
  --ffu-file "Image_210507-0453_Talkman\Flash.ffu" ^
  --block-size 131072 ^
  --sector-size 512 ^
  --plat-id "Microsoft.MSM8992.P6218" ^
  --os-version 10.0.20279.1002 ^
  --full-flash-update-version V1 ^
  --img-file "Image_210507-0453_Talkman\Flash.vhd" ^
  --device-path VenHw(B615F1F5-5088-43CD-809C-A16E52487D00) ^
  --is-fixed-disk-length false ^
  --blanksectorbuffer-size 100 ^
  --excluded-file .\tools\provisioning-partitions.txt

.\tools\img2ffu.%PROCESSOR_ARCHITECTURE%.exe ^
  --ffu-file "Image_210507-0453_Talkman\Flash_ATT.ffu" ^
  --block-size 131072 ^
  --sector-size 512 ^
  --plat-id "Microsoft.MSM8992.P6218_ATT" ^
  --os-version 10.0.20279.1002 ^
  --full-flash-update-version V1 ^
  --img-file "Image_210507-0453_Talkman\Flash.vhd" ^
  --device-path VenHw(B615F1F5-5088-43CD-809C-A16E52487D00) ^
  --is-fixed-disk-length false ^
  --blanksectorbuffer-size 100 ^
  --excluded-file .\tools\provisioning-partitions.txt