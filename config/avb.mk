# A/B
AB_OTA_PARTITIONS += avb_custom_key

# AVB
BOARD_AVB_ALGORITHM := SHA256_RSA2048
BOARD_AVB_KEY_PATH := external/avb.pem
ifneq ($(BOARD_AVB_VBMETA_SYSTEM_KEY_PATH), )
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb.pem
endif
