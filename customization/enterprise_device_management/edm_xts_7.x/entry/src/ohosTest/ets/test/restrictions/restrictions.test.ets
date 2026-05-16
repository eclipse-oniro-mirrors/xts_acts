/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, DEFAULT_USER_ID, APP_IDS_1 } from '../commom.test.ets';

import { usbManager } from '@kit.MDMKit';
import adminManager from '@ohos.enterprise.adminManager';
import restrictions from '@ohos.enterprise.restrictions';
import sysDeviceInfo from '@ohos.deviceInfo';

const LABEL_BLUETOOTH = "bluetooth";
const LABEL_MODIFY_DATETIME = "modifyDateTime";
const LABEL_PRINTER = "printer";
const LABEL_HDC = "hdc";
const LABEL_MIC = "microphone";
const LABEL_FINGER_PRINT = "fingerprint";
const LABEL_USB = "usb";
const LABEL_WIFI = "wifi";
const LABEL_CAMERA = "camera";
const LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT = "snapshotSkip";
const LABEL_RESET_FACTORY = "resetFactory";
const LABEL_TETHERING = "tethering";
const LABEL_NEAR_LINK = "nearLink";
const LABEL_DISTRIBUTED_TRANSMISSION = "distributedTransmissionOutgoing";
const LABEL_PRINT = "print";
const LABEL_MTP_CLIENT = "mtpClient";
const LABEL_MTP_SERVER = "mtpServer";
const LABEL_RECOVERY_KEY = "diskRecoveryKey";
const LABEL_OPEN_FILE_BOOST = "openFileBoost";
const LABEL_SAMBA_CLIENT = "sambaClient";
const LABEL_SAMBA_SERVER = "sambaServer";
const LABEL_REMOTE_DESK = "remoteDesk";
const LABEL_REMOTE_DIAGNOSIS = "remoteDiagnosis";
const LABEL_SET_APN = "setApn";
const LABEL_SET_ETHERNET_IP = "setEthernetIp";
const LABEL_USB_STORAGE_DEVICE_WRITE = "usbStorageDeviceWrite";
const LABEL_POWER_LONG_PRESS = "powerLongPress";
const LABEL_VPN = "vpn";
const LABEL_MOBILE_DATA = "mobileData";
const LABEL_SMS = "sms";
const LABEL_MMS = "mms";
const LABEL_AIRPLANE_MODE = "airplaneMode";
const LABEL_NOTIFICATION = "notification";
const LABEL_NFC = "nfc";
const LABEL_SET_BIOMETRICS_AND_SCREENLOCK = "setBiometricsAndScreenLock";
const LABEL_SET_DEVICE_NAME = "setDeviceName";
const LABEL_SUDO = "sudo";
const LABEL_TELEPHONY_CALL = "telephoneCall";
const LABEL_BACKUP_AND_RESTORE = "backupAndRestore";
const LABEL_PRIVATE_SPACE = "privateSpace";
const LABLE_EXTERNAL_STORAGE_CARD = "externalStorageCard";
const LABLE_RANDOM_MAC = "randomMac";
const LABEL_APP_CLONE = "appClone";
const LABEL_UNMUTE_DEVICE = "unmuteDevice";
const LABEL_HDC_REMOTE = "hdcRemote";
const LABEL_VIRTUAL_SERVICE = "virtualService";
const LABEL_MODIFY_WALLPAPER = "modifyWallpaper";
const LABEL_USB_SERIAL = "usbSerial";

export default function restrictionsTest() {
  describe('restrictions_test', () => {

  })
}