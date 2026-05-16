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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT, DEFAULT_USER_ID, APP_IDS_1 } from '../commom';

import { applicationManager, deviceSettings, usbManager } from '@kit.MDMKit';
import adminManager from '@ohos.enterprise.adminManager';
import common from '@ohos.enterprise.common';
import restrictions from '@ohos.enterprise.restrictions';
import sysDeviceInfo from '@ohos.deviceInfo';
import { osAccount } from '@kit.BasicServicesKit';

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
    testSetDisallowedPolicy();
    testGetDisallowedPolicy();
    testSetDisallowedForAccountPolicy();
    testGetDisallowedForAccountPolicy();
    testAddDisallowedListForAccountPolicy();
    testRemoveDisallowedListForAccountPolicy();
    testGetDisallowedListForAccountPolicy();
    testSetUserRestrictionPolicy();
    testGetUserRestrictedPolicy();
    testSetUserRestrictionForAccountPolicy();
    testGetUserRestrictedForAccountPolicy();
    testSetDisallowedForAccountPolicy26();
    testGetDisallowedForAccountPolicy26();
  })
}

function testSetDisallowedPolicy() {

  let sleep = (timeout: number): Promise<ESObject> => {
    return new Promise(resolve => {
      const st =setTimeout(() => {
        resolve(null);
        clearTimeout(st);
      }, timeout);
    });
  };

  /**
   * @tc.name   test_set_disallowed_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0100
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0101
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      if (sysDeviceInfo.deviceType === '2in1') {
        expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH)).assertFalse();
      } else {
        expect(false).assertTrue();
      }
    } catch (error) {
      if (sysDeviceInfo.deviceType === '2in1') {
        expect(false).assertTrue();
      } else {
        expect(error.code == 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0102
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_BLUETOOTH, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.name   test_set_disallowed_policy_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0103
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0104
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MODIFY_DATETIME, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MODIFY_DATETIME)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0105
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0105", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_PRINTER, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_PRINTER)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0106
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0107
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MIC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MIC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0108
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0108", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });  

  /**
   * @tc.name   test_set_disallowed_policy_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0109
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0109", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  }); 

  /**
   * @tc.name   test_set_disallowed_policy_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0110
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0110", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_WIFI)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0111
   * @tc.desc   test restrictions setDisallowedPolicy with unsupported label
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0111", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, '123', false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

   /**
    * @tc.name   test_set_disallowed_policy_0112
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0112
    * @tc.desc   test restrictions setDisallowedPolicy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_set_disallowed_policy_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_CAMERA, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_CAMERA)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0113
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

   /**
    * @tc.name   test_set_disallowed_policy_0114
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0114
    * @tc.desc   test restrictions setDisallowedPolicy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_set_disallowed_policy_0114", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MIC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MIC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0115
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0115
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0115", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_RESET_FACTORY)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0116
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0116
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0116", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_WIFI)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0117
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0117
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0117", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0118
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0118
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0118", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_TETHERING, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_TETHERING)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0119
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0119
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0119", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0120
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0120
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0120", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_NEAR_LINK, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_NEAR_LINK)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0121
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0121
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0121", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_CAMERA, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_CAMERA)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0122
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0122
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0122", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0123
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0123
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0123", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0124
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0124
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0124", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MTP_SERVER, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MTP_SERVER)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0125
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0125
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0125", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_SAMBA_CLIENT, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_SAMBA_CLIENT)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0126
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0126
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0126", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_SAMBA_CLIENT, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_SAMBA_CLIENT)).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0127
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0127
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0127", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_SAMBA_SERVER, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_SAMBA_SERVER)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0128
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0128
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0128", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_SAMBA_SERVER, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_SAMBA_SERVER)).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0129
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0129
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0129", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_REMOTE_DESK, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_REMOTE_DESK)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0130
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0130
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0130", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_REMOTE_DESK, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_REMOTE_DESK)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_REMOTE_DESK, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0131
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0131
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0131", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_REMOTE_DIAGNOSIS, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_REMOTE_DIAGNOSIS)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0132
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0132
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0132", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_REMOTE_DIAGNOSIS, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_REMOTE_DIAGNOSIS)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_REMOTE_DIAGNOSIS, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0133
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0133
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0133", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_VPN, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0134
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0134
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0134", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_VPN, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0135
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0135
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0135", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_VPN, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0136
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0136
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0136", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_VPN, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_VPN)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0137
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0137
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0137", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MOBILE_DATA, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0138
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0138
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0138", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MOBILE_DATA, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0139
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0139
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0139", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_MOBILE_DATA, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0140
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0140
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0140", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MOBILE_DATA, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MOBILE_DATA)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0141
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0141
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0141", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_SMS, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0142
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0142
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0142", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_SMS, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0143
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0143
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0143", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_SMS, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0144
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0144
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0144", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_SMS, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_SMS)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0145
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0145
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0145", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MMS, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0146
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0146
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0146", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MMS, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0147
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0147
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0147", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_MMS, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0148
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0148
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0148", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MMS, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_MMS)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0149
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0149
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0149", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_AIRPLANE_MODE, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0150
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0150
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0150", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_AIRPLANE_MODE, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0151
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0151
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0151", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_AIRPLANE_MODE, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0152
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0152
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0152", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_AIRPLANE_MODE, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_AIRPLANE_MODE)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0153
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0153
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0153", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_NOTIFICATION, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0154
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0154
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0154", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_NOTIFICATION, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0155
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0155
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0155", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_NOTIFICATION, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0156
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0156
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0156", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_NOTIFICATION, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_NOTIFICATION)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0157
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0157
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0157", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_NFC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_NFC)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0158
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0158
   * @tc.desc   test restrictions setDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0158", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_TELEPHONY_CALL, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0159
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0159
   * @tc.desc   test restrictions setDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0159", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_TELEPHONY_CALL, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0160
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0160
   * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0160", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_TELEPHONY_CALL, false);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0161
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0161
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0161", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_TELEPHONY_CALL, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_TELEPHONY_CALL)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0162
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0162
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0162", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_BACKUP_AND_RESTORE, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_BACKUP_AND_RESTORE)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0163
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0163
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0163", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_PRIVATE_SPACE, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_PRIVATE_SPACE)).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0164
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0164
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0164", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_APP_CLONE, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_APP_CLONE)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0165
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0165
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0165", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_APP_CLONE, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_APP_CLONE)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_APP_CLONE, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0166
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0166
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0166", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABLE_EXTERNAL_STORAGE_CARD, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABLE_EXTERNAL_STORAGE_CARD)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0167
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0167
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0167", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABLE_EXTERNAL_STORAGE_CARD, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABLE_EXTERNAL_STORAGE_CARD)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABLE_EXTERNAL_STORAGE_CARD, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0168
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0168
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0168", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABLE_RANDOM_MAC, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABLE_RANDOM_MAC)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0169
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0169
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0169", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABLE_RANDOM_MAC, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABLE_RANDOM_MAC)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABLE_RANDOM_MAC, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0170
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0170
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0170", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_UNMUTE_DEVICE, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_UNMUTE_DEVICE)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0171
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0171
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0171", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_UNMUTE_DEVICE, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_UNMUTE_DEVICE)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_UNMUTE_DEVICE, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0172
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0172
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0172", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE, false);
      let res = restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE);
      expect(res).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0173
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0173
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0173", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE, true);
      let res = restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE);
      expect(res).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE, false);
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

    /**
     * @tc.name   test_set_disallowed_policy_0174
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0174
     * @tc.desc   test restrictions setDisallowedPolicy without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_set_disallowed_policy_0174", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    });
  
    /**
     * @tc.name   test_set_disallowed_policy_0175
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0175
     * @tc.desc   test restrictions setDisallowedPolicy with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_set_disallowed_policy_0175", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });
  
    /**
     * @tc.name   test_set_disallowed_policy_0176
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0176
     * @tc.desc   test restrictions setDisallowedPolicy with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_set_disallowed_policy_0176", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(INVALID_WANT, LABEL_HDC_REMOTE, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    })

    /**
     * @tc.name   setDisallowedPolicy_test_001
     * @tc.number setDisallowedPolicy_test_001
     * @tc.desc   setDisallowedPolicy with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicy_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicy_test_001  -------- START --------');
      try {
        restrictions.setDisallowedPolicy(null, LABEL_VIRTUAL_SERVICE, true);
        console.info(' --- setDisallowedPolicy_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicy_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicy_test_001  -------- END --------');
    })


    /**
     * @tc.name   setDisallowedPolicy_test_002
     * @tc.number setDisallowedPolicy_test_002
     * @tc.desc   setDisallowedPolicy with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicy_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicy_test_002  -------- START --------');
      try {
        restrictions.setDisallowedPolicy(undefined, LABEL_VIRTUAL_SERVICE, true);
        console.info(' --- setDisallowedPolicy_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicy_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicy_test_002  -------- END --------');
    })

    /**
     * @tc.name   setDisallowedPolicy_test_003
     * @tc.number setDisallowedPolicy_test_003
     * @tc.desc   setDisallowedPolicy with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicy_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicy_test_003  -------- START --------');
      try {
        restrictions.setDisallowedPolicy(SELFWANT, null, true);
        console.info(' --- setDisallowedPolicy_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicy_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicy_test_003  -------- END --------');
    })

    /**
     * @tc.name   setDisallowedPolicy_test_004
     * @tc.number setDisallowedPolicy_test_004
     * @tc.desc   setDisallowedPolicy with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicy_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicy_test_004  -------- START --------');
      try {
        restrictions.setDisallowedPolicy(SELFWANT, undefined, true);
        console.info(' --- setDisallowedPolicy_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicy_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicy_test_004  -------- END --------');
     })

   /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0100
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0100
    * @tc.desc   test restrictions setDisallowedPolicy with wifiP2p feature using byod admin (disallow true)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P);
        expect(ret).assertTrue();
        await sleep(3000);
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, false);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0200
    * @tc.desc   test restrictions setDisallowedPolicy with undefined feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0300
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0300
    * @tc.desc   test restrictions setDisallowedPolicy with wifiP2p feature using normal admin (should fail with 9200002)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, false);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P);
        expect(ret).assertFalse();
      } catch (error) {
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0400
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0400
    * @tc.desc   test restrictions setDisallowedPolicy with wifiP2p feature using super admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P);
        expect(ret).assertTrue();
        await sleep(3000);
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, false);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0500
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0500
    * @tc.desc   test restrictions setDisallowedPolicy with wifiP2p feature without admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0500", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0600
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0600
    * @tc.desc   test restrictions setDisallowedPolicy with null admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0600", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(null, restrictions.FeatureForDevice.WIFI_P2P, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0700
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0700
    * @tc.desc   test restrictions setDisallowedPolicy with undefined admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0700", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.WIFI_P2P, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0800
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0800
    * @tc.desc   test restrictions setDisallowedPolicy with null feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, null, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_0900
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_0900
    * @tc.desc   test restrictions setDisallowedPolicy with undefined feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, undefined, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_wifi_p2p_1000
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYWIFIP2P_1000
    * @tc.desc   test restrictions setDisallowedPolicy with undefined feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_wifi_p2p_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_uinput_0100
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0100
    * @tc.desc   test restrictions setDisallowedPolicy with uinput feature using byod admin (should fail with 9200002)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, true);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_uinput_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0200
    * @tc.desc   test restrictions setDisallowedPolicy with undefined feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_0300
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0300
    * @tc.desc   test restrictions setDisallowedPolicy with uinput feature using normal admin (should fail with 9200002)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT);
        expect(ret).assertTrue();
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, false);
      } catch (error) {
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_0400
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0400
    * @tc.desc   test restrictions setDisallowedPolicy with uinput feature using super admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT);
        expect(ret).assertTrue();
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, false);
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_0500
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0500
    * @tc.desc   test restrictions setDisallowedPolicy with uinput feature without admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0500", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_0600
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0600
    * @tc.desc   test restrictions setDisallowedPolicy with null admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0600", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(null, restrictions.FeatureForDevice.LOCAL_INPUT, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_0700
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0700
    * @tc.desc   test restrictions setDisallowedPolicy with undefined admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0700", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.LOCAL_INPUT, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_0800
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0800
    * @tc.desc   test restrictions setDisallowedPolicy with null feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, null, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_0900
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_0900
    * @tc.desc   test restrictions setDisallowedPolicy with undefined feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, undefined, false);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
    * @tc.name   test_set_disallowed_policy_uinput_1000
    * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_UINPUT_1000
    * @tc.desc   test restrictions setDisallowedPolicy with null disable
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_uinput_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0100
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0100
    * @tc.desc   test restrictions setDisallowedPolicy with coredump feature using byod admin (disallow true)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP, true);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0200
    * @tc.desc   test restrictions setDisallowedPolicy with coredump undefined disallow
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0300
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0300
    * @tc.desc   test restrictions setDisallowedPolicy with coredump feature normal admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP, false);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP);
        expect(ret).assertFalse();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0400
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0400
    * @tc.desc   test restrictions setDisallowedPolicy with coredump feature super admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP);
        expect(ret).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0500
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0500
    * @tc.desc   test restrictions setDisallowedPolicy with coredump without admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0500", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0600
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0600
    * @tc.desc   test restrictions setDisallowedPolicy with coredump with null admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0600", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(null, restrictions.FeatureForDevice.CORE_DUMP, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0700
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0700
    * @tc.desc   test restrictions setDisallowedPolicy with coredump with undefined admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0700", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.CORE_DUMP, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
    });

   /**
    * @tc.name   test_set_disallowed_policy_core_dump_0800
    * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYCORE_DUMP_0800
    * @tc.desc   test restrictions setDisallowedPolicy with coredump with null disallow
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_set_disallowed_policy_core_dump_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.CORE_DUMP, null);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0100
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0100", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE, true);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0200
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature using byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE, true);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200002).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0300
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0300", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(null, restrictions.FeatureForDevice.DISK_ERASURE, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0400
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0400", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.DISK_ERASURE, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0500
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature null feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, null, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0600
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature undefined feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, undefined, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0700
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature null disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE, null);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0800
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature undefined disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_disk_erasure_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_0900
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature super admin set disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it("test_set_disallowed_policy_disk_erasure_0900", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE);
        expect(ret).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_disk_erasure_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYDISK_ERASURE_1000
     * @tc.desc   test restrictions setDisallowedPolicy with disk erasure feature super admin cancel disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it("test_set_disallowed_policy_disk_erasure_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE, false);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE);
        expect(ret).assertFalse();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0100
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_sudo_0100", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO, true);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0300
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_sudo_0300", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(null, restrictions.FeatureForDevice.SUDO, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0400
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_sudo_0400", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.setDisallowedPolicy(undefined, restrictions.FeatureForDevice.SUDO, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0500
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature null feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_sudo_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, null, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0600
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature undefined feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_sudo_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, undefined, false);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0700
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature null disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_sudo_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO, null);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0800
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature undefined disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_set_disallowed_policy_sudo_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_0900
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature super admin set disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it("test_set_disallowed_policy_sudo_0900", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO, true);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO);
        expect(ret).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_set_disallowed_policy_sudo_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_SETDISALLOWEDPOLICYSUDO_1000
     * @tc.desc   test restrictions setDisallowedPolicy with sudo feature super admin cancel disallow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
     it("test_set_disallowed_policy_sudo_1000", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO, false);
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO);
        expect(ret).assertFalse();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
    * @tc.name   getDisallowedPolicy_test_001
    * @tc.number getDisallowedPolicy_test_001
    * @tc.desc   getDisallowedPolicy with undefined parameter admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("getDisallowedPolicy_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedPolicy_test_001  -------- START --------');
      try {
        restrictions.getDisallowedPolicy(null, LABEL_PRINTER);
        console.info(' --- getDisallowedPolicy_test_001 error is expected, but it done.');
      } catch (error) {
        console.info(' --- getDisallowedPolicy_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(error === null).assertTrue();
      }
      done();
      console.info(' --- getDisallowedPolicy_test_001  -------- END --------');
    })

    /**
     * @tc.name   getDisallowedPolicy_test_002
     * @tc.number getDisallowedPolicy_test_002
     * @tc.desc   getDisallowedPolicy with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedPolicy_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedPolicy_test_002  -------- START --------');
      try {
        restrictions.getDisallowedPolicy(undefined, LABEL_VIRTUAL_SERVICE);
        console.info(' --- getDisallowedPolicy_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedPolicy_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedPolicy_test_002  -------- END --------');
    })


    /**
     * @tc.name   setDisallowedPolicyForAccount_test_001
     * @tc.number setDisallowedPolicyForAccount_test_001
     * @tc.desc   setDisallowedPolicyForAccount with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicyForAccount_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicyForAccount_test_001  -------- START --------');
      try {
        restrictions.setDisallowedPolicyForAccount(null, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
        console.info(' --- setDisallowedPolicyForAccount_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicyForAccount_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicyForAccount_test_001  -------- END --------');
    })


    /**
     * @tc.name   setDisallowedPolicyForAccount_test_002
     * @tc.number setDisallowedPolicyForAccount_test_002
     * @tc.desc   setDisallowedPolicyForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicyForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicyForAccount_test_002  -------- START --------');
      try {
        restrictions.setDisallowedPolicyForAccount(undefined, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
        console.info(' --- setDisallowedPolicyForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicyForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicyForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   setDisallowedPolicyForAccount_test_003
     * @tc.number setDisallowedPolicyForAccount_test_003
     * @tc.desc   setDisallowedPolicyForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicyForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicyForAccount_test_003  -------- START --------');
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, null);
        console.info(' --- setDisallowedPolicyForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicyForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicyForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   setDisallowedPolicyForAccount_test_004
     * @tc.number setDisallowedPolicyForAccount_test_004
     * @tc.desc   setDisallowedPolicyForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicyForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicyForAccount_test_004  -------- START --------');
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, undefined);
        console.info(' --- setDisallowedPolicyForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicyForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicyForAccount_test_004  -------- END --------');
    })

    /**
     * @tc.name   setDisallowedPolicyForAccount_test_005
     * @tc.number setDisallowedPolicyForAccount_test_005
     * @tc.desc   setDisallowedPolicyForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicyForAccount_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicyForAccount_test_005  -------- START --------');
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, null, true, DEFAULT_USER_ID);
        console.info(' --- setDisallowedPolicyForAccount_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicyForAccount_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicyForAccount_test_005  -------- END --------');
    })

    /**
     * @tc.name   setDisallowedPolicyForAccount_test_006
     * @tc.number setDisallowedPolicyForAccount_test_006
     * @tc.desc   setDisallowedPolicyForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setDisallowedPolicyForAccount_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setDisallowedPolicyForAccount_test_006  -------- START --------');
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, undefined, true, DEFAULT_USER_ID);
        console.info(' --- setDisallowedPolicyForAccount_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setDisallowedPolicyForAccount_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setDisallowedPolicyForAccount_test_006  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedPolicyForAccount_test_002
     * @tc.number getDisallowedPolicyForAccount_test_002
     * @tc.desc   getDisallowedPolicyForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedPolicyForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedPolicyForAccount_test_002  -------- START --------');
      try {
        restrictions.getDisallowedPolicyForAccount(undefined, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
        console.info(' --- getDisallowedPolicyForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedPolicyForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedPolicyForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedPolicyForAccount_test_003
     * @tc.number getDisallowedPolicyForAccount_test_003
     * @tc.desc   getDisallowedPolicyForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedPolicyForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedPolicyForAccount_test_003  -------- START --------');
      try {
        restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, null);
        console.info(' --- getDisallowedPolicyForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedPolicyForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedPolicyForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedPolicyForAccount_test_004
     * @tc.number getDisallowedPolicyForAccount_test_004
     * @tc.desc   getDisallowedPolicyForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedPolicyForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedPolicyForAccount_test_004  -------- START --------');
      try {
        restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, undefined);
        console.info(' --- getDisallowedPolicyForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedPolicyForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedPolicyForAccount_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedListForAccount_test_001
     * @tc.number addDisallowedListForAccount_test_001
     * @tc.desc   addDisallowedListForAccount with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedListForAccount_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedListForAccount_test_001  -------- START --------');
      try {
        restrictions.addDisallowedListForAccount(null, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- addDisallowedListForAccount_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedListForAccount_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedListForAccount_test_001  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedListForAccount_test_002
     * @tc.number addDisallowedListForAccount_test_002
     * @tc.desc   addDisallowedListForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedListForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedListForAccount_test_002  -------- START --------');
      try {
        restrictions.addDisallowedListForAccount(undefined, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- addDisallowedListForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedListForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedListForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedListForAccount_test_003
     * @tc.number addDisallowedListForAccount_test_003
     * @tc.desc   addDisallowedListForAccount with null parameter list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedListForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedListForAccount_test_003  -------- START --------');
      try {
        restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null, DEFAULT_USER_ID);
        console.info(' --- addDisallowedListForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedListForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedListForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedListForAccount_test_004
     * @tc.number addDisallowedListForAccount_test_004
     * @tc.desc   addDisallowedListForAccount with undefined parameter list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedListForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedListForAccount_test_004  -------- START --------');
      try {
        restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, undefined, DEFAULT_USER_ID);
        console.info(' --- addDisallowedListForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedListForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedListForAccount_test_004  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedListForAccount_test_005
     * @tc.number addDisallowedListForAccount_test_005
     * @tc.desc   addDisallowedListForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedListForAccount_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedListForAccount_test_005  -------- START --------');
      try {
        restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, null);
        console.info(' --- addDisallowedListForAccount_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedListForAccount_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedListForAccount_test_005  -------- END --------');
    })


    /**
     * @tc.name   addDisallowedListForAccount_test_006
     * @tc.number addDisallowedListForAccount_test_006
     * @tc.desc   addDisallowedListForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("addDisallowedListForAccount_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- addDisallowedListForAccount_test_006  -------- START --------');
      try {
        restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, undefined);
        console.info(' --- addDisallowedListForAccount_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- addDisallowedListForAccount_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- addDisallowedListForAccount_test_006  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedListForAccount_test_001
     * @tc.number removeDisallowedListForAccount_test_001
     * @tc.desc   removeDisallowedListForAccount with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedListForAccount_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedListForAccount_test_001  -------- START --------');
      try {
        restrictions.removeDisallowedListForAccount(null, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- removeDisallowedListForAccount_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedListForAccount_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedListForAccount_test_001  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedListForAccount_test_002
     * @tc.number removeDisallowedListForAccount_test_002
     * @tc.desc   removeDisallowedListForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedListForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedListForAccount_test_002  -------- START --------');
      try {
        restrictions.removeDisallowedListForAccount(undefined, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
        console.info(' --- removeDisallowedListForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedListForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedListForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedListForAccount_test_003
     * @tc.number removeDisallowedListForAccount_test_003
     * @tc.desc   removeDisallowedListForAccount with null parameter list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedListForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedListForAccount_test_003  -------- START --------');
      try {
        restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null, DEFAULT_USER_ID);
        console.info(' --- removeDisallowedListForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedListForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedListForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedListForAccount_test_004
     * @tc.number removeDisallowedListForAccount_test_004
     * @tc.desc   removeDisallowedListForAccount with undefined parameter list
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedListForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedListForAccount_test_004  -------- START --------');
      try {
        restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, undefined, DEFAULT_USER_ID);
        console.info(' --- removeDisallowedListForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedListForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedListForAccount_test_004  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedListForAccount_test_005
     * @tc.number removeDisallowedListForAccount_test_005
     * @tc.desc   removeDisallowedListForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedListForAccount_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedListForAccount_test_005  -------- START --------');
      try {
        restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, null);
        console.info(' --- removeDisallowedListForAccount_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedListForAccount_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedListForAccount_test_005  -------- END --------');
    })


    /**
     * @tc.name   removeDisallowedListForAccount_test_006
     * @tc.number removeDisallowedListForAccount_test_006
     * @tc.desc   removeDisallowedListForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("removeDisallowedListForAccount_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- removeDisallowedListForAccount_test_006  -------- START --------');
      try {
        restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, undefined);
        console.info(' --- removeDisallowedListForAccount_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- removeDisallowedListForAccount_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- removeDisallowedListForAccount_test_006  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedListForAccount_test_001
     * @tc.number getDisallowedListForAccount_test_001
     * @tc.desc   getDisallowedListForAccount with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedListForAccount_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedListForAccount_test_001  -------- START --------');
      try {
        restrictions.getDisallowedListForAccount(null, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
        console.info(' --- getDisallowedListForAccount_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedListForAccount_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedListForAccount_test_001  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedListForAccount_test_002
     * @tc.number getDisallowedListForAccount_test_002
     * @tc.desc   getDisallowedListForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedListForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedListForAccount_test_002  -------- START --------');
      try {
        restrictions.getDisallowedListForAccount(undefined, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
        console.info(' --- getDisallowedListForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedListForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedListForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedListForAccount_test_003
     * @tc.number getDisallowedListForAccount_test_003
     * @tc.desc   getDisallowedListForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedListForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedListForAccount_test_003  -------- START --------');
      try {
        restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null);
        console.info(' --- getDisallowedListForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedListForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedListForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   getDisallowedListForAccount_test_004
     * @tc.number getDisallowedListForAccount_test_004
     * @tc.desc   getDisallowedListForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getDisallowedListForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getDisallowedListForAccount_test_004  -------- START --------');
      try {
        restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, undefined);
        console.info(' --- getDisallowedListForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getDisallowedListForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getDisallowedListForAccount_test_004  -------- END --------');
    })


    /**
     * @tc.name   setUserRestriction_test_001
     * @tc.number setUserRestriction_test_001
     * @tc.desc   setUserRestriction with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestriction_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestriction_test_001  -------- START --------');
      try {
        restrictions.setUserRestriction(null, LABEL_SET_APN, true);
        console.info(' --- setUserRestriction_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestriction_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestriction_test_001  -------- END --------');
    })


    /**
     * @tc.name   setUserRestriction_test_002
     * @tc.number setUserRestriction_test_002
     * @tc.desc   setUserRestriction with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestriction_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestriction_test_002  -------- START --------');
      try {
        restrictions.setUserRestriction(undefined, LABEL_SET_APN, true);
        console.info(' --- setUserRestriction_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestriction_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestriction_test_002  -------- END --------');
    })

    /**
     * @tc.name   setUserRestriction_test_003
     * @tc.number setUserRestriction_test_003
     * @tc.desc   setUserRestriction with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestriction_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestriction_test_003  -------- START --------');
      try {
        restrictions.setUserRestriction(SELFWANT, null, true);
        console.info(' --- setUserRestriction_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestriction_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestriction_test_003  -------- END --------');
    })

    /**
     * @tc.name   setUserRestriction_test_004
     * @tc.number setUserRestriction_test_004
     * @tc.desc   setUserRestriction with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestriction_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestriction_test_004  -------- START --------');
      try {
        restrictions.setUserRestriction(SELFWANT, undefined, true);
        console.info(' --- setUserRestriction_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestriction_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestriction_test_004  -------- END --------');
    })

    /**
     * @tc.name   getUserRestricted_test_002
     * @tc.number getUserRestricted_test_002
     * @tc.desc   getUserRestricted with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserRestricted_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserRestricted_test_002  -------- START --------');
      try {
        restrictions.getUserRestricted(undefined, LABEL_SET_ETHERNET_IP);
        console.info(' --- getUserRestricted_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserRestricted_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserRestricted_test_002  -------- END --------');
    })


    /**
     * @tc.name   setUserRestrictionForAccount_test_001
     * @tc.number setUserRestrictionForAccount_test_001
     * @tc.desc   setUserRestrictionForAccount with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestrictionForAccount_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestrictionForAccount_test_001  -------- START --------');
      try {
        restrictions.setUserRestrictionForAccount(null, LABEL_MODIFY_WALLPAPER, 100, true);
        console.info(' --- setUserRestrictionForAccount_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestrictionForAccount_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestrictionForAccount_test_001  -------- END --------');
    })


    /**
     * @tc.name   setUserRestrictionForAccount_test_002
     * @tc.number setUserRestrictionForAccount_test_002
     * @tc.desc   setUserRestrictionForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestrictionForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestrictionForAccount_test_002  -------- START --------');
      try {
        restrictions.setUserRestrictionForAccount(undefined, LABEL_MODIFY_WALLPAPER, 100, true);
        console.info(' --- setUserRestrictionForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestrictionForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestrictionForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   setUserRestrictionForAccount_test_003
     * @tc.number setUserRestrictionForAccount_test_003
     * @tc.desc   setUserRestrictionForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestrictionForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestrictionForAccount_test_003  -------- START --------');
      try {
        restrictions.setUserRestrictionForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, null, true);
        console.info(' --- setUserRestrictionForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestrictionForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestrictionForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   setUserRestrictionForAccount_test_004
     * @tc.number setUserRestrictionForAccount_test_004
     * @tc.desc   setUserRestrictionForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestrictionForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestrictionForAccount_test_004  -------- START --------');
      try {
        restrictions.setUserRestrictionForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, undefined, true);
        console.info(' --- setUserRestrictionForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestrictionForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestrictionForAccount_test_004  -------- END --------');
    })

    /**
     * @tc.name   setUserRestrictionForAccount_test_005
     * @tc.number setUserRestrictionForAccount_test_005
     * @tc.desc   setUserRestrictionForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestrictionForAccount_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestrictionForAccount_test_005  -------- START --------');
      try {
        restrictions.setUserRestrictionForAccount(SELFWANT, null, 100, true);
        console.info(' --- setUserRestrictionForAccount_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestrictionForAccount_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestrictionForAccount_test_005  -------- END --------');
    })

    /**
     * @tc.name   setUserRestrictionForAccount_test_006
     * @tc.number setUserRestrictionForAccount_test_006
     * @tc.desc   setUserRestrictionForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUserRestrictionForAccount_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUserRestrictionForAccount_test_006  -------- START --------');
      try {
        restrictions.setUserRestrictionForAccount(SELFWANT, undefined, 100, true);
        console.info(' --- setUserRestrictionForAccount_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUserRestrictionForAccount_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUserRestrictionForAccount_test_006  -------- END --------');
    })

    /**
     * @tc.name   getUserRestrictedForAccount_test_002
     * @tc.number getUserRestrictedForAccount_test_002
     * @tc.desc   getUserRestrictedForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserRestrictedForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserRestrictedForAccount_test_002  -------- START --------');
      try {
        restrictions.getUserRestrictedForAccount(undefined, LABEL_MODIFY_WALLPAPER, 100);
        console.info(' --- getUserRestrictedForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserRestrictedForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserRestrictedForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   getUserRestrictedForAccount_test_003
     * @tc.number getUserRestrictedForAccount_test_003
     * @tc.desc   getUserRestrictedForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserRestrictedForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserRestrictedForAccount_test_003  -------- START --------');
      try {
        restrictions.getUserRestrictedForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, null);
        console.info(' --- getUserRestrictedForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserRestrictedForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserRestrictedForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   getUserRestrictedForAccount_test_004
     * @tc.number getUserRestrictedForAccount_test_004
     * @tc.desc   getUserRestrictedForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserRestrictedForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserRestrictedForAccount_test_004  -------- START --------');
      try {
        restrictions.getUserRestrictedForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, undefined);
        console.info(' --- getUserRestrictedForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserRestrictedForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserRestrictedForAccount_test_004  -------- END --------');
    })

    /**
     * @tc.name   getUserRestrictedForAccount_test_005
     * @tc.number getUserRestrictedForAccount_test_005
     * @tc.desc   getUserRestrictedForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserRestrictedForAccount_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserRestrictedForAccount_test_005  -------- START --------');
      try {
        restrictions.getUserRestrictedForAccount(SELFWANT, null, 100);
        console.info(' --- getUserRestrictedForAccount_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserRestrictedForAccount_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserRestrictedForAccount_test_005  -------- END --------');
    })

    /**
     * @tc.name   getUserRestrictedForAccount_test_006
     * @tc.number getUserRestrictedForAccount_test_006
     * @tc.desc   getUserRestrictedForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getUserRestrictedForAccount_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getUserRestrictedForAccount_test_006  -------- START --------');
      try {
        restrictions.getUserRestrictedForAccount(SELFWANT, undefined, 100);
        console.info(' --- getUserRestrictedForAccount_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getUserRestrictedForAccount_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getUserRestrictedForAccount_test_006  -------- END --------');
    })

  /**
   * @tc.name   test_set_disallowed_policy_0177
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0177
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0177", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_VIRTUAL_SERVICE, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_VIRTUAL_SERVICE)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0178
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0178
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0178", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_VIRTUAL_SERVICE, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_VIRTUAL_SERVICE)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_VIRTUAL_SERVICE, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0179
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0179
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0179", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL, true);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL)).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0180
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0180
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0180", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL, false);
      expect(restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL)).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_0181
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_JS_0181
   * @tc.desc   test restrictions setDisallowedPolicy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_0181", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, true);
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedPolicy() {
  /**
   * @tc.name   test_get_disallowed_policy_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0100
   * @tc.desc   test restrictions getDisallowedPolicy without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0101
   * @tc.desc   test restrictions getDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let res = restrictions.getDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH);
      if (sysDeviceInfo.deviceType === '2in1') {
        expect(res).assertFalse();
      } else {
        expect(false).assertTrue();
      }
    } catch (error) {
      if (sysDeviceInfo.deviceType === '2in1') {
        expect(false).assertTrue();
      } else {
        expect(error.code == 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

   /**
    * @tc.name   test_get_disallowed_policy_wifi_p2p_0100
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYWIFIP2P_0100
    * @tc.desc   test restrictions getDisallowedPolicy with wifiP2p feature using byod admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_wifi_p2p_0100", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P);
       expect(ret).assertFalse();
     } catch (error) {
       expect(false).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_wifi_p2p_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYWIFIP2P_0200
    * @tc.desc   test restrictions getDisallowedPolicy with wifiP2p feature using null admin (should succeed)
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_wifi_p2p_0200", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       let ret = restrictions.getDisallowedPolicy(null, restrictions.FeatureForDevice.WIFI_P2P);
       expect(ret).assertFalse();
     } catch (error) {
       expect(false).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_wifi_p2p_0300
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYWIFIP2P_0300
    * @tc.desc   test restrictions getDisallowedPolicy with wifiP2p feature using super admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_wifi_p2p_0300", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P);
       expect(ret).assertFalse();
     } catch (error) {
       expect(false).assertTrue();
     } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_wifi_p2p_0400
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYWIFIP2P_0400
    * @tc.desc   test restrictions getDisallowedPolicy with wifiP2p feature using normal admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_wifi_p2p_0400", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P);
       expect(ret).assertFalse();
     } catch (error) {
       expect(Number(error.code) === 9200002).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_wifi_p2p_0500
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYWIFIP2P_0500
    * @tc.desc   test restrictions getDisallowedPolicy with wifiP2p feature without admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_wifi_p2p_0500", Level.LEVEL2, async (done: Function) => {
     try {
       restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.WIFI_P2P);
       expect(false).assertTrue();
     } catch (error) {
       expect(error.code == 9200001).assertTrue();
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_wifi_p2p_0600
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYWIFIP2P_0600
    * @tc.desc   test restrictions getDisallowedPolicy with null feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_wifi_p2p_0600", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       restrictions.getDisallowedPolicy(SELFWANT, null);
       expect(false).assertTrue();
     } catch (error) {
       expect(Number(error.code) === 401).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_wifi_p2p_0700
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYWIFIP2P_0700
    * @tc.desc   test restrictions getDisallowedPolicy with undefined feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_wifi_p2p_0700", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       restrictions.getDisallowedPolicy(SELFWANT, undefined);
       expect(false).assertTrue();
     } catch (error) {
       expect(Number(error.code) === 401).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

  /**
   * @tc.name   test_get_disallowed_policy_uinput_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_UINPUT_0100
   * @tc.desc   test restrictions getDisallowedPolicy with uinput feature using byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_uinput_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_uinput_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_UINPUT_0200
   * @tc.desc   test restrictions getDisallowedPolicy with uinput feature using null admin (should succeed)
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_uinput_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(null, restrictions.FeatureForDevice.LOCAL_INPUT);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_uinput_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_UINPUT_0300
   * @tc.desc   test restrictions getDisallowedPolicy with uinput feature using super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_uinput_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT);
      expect(ret).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_uinput_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_UINPUT_0400
   * @tc.desc   test restrictions getDisallowedPolicy with uinput feature using normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_uinput_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT);
      expect(ret).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_uinput_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_UINPUT_0500
   * @tc.desc   test restrictions getDisallowedPolicy with uinput feature without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_uinput_0500", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.LOCAL_INPUT);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 9200001).assertTrue();
    }
    done();
  });

   /**
    * @tc.name   test_get_disallowed_policy_core_dump_0100
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0100
    * @tc.desc   test restrictions getDisallowedPolicy with coredump feature byod admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_core_dump_0100", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP);
       expect(ret).assertFalse();
     } catch (error) {
       expect(Number(error.code) === 9200002).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_core_dump_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0200
    * @tc.desc   test restrictions getDisallowedPolicy with coredump feature null admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_core_dump_0200", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
     try {
       let ret = restrictions.getDisallowedPolicy(null, restrictions.FeatureForDevice.CORE_DUMP);
       expect(ret).assertFalse();
     } catch (error) {
       expect(false).assertTrue();
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_core_dump_0300
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0300
    * @tc.desc   test restrictions getDisallowedPolicy with coredump feature super admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_core_dump_0300", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP);
       expect(ret).assertFalse();
     } catch (error) {
       expect(false).assertTrue();
     } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_core_dump_0400
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0400
    * @tc.desc   test restrictions getDisallowedPolicy with coredump feature normal admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_core_dump_0400", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
     try {
       let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP);
       expect(ret).assertFalse();
     } catch (error) {
       expect(Number(error.code) === 9200002).assertTrue();  
     } finally {
       await adminManager.disableAdmin(SELFWANT);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_core_dump_0500
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0500
    * @tc.desc   test restrictions getDisallowedPolicy with coredump feature without admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_core_dump_0500", Level.LEVEL2, async (done: Function) => {
     try {
       restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.CORE_DUMP);
       expect(false).assertTrue();
     } catch (error) {
       expect(Number(error.code) === 9200001).assertTrue();  
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_core_dump_0600
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0600
    * @tc.desc   test restrictions getDisallowedPolicy with unknow feature
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_core_dump_0600", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
     try {
       restrictions.getDisallowedPolicy(SELFWANT, -1);
       expect(false).assertTrue();
     } catch (error) {
       expect(Number(error.code) === 801).assertTrue();  
     } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
     }
     done();
   });

   /**
    * @tc.name   test_get_disallowed_policy_core_dump_0700
    * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYCOREDUMP_0700
    * @tc.desc   test restrictions getDisallowedPolicy with coredump feature undefined admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_core_dump_0700", Level.LEVEL2, async (done: Function) => {
     try {
       let ret = restrictions.getDisallowedPolicy(undefined, restrictions.FeatureForDevice.CORE_DUMP);
       expect(ret).assertFalse();
     } catch (error) {
       expect(Number(error.code) === 401).assertTrue();  
     }
done();
    });

    /**
     * @tc.name   test_get_disallowed_policy_disk_erasure_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYDISK_ERASURE_0100
     * @tc.desc   test restrictions getDisallowedPolicy with disk erasure feature without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_disallowed_policy_disk_erasure_0100", Level.LEVEL2, async (done: Function) => {
      try {
        restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200001).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_get_disallowed_policy_disk_erasure_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYDISK_ERASURE_0200
     * @tc.desc   test restrictions getDisallowedPolicy with disk erasure feature null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_disallowed_policy_disk_erasure_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = restrictions.getDisallowedPolicy(null, restrictions.FeatureForDevice.DISK_ERASURE);
        expect(ret).assertFalse();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_get_disallowed_policy_disk_erasure_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYDISK_ERASURE_0300
     * @tc.desc   test restrictions getDisallowedPolicy with disk erasure feature undefined admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_disallowed_policy_disk_erasure_0300", Level.LEVEL2, async (done: Function) => {
      try {
        let ret = restrictions.getDisallowedPolicy(undefined, restrictions.FeatureForDevice.DISK_ERASURE);
        expect(ret).assertFalse();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      }
      done();
    });

    /**
     * @tc.name   test_get_disallowed_policy_disk_erasure_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYDISK_ERASURE_0400
     * @tc.desc   test restrictions getDisallowedPolicy with disk erasure feature null feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_disallowed_policy_disk_erasure_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.getDisallowedPolicy(SELFWANT, null);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_get_disallowed_policy_disk_erasure_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYDISK_ERASURE_0500
     * @tc.desc   test restrictions getDisallowedPolicy with disk erasure feature undefined feature
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_get_disallowed_policy_disk_erasure_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.getDisallowedPolicy(SELFWANT, undefined);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 401).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_get_disallowed_policy_disk_erasure_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYDISK_ERASURE_0600
     * @tc.desc   test restrictions getDisallowedPolicy with disk erasure feature super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("test_get_disallowed_policy_disk_erasure_0600", Level.LEVEL0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE);
        expect(ret).assertFalse();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_get_disallowed_policy_disk_erasure_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYDISK_ERASURE_0700
     * @tc.desc   test restrictions getDisallowedPolicy with disk erasure feature byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it("test_get_disallowed_policy_disk_erasure_0700", Level.LEVEL2, async (done: Function) => {
       await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
       try {
         let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.DISK_ERASURE);
         expect(ret).assertFalse();
       } catch (error) {
         if (Number(error.code) === 801) {
           expect(Number(error.code) === 801).assertTrue();
         } else {
           expect(Number(error.code) === 9200002).assertTrue();
         }
       } finally {
         await adminManager.disableAdmin(SELFWANT);
       }
       done();
     });

     /**
      * @tc.name   test_get_disallowed_policy_sudo_0100
      * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUDO_0100
      * @tc.desc   test restrictions getDisallowedPolicy with sudo feature without admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it("test_get_disallowed_policy_sudo_0100", Level.LEVEL2, async (done: Function) => {
       try {
         restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO);
         expect(false).assertTrue();
       } catch (error) {
         if (Number(error.code) === 801) {
           expect(Number(error.code) === 801).assertTrue();
         } else {
           expect(Number(error.code) === 9200001).assertTrue();
         }
       }
       done();
     });

     /**
      * @tc.name   test_get_disallowed_policy_sudo_0300
      * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUDO_0300
      * @tc.desc   test restrictions getDisallowedPolicy with sudo feature undefined admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it("test_get_disallowed_policy_sudo_0300", Level.LEVEL2, async (done: Function) => {
       try {
         let ret = restrictions.getDisallowedPolicy(undefined, restrictions.FeatureForDevice.SUDO);
         expect(ret).assertFalse();
       } catch (error) {
         if (Number(error.code) === 801) {
           expect(Number(error.code) === 801).assertTrue();
         } else {
           expect(Number(error.code) === 401).assertTrue();
         }
       }
       done();
     });

     /**
      * @tc.name   test_get_disallowed_policy_sudo_0400
      * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUDO_0400
      * @tc.desc   test restrictions getDisallowedPolicy with sudo feature null feature
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it("test_get_disallowed_policy_sudo_0400", Level.LEVEL2, async (done: Function) => {
       await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
       try {
         restrictions.getDisallowedPolicy(SELFWANT, null);
         expect(false).assertTrue();
       } catch (error) {
         if (Number(error.code) === 801) {
           expect(Number(error.code) === 801).assertTrue();
         } else {
           expect(Number(error.code) === 401).assertTrue();
         }
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     });

     /**
      * @tc.name   test_get_disallowed_policy_sudo_0500
      * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUDO_0500
      * @tc.desc   test restrictions getDisallowedPolicy with sudo feature undefined feature
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it("test_get_disallowed_policy_sudo_0500", Level.LEVEL2, async (done: Function) => {
       await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
       try {
         restrictions.getDisallowedPolicy(SELFWANT, undefined);
         expect(false).assertTrue();
       } catch (error) {
         if (Number(error.code) === 801) {
           expect(Number(error.code) === 801).assertTrue();
         } else {
           expect(Number(error.code) === 401).assertTrue();
         }
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     });

     /**
      * @tc.name   test_get_disallowed_policy_sudo_0600
      * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUDO_0600
      * @tc.desc   test restrictions getDisallowedPolicy with sudo feature super admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it("test_get_disallowed_policy_sudo_0600", Level.LEVEL0, async (done: Function) => {
       await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
       try {
         let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO);
         expect(ret).assertFalse();
       } catch (error) {
         expect(Number(error.code) === 801).assertTrue();
       } finally {
         await adminManager.disableSuperAdmin(SELFHAPNAME);
       }
       done();
     });

     /**
      * @tc.name   test_get_disallowed_policy_sudo_0700
      * @tc.number SUB_CUSTOMIZATION_EDM_GETDISALLOWEDPOLICYSUDO_0700
      * @tc.desc   test restrictions getDisallowedPolicy with sudo feature byod admin
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it("test_get_disallowed_policy_sudo_0700", Level.LEVEL2, async (done: Function) => {
       await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
       try {
         let ret = restrictions.getDisallowedPolicy(SELFWANT, restrictions.FeatureForDevice.SUDO);
         expect(ret).assertFalse();
       } catch (error) {
         if (Number(error.code) === 801) {
           expect(Number(error.code) === 801).assertTrue();
         } else {
           expect(Number(error.code) === 9200002).assertTrue();
         }
       } finally {
         await adminManager.disableAdmin(SELFWANT);
       }
       done();
     });

    /**
     * @tc.name   test_get_disallowed_policy_0102
    * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0102
    * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
   it("test_get_disallowed_policy_0102", Level.LEVEL2, async (done: Function) => {
     await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
     try {
       restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_BLUETOOTH);
       expect(false).assertTrue();
     } catch (error) {
       expect(Number(error.code) === 401).assertTrue();
     } finally {
       await adminManager.disableSuperAdmin(SELFHAPNAME);
     }
     done();
   });

  /**
   * @tc.name   test_get_disallowed_policy_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0103
   * @tc.desc   test restrictions getDisallowedPolicy with unsupported label
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, '123');
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0104
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_APP_CLONE);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0105
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0105", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_APP_CLONE);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0105 error 9200001 is expected, actually catch: ' + error.code);
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0106
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0106", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_APP_CLONE);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0106 error 9200002 is expected, actually catch: ' + error.code);
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0107
   * @tc.desc   test restrictions getDisallowedPolicy with with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0107", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABLE_EXTERNAL_STORAGE_CARD);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0108
   * @tc.desc   test restrictions getDisallowedPolicy with with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0108", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABLE_EXTERNAL_STORAGE_CARD);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0108 error 9200001 is expected, actually catch: ' + error.code);
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0109
   * @tc.desc   test restrictions getDisallowedPolicy with with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0109", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABLE_EXTERNAL_STORAGE_CARD);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0109 error 9200002 is expected, actually catch: ' + error.code);
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0110
   * @tc.desc   test restrictions getDisallowedPolicy with with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0110", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABLE_RANDOM_MAC);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0111
   * @tc.desc   test restrictions getDisallowedPolicy with with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0111", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABLE_RANDOM_MAC);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0108 error 9200001 is expected, actually catch: ' + error.code);
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0112
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0112
   * @tc.desc   test restrictions getDisallowedPolicy with with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0112", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABLE_RANDOM_MAC);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0112 error 9200002 is expected, actually catch: ' + error.code);
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0113
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0113", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_UNMUTE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0114
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0114
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0114", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_UNMUTE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0114 error 9200001 is expected, actually catch: ' + error.code);
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0115
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0115
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0115", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_UNMUTE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0115 error 9200002 is expected, actually catch: ' + error.code);
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0116
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0116
   * @tc.desc   test restrictions getDisallowedPolicy with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0116", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0117
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0117
   * @tc.desc   test restrictions getDisallowedPolicy with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0117", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_HDC_REMOTE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0118
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0118
   * @tc.desc   test restrictions getDisallowedPolicy with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0118", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_HDC_REMOTE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0119
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0119
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0119", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_VIRTUAL_SERVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0120
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0120
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0120", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_VIRTUAL_SERVICE);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0114 error 9200001 is expected, actually catch: ' + error.code);
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0121
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0121
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0121", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_VIRTUAL_SERVICE);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0115 error 9200002 is expected, actually catch: ' + error.code);
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

    /**
   * @tc.name   test_get_disallowed_policy_0122
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0122
   * @tc.desc   test restrictions getDisallowedPolicy with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0122", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicy(INVALID_WANT, LABEL_USB_SERIAL);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0123
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0123
   * @tc.desc   test restrictions getDisallowedPolicy without enable admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0123", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0123 error 9200001 is expected, actually catch: ' + error.code);
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_0124
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_JS_0124
   * @tc.desc   test restrictions getDisallowedPolicy with bad admin type
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_0124", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicy(SELFWANT, LABEL_USB_SERIAL);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_disallowed_policy_0124 error 9200002 is expected, actually catch: ' + error.code);
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetDisallowedForAccountPolicy() {
  /**
   * @tc.name   test_set_disallowed_policy_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0100
   * @tc.desc   test restrictions setDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0200
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0300
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0400
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, null, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0500
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty disallow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0600
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0700
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, false, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0800
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT, true);
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_FINGER_PRINT, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0901
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0901
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0901", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, false, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, DEFAULT_USER_ID);
      expect(res).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0902
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0902
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0902", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, false, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0903
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0903
   * @tc.desc   test restrictions setDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0903", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0904
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0904
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0904", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0905
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0905
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0905", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_MTP_CLIENT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0906
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0906
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with user 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0906", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 0;
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, true, userId);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200007).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0907
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0907
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with conflict policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0907", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, DEFAULT_USER_ID);
      expect(res).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT, true);
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, false, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0908
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0908
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with conflict policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0908", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT, true);
      let res = restrictions.getDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT)
      expect(res).assertTrue();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, true, DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_MTP_CLIENT, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0909
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0909
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0909", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, false, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, DEFAULT_USER_ID);
      expect(res).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0910
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0910
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0910", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, DEFAULT_USER_ID);
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, false, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0911
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0911
   * @tc.desc   test restrictions setDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0911", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0912
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0912
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0912", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0913
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0913
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0913", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_RECOVERY_KEY, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0914
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0914
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with user 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0914", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 999;
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, true, userId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0915
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0915
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0915", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, false, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(res).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0916
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0916
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0916", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0917
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0917
   * @tc.desc   test restrictions setDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0917", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0918
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0918
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0918", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0919
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0919
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0919", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0920
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0920
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with user 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0920", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 0;
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, userId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200007).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0921
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0921
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with conflict policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0921", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(res).assertTrue();
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_USB, true);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0922
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0922
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with conflict policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0922", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(res).assertTrue();
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_ONLY);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    }finally{
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0923
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0923
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with conflict policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0923", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(res).assertTrue();
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.READ_WRITE);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0924
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0924
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with conflict policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0924", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(res).assertTrue();
      usbManager.setUsbStorageDeviceAccessPolicy(SELFWANT, usbManager.UsbPolicy.DISABLED);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0925
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0925
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with conflict policy
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0925", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(res).assertTrue();
      let devices: Array<usbManager.UsbDeviceType> = [
        {baseClass: 8, subClass: 2, protocol: 2, descriptor: usbManager.Descriptor.INTERFACE}
      ]
      usbManager.addDisallowedUsbDevices(SELFWANT, devices);
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0930
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0930
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0930", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, false, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(res).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0931
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0931
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0931", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, false, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0932
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0932
   * @tc.desc   test restrictions setDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0932", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0933
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0933
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0933", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0934
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0934
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0934", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_DISTRIBUTED_TRANSMISSION, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0935
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0935
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with user 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0935", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 0;
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, true, userId);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200007).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0940
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0940
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0940", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0941
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0941
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0941", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0942
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0942
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0942", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_SUDO, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0943
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0943
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0943", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, '', true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0944
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0944
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty disallow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0944", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0945
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0945
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0945", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, true, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0946
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0946
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with default accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0946", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, DEFAULT_USER_ID);
      expect(res).assertTrue();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, false, DEFAULT_USER_ID);
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0947
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0947
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with not be created user
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0947", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 0;
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, true, userId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200007).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0948
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0948
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0948", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, false, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, DEFAULT_USER_ID);
      expect(res).assertFalse();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0949
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0949
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with policy true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0949", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, false, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0950
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0950
   * @tc.desc   test restrictions setDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0950", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0951
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0951
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0951", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0952
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0952
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0952", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_PRINT, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0953
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0953
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0953", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_PRINTER, true);
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, true, DEFAULT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_PRINTER, false);
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, false, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_1001
   * @tc.name      : test_set_disallowed_policy_for_account_1001
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with policy false
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_1001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, false, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, DEFAULT_USER_ID);
      expect(res).assertFalse();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_1002
   * @tc.name      : test_set_disallowed_policy_for_account_1002
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with policy true
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_1002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, true, DEFAULT_USER_ID);
      let res = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, DEFAULT_USER_ID);
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, false, DEFAULT_USER_ID);
      expect(res).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_1003
   * @tc.name      : test_set_disallowed_policy_for_account_1003
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_1003", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_1004
   * @tc.name      : test_set_disallowed_policy_for_account_1004
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_1004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_1005
   * @tc.name      : test_set_disallowed_policy_for_account_1005
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_1005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, LABEL_OPEN_FILE_BOOST, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_1006
   * @tc.name      : test_set_disallowed_policy_for_account_1006
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount with user 0
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_1006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 999;
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, true, userId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedForAccountPolicy() {
  /**
   * @tc.name   test_get_disallowed_policy_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0100
   * @tc.desc   test restrictions getDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0200
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0300
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_FINGER_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0400
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0500
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_FINGER_PRINT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0601
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0601
   * @tc.desc   test restrictions getDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0601", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0602
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0602
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0602", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_MTP_CLIENT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0603
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0603
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0603", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_MTP_CLIENT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0701
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0701
   * @tc.desc   test restrictions getDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0701", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0702
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0702
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0702", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_RECOVERY_KEY, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0703
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0703
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0703", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_RECOVERY_KEY, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0704
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0704
   * @tc.desc   test restrictions getDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0704", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0705
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0705
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0705", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0706
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0706
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0706", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_USB_STORAGE_DEVICE_WRITE, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });


  /**
   * @tc.name   test_get_disallowed_policy_for_account_0801
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0801
   * @tc.desc   test restrictions getDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0801", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0802
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0802
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0802", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0803
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0803
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0803", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0904
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0904
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0904", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0905
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0905
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0905", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0906
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0906
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0906", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_SUDO, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0907
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0907
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0907", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, '', DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0908
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0908
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0908", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_0909
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_0909
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with empty not be created userId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_0909", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 0;
    try {
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_SUDO, userId);
      expect(ret).assertFalse();
    } catch(error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_1001
   * @tc.name      : test_get_disallowed_policy_for_account_1001
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_1001", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_1002
   * @tc.name      : test_get_disallowed_policy_for_account_1002
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_1002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_OPEN_FILE_BOOST, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_1003
   * @tc.name      : test_get_disallowed_policy_for_account_1003
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount with invalid admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_1003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_OPEN_FILE_BOOST, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_1101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_1101
   * @tc.desc   test restrictions getDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_1101", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_1102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_1102
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_1102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_1103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_FOR_ACCOUNT_POLICY_JS_1103
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_1103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, LABEL_PRINT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddDisallowedListForAccountPolicy() {
  /**
   * @tc.name   test_add_disallowed_list_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0100
   * @tc.desc   test restrictions addDisallowedListForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0200
   * @tc.desc   test restrictions addDisallowedListForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0300
   * @tc.desc   test restrictions addDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(INVALID_WANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0400
   * @tc.desc   test restrictions addDisallowedListForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, null, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0500
   * @tc.desc   test restrictions addDisallowedListForAccount with empty disallow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0600
   * @tc.desc   test restrictions addDisallowedListForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0700
   * @tc.desc   test restrictions addDisallowedListForAccount add and get success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let res: Array<string> = restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(res.length == 0).assertTrue();
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      let result: Array<string> = restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(result.length > 0).assertTrue();
      expect(result.length === APP_IDS_1.length).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0800
   * @tc.desc   test restrictions addDisallowedListForAccount with over max limit
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nameList:string[] = [];
    for (let index = 0; index < 1001; index++) {
      nameList.push("bundle.name" + index);
    }
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, nameList, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0900
   * @tc.desc   test restrictions addDisallowedListForAccount with max limit
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let nameList:string[] = [];
    for (let index = 0; index < 1000; index++) {
      nameList.push("bundle.name" + index);
    }
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, nameList, DEFAULT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_0901
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_0901
   * @tc.desc   test restrictions addDisallowedListForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_0901", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let valueList: Array<string> = [];
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, valueList, DEFAULT_USER_ID);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_1000
   * @tc.desc   test restrictions addDisallowedListForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, null, APP_IDS_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_list_for_account_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_LIST_FOR_ACCOUNT_JS_1100
   * @tc.desc   test restrictions addDisallowedListForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_list_for_account_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, undefined, APP_IDS_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveDisallowedListForAccountPolicy() {
  /**
   * @tc.name   test_remove_disallowed_list_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0100
   * @tc.desc   test restrictions removeDisallowedListForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0200
   * @tc.desc   test restrictions removeDisallowedListForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0300
   * @tc.desc   test restrictions removeDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(INVALID_WANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0400
   * @tc.desc   test restrictions removeDisallowedListForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, null, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0500
   * @tc.desc   test restrictions removeDisallowedListForAccount with empty bundleName
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0600
   * @tc.desc   test restrictions removeDisallowedListForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0700
   * @tc.desc   test restrictions removeDisallowedListForAccount remove success
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.addDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      let result: Array<string> = restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(result.length === APP_IDS_1.length).assertTrue();
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, APP_IDS_1, DEFAULT_USER_ID);
      let resultAfterRemove: Array<string> = restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(resultAfterRemove.length === 0).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0800
   * @tc.desc   test restrictions removeDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, null, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_0900
   * @tc.desc   test restrictions removeDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, undefined, APP_IDS_1, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_list_for_account_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_LIST_FOR_ACCOUNT_JS_1000
   * @tc.desc   test restrictions removeDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_list_for_account_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.removeDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, [], DEFAULT_USER_ID);
    } catch (error) {
      expect(error === null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedListForAccountPolicy() {
  /**
   * @tc.name   test_get_disallowed_list_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0100
   * @tc.desc   test restrictions getDisallowedListForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_list_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_list_for_account_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0200
   * @tc.desc   test restrictions getDisallowedListForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_list_for_account_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_list_for_account_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0300
   * @tc.desc   test restrictions getDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_list_for_account_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(INVALID_WANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_list_for_account_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0400
   * @tc.desc   test restrictions getDisallowedListForAccount with empty feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_list_for_account_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_list_for_account_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0600
   * @tc.desc   test restrictions getDisallowedListForAccount with empty accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_list_for_account_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(SELFWANT, LABEL_SNAPSHOT_SKIP_FOR_ACCOUNT, null);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_list_for_account_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0700
   * @tc.desc   test restrictions getDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_list_for_account_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(INVALID_WANT, null, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_list_for_account_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_LIST_FOR_ACCOUNT_JS_0800
   * @tc.desc   test restrictions getDisallowedListForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_list_for_account_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedListForAccount(INVALID_WANT, undefined, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetUserRestrictionPolicy() {
  /**
   * @tc.name   test_set_user_restriction_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0100
   * @tc.desc   test setUserRestriction with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_APN, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0100 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0200
   * @tc.desc   test setUserRestriction with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_APN, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0200 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0300
   * @tc.desc   test setUserRestriction with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_APN, true);
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_APN, false);
    } catch (error) {
      console.info(' --- test_set_user_restriction_0300 error 801 is expected, actually catch: ' + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0400
   * @tc.desc   test setUserRestriction with setting item 'setEthernetIp' with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0400", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_ETHERNET_IP, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_user_restriction_0400 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0401
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0401
   * @tc.desc   test setUserRestriction with setting item 'setEthernetIp' with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0401", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_ETHERNET_IP, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_set_user_restriction_0401 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0402
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0402
   * @tc.desc   test setUserRestriction with setting item 'setEthernetIp' with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0402", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_ETHERNET_IP, true);
      let res : boolean = restrictions.getUserRestricted(SELFWANT, LABEL_SET_ETHERNET_IP);
      expect(res).assertTrue();
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_ETHERNET_IP, false);
    } catch (error) {
      console.info('test_set_user_restriction_0402 error 801 is expected, actually catch: '
        + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0403
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0403
   * @tc.desc   test setUserRestriction with setting item 'setEthernetIp' with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0403", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_ETHERNET_IP, false);
      let res : boolean = restrictions.getUserRestricted(SELFWANT, LABEL_SET_ETHERNET_IP);
      expect(res).assertFalse();
    } catch (error) {
      console.info('test_set_user_restriction_0403 error 801 is expected, actually catch: '
        + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0404
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0404
   * @tc.desc   test setUserRestriction with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0404", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_POWER_LONG_PRESS, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0404 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0405
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0405
   * @tc.desc   test setUserRestriction with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0405", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_POWER_LONG_PRESS, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0405 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0406
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0406
   * @tc.desc   test setUserRestriction with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0406", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_POWER_LONG_PRESS, true);
      restrictions.setUserRestriction(SELFWANT, LABEL_POWER_LONG_PRESS, false);
    } catch (error) {
      console.info(' --- test_set_user_restriction_0406 error 801 is expected, actually catch: ' + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0500
   * @tc.desc   test setUserRestriction with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0500", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0500 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0501
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0501
   * @tc.desc   test setUserRestriction with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0501", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0501 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0502
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0502
   * @tc.desc   test setUserRestriction with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0502", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK, true);
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK, false);
    } catch (error) {
      console.info(' --- test_set_user_restriction_0502 error 801 is expected, actually catch: ' + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0503
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0503
   * @tc.desc   test setUserRestriction with INVALID_WANT
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0503", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(INVALID_WANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK, true);
    } catch (error) {
      console.info(' --- test_set_user_restriction_0503 error 801 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
  
  /**
   * @tc.name   test_set_user_restriction_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0600
   * @tc.desc   test setUserRestriction with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0600", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_DEVICE_NAME, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0600 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0601
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0601
   * @tc.desc   test setUserRestriction with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0601", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_DEVICE_NAME, true);
      expect(false).assertTrue();
    } catch (error) {
      console.info(' --- test_set_user_restriction_0601 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0602
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0602
   * @tc.desc   test setUserRestriction with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0602", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_DEVICE_NAME, true);
      restrictions.setUserRestriction(SELFWANT, LABEL_SET_DEVICE_NAME, false);
    } catch (error) {
      console.info(' --- test_set_user_restriction_0602 error 801 is expected, actually catch: ' + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_0603
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_JS_0603
   * @tc.desc   test setUserRestriction with INVALID_WANT
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_0603", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestriction(INVALID_WANT, LABEL_SET_DEVICE_NAME, true);
    } catch (error) {
      console.info(' --- test_set_user_restriction_0603 error 801 is expected, actually catch: ' + error.code);
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetUserRestrictedPolicy() {
  /**
   * @tc.name   test_get_user_restricted_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0100
   * @tc.desc   test restrictions getUserRestricted with setting item 'setEthernetIp' with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getUserRestricted(SELFWANT, LABEL_SET_ETHERNET_IP);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0100 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0101
   * @tc.desc   test restrictions getUserRestricted with setting item 'setEthernetIp' with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getUserRestricted(SELFWANT, LABEL_SET_ETHERNET_IP);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0101 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0102
   * @tc.desc   test restrictions getUserRestricted with setting item 'setEthernetIp' with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getUserRestricted(INVALID_WANT, LABEL_SET_ETHERNET_IP);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0102 error 401 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0103
   * @tc.desc   test restrictions getUserRestricted with setting item 'setEthernetIp' with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let res : boolean = restrictions.getUserRestricted(SELFWANT, LABEL_SET_ETHERNET_IP);
      expect(res).assertFalse();
    } catch (error) {
      console.info('test_get_user_restricted_0103 error 801 is expected, actually catch: '
        + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0200
   * @tc.desc   test restrictions getUserRestricted with setting item 'setBiometricsAndScreenLock' with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0200", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getUserRestricted(SELFWANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0200 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0201
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0201
   * @tc.desc   test restrictions getUserRestricted with setting item 'setBiometricsAndScreenLock' with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0201", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getUserRestricted(SELFWANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0201 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0202
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0202
   * @tc.desc   test restrictions getUserRestricted with setting item 'setBiometricsAndScreenLock' with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0202", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getUserRestricted(INVALID_WANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0202 error 401 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0203
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0203
   * @tc.desc   test restrictions getUserRestricted with setting item 'setBiometricsAndScreenLock' with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0203", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let res : boolean = restrictions.getUserRestricted(SELFWANT, LABEL_SET_BIOMETRICS_AND_SCREENLOCK);
      expect(res).assertFalse();
    } catch (error) {
      console.info('test_get_user_restricted_0203 error 801 is expected, actually catch: '
        + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0300
   * @tc.desc   test restrictions getUserRestricted with setting item 'setDeviceName' with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0300", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getUserRestricted(SELFWANT, LABEL_SET_DEVICE_NAME);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0300 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0301
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0301
   * @tc.desc   test restrictions getUserRestricted with setting item 'setDeviceName' with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0301", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getUserRestricted(SELFWANT, LABEL_SET_DEVICE_NAME);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0301 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0302
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0302
   * @tc.desc   test restrictions getUserRestricted with setting item 'setDeviceName' with INVALID_WANT
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0302", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getUserRestricted(INVALID_WANT, LABEL_SET_DEVICE_NAME);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0302 error 401 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_0303
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_JS_0303
   * @tc.desc   test restrictions getUserRestricted with setting item 'setDeviceName' with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_0303", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let res : boolean = restrictions.getUserRestricted(SELFWANT, LABEL_SET_DEVICE_NAME);
      expect(res).assertFalse();
    } catch (error) {
      console.info('test_get_user_restricted_0303 error 801 is expected, actually catch: '
        + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetUserRestrictionForAccountPolicy() {
  /**
   * @tc.name   test_set_user_restriction_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_FOR_ACCOUNT_JS_0100
   * @tc.desc   test setUserRestrictionForAccount with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setUserRestrictionForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100, true);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_for_account_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_FOR_ACCOUNT_JS_0101
   * @tc.desc   test setUserRestrictionForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_for_account_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setUserRestrictionForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100, true);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_for_account_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_FOR_ACCOUNT_JS_0102
   * @tc.desc   test setUserRestrictionForAccount with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_for_account_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestrictionForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 1002, true);
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_JS_0103
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with empty admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestrictionForAccount(INVALID_WANT, LABEL_MODIFY_WALLPAPER, 100, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_user_restriction_for_account_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_USER_RESTRICTION_FOR_ACCOUNT_JS_0104
   * @tc.desc   test setUserRestrictionForAccount with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_user_restriction_for_account_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setUserRestrictionForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100, true);
      let res : boolean = restrictions.getUserRestrictedForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100);
      expect(res).assertTrue();
      restrictions.setUserRestrictionForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100, false);
    } catch (error) {
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetUserRestrictedForAccountPolicy() {
  /**
   * @tc.name   test_get_user_restricted_for_account_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_FOR_ACCOUNT_JS_0100
   * @tc.desc   test restrictions getUserRestrictedForAccount with setting item 'modifyWallpaper' with unActiveadmin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_for_account_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getUserRestrictedForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_for_account_0100 error 9200001 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_for_account_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_FOR_ACCOUNT_JS_0101
   * @tc.desc   test restrictions getUserRestrictedForAccount with setting item 'modifyWallpaper' with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_for_account_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getUserRestrictedForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_for_account_0100 error 9200002 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_for_account_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_FOR_ACCOUNT_JS_0102
   * @tc.desc   test restrictions getUserRestrictedForAccount with setting item 'modifyWallpaper' with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_for_account_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getUserRestrictedForAccount(INVALID_WANT, LABEL_MODIFY_WALLPAPER, 100);
      expect(false).assertTrue();
    } catch (error) {
      console.info('test_get_user_restricted_0102 error 401 or 801 is expected, actually catch: '
        + error.code);
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
  * @tc.name   test_get_user_restricted_for_account_0103
  * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_FOR_ACCOUNT_JS_0103
  * @tc.desc   test restrictions getUserRestrictedForAccount with setting item 'modifyWallpaper' with admin null
  * @tc.type   FUNCTION
  * @tc.size   MEDIUMTEST
  * @tc.level  LEVEL2
  */
  it("test_get_user_restricted_for_account_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let res : boolean = restrictions.getUserRestrictedForAccount(null, LABEL_MODIFY_WALLPAPER, 100);
      expect(res).assertFalse();
    } catch (error) {
      console.info('test_get_user_restricted_for_account_0103 error 801 is expected, actually catch: '
        + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_user_restricted_for_account_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_USER_RESTRICTED_FOR_ACCOUNT_JS_0104
   * @tc.desc   test restrictions getUserRestrictedForAccount with setting item 'modifyWallpaper' with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_user_restricted_for_account_0104", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let res : boolean = restrictions.getUserRestrictedForAccount(SELFWANT, LABEL_MODIFY_WALLPAPER, 100);
      expect(res).assertFalse();
    } catch (error) {
      console.info('test_get_user_restricted_for_account_0104 error 801 is expected, actually catch: '
        + error.code);
      expect(error.code == 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetDisallowedForAccountPolicy26() {
  /**
   * @tc.name   test_set_disallowed_policy_for_account_26_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0100
   * @tc.desc   test restrictions setDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_26_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true,
        DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_26_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0200
   * @tc.desc   test restrictions setDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_26_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true,
        DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0300
   * @tc.name      : test_set_disallowed_policy_for_account_26_0300
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub then nonStop
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, localId);
      let userNonStopApps: Array<common.ApplicationInstance> = [
        {
          appIdentifier:"5765880207854114601",
          accountId:DEFAULT_USER_ID,
          appIndex:0
        }
      ];
      applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0400
   * @tc.name      : test_set_disallowed_policy_for_account_26_0400
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub after nonStop
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let userNonStopApps: Array<common.ApplicationInstance> = [
        {
          appIdentifier:"5765880207854114601",
          accountId:DEFAULT_USER_ID,
          appIndex:0
        }
      ];
      applicationManager.addUserNonStopApps(SELFWANT, userNonStopApps);

      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 9200012) {
        expect(Number(error.code) === 9200012).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0500
   * @tc.name      : test_set_disallowed_policy_for_account_26_0500
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub before removeHiddenSettingsMenu
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, localId);

      const VALID_MENUS_TO_HIDE: Array<deviceSettings.SettingsMenu> = [
        deviceSettings.SettingsMenu.SUPERHUB,
        deviceSettings.SettingsMenu.WIFI
      ];
      deviceSettings.addHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
      deviceSettings.removeHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0600
   * @tc.name      : test_set_disallowed_policy_for_account_26_0600
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub other accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, localId + 1);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else if (Number(error.code) === 401) {
        expect(Number(error.code) === 401).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0700
   * @tc.name      : test_set_disallowed_policy_for_account_26_0700
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub true
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, localId);
      expect(ret).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0800
   * @tc.name      : test_set_disallowed_policy_for_account_26_0800
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub false
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, false, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, localId);
      expect(ret).assertFalse();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0900
   * @tc.name      : test_set_disallowed_policy_for_account_26_0900
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub null admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_0900", Level.LEVEL2, async (done: Function) => {
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(null, restrictions.FeatureForAccount.SUPER_HUB, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_1000
   * @tc.name      : test_set_disallowed_policy_for_account_26_1000
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub undefined admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_1000", Level.LEVEL2, async (done: Function) => {
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(undefined, restrictions.FeatureForAccount.SUPER_HUB, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_1100
   * @tc.name      : test_set_disallowed_policy_for_account_26_1100
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub null feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, null, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_1200
   * @tc.name      : test_set_disallowed_policy_for_account_26_1200
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub undefined feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, undefined, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_1300
   * @tc.name      : test_set_disallowed_policy_for_account_26_1300
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub null localId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, null);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_1400
   * @tc.name      : test_set_disallowed_policy_for_account_26_1400
   * @tc.desc      : test restrictions setDisallowedPolicyForAccount superhub undefined localId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_disallowed_policy_for_account_26_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, true, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
     * @tc.name   test_set_disallowed_policy_for_account_multiwindow_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_MULTIWINDOW_JS_0100
     * @tc.desc   test restrictions setDisallowedPolicyForAccount multiwindow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
  it("test_set_disallowed_policy_for_account_multiwindow_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.MULTI_WINDOW, true, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.MULTI_WINDOW, localId);
      expect(ret).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0100
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0300
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0400
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(INVALID_WANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0500
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with super admin disallow true
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertTrue();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0600
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with super admin disallow false
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, false, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0700
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0700", Level.LEVEL2, async (done: Function) => {
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(null, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0800
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0800", Level.LEVEL2, async (done: Function) => {
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(undefined, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0900
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with null feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, null, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1000
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with undefined feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, undefined, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1100
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with null disallow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, null, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1200
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with undefined disallow
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, undefined, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1300
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, null);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1400
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1400
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1500
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1500
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId + 10000);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else if (Number(error.code) === 401) {
        expect(Number(error.code) === 401).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1600
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1600
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with user 0
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const userId = 0;
    try {
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, userId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1700
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1700
   * @tc.desc   test restrictions setDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION set then get then reset
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertTrue();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, false, localId);
      ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1800
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1800
   * @tc.desc   test restrictions setDisallowedPolicyForAccount conflict with setDisallowedPolicyForAccount string feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    let localId: number = 100;
    try {
      localId = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertTrue();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, false, localId);
      } catch (error) {
        // do not do anything
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_set_disallowed_policy_for_account_distributed_transmission_1900
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1900
   * @tc.desc   test restrictions setDisallowedPolicyForAccount string feature conflict with FeatureForAccount
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_disallowed_policy_for_account_distributed_transmission_1900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    let localId: number = 100;
    try {
      localId = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, true, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertTrue();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200010).assertTrue();
      }
    } finally {
      try {
        restrictions.setDisallowedPolicyForAccount(SELFWANT, LABEL_DISTRIBUTED_TRANSMISSION, false, localId);
      } catch (error) {
        // do not do anything
      }
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testGetDisallowedForAccountPolicy26() {
  /**
   * @tc.name   test_get_disallowed_policy_for_account_26_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0100
   * @tc.desc   test restrictions getDisallowedPolicyForAccount without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_26_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_26_0200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0200
   * @tc.desc   test restrictions getDisallowedPolicyForAccount with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_26_0200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0300
   * @tc.name      : test_get_disallowed_policy_for_account_26_0300
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount superhub other accountId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_26_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, localId + 1);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else if (Number(error.code) === 401) {
        expect(Number(error.code) === 401).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0400
   * @tc.name      : test_get_disallowed_policy_for_account_26_0400
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount superhub null admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_26_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      console.info(' --- test_get_disallowed_policy_for_account_26_0400  -------- START --------');
      let ret: boolean = restrictions.getDisallowedPolicyForAccount(null, restrictions.FeatureForAccount.SUPER_HUB, localId);
      expect(ret).assertFalse();
    } catch (error) {
      console.info(' --- test_get_disallowed_policy_for_account_26_0400 err.code = ' + error.code);
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
    console.info(' --- test_get_disallowed_policy_for_account_26_0400  -------- END --------');
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0500
   * @tc.name      : test_get_disallowed_policy_for_account_26_0500
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount superhub undefined admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_26_0500", Level.LEVEL2, async (done: Function) => {
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(undefined, restrictions.FeatureForAccount.SUPER_HUB, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0600
   * @tc.name      : test_get_disallowed_policy_for_account_26_0600
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount superhub null feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_26_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, null, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0700
   * @tc.name      : test_get_disallowed_policy_for_account_26_0700
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount superhub undefined feature
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_26_0700", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, undefined, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0800
   * @tc.name      : test_get_disallowed_policy_for_account_26_0800
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount superhub null localId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_26_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, null);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_26_JS_0900
   * @tc.name      : test_get_disallowed_policy_for_account_26_0900
   * @tc.desc      : test restrictions getDisallowedPolicyForAccount superhub undefined localId
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_policy_for_account_26_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number =  await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.SUPER_HUB, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0100
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0100", Level.LEVEL2, async (done: Function) => {
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200001).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0300
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with byod admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 9200002).assertTrue();
      }
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0400
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0400
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with invalid admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0400", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(INVALID_WANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, DEFAULT_USER_ID);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0500
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0500
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0500", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0600
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0600
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with null admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0600", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      let ret: boolean = restrictions.getDisallowedPolicyForAccount(null, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertFalse();
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0700
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0700
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with undefined admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0700", Level.LEVEL2, async (done: Function) => {
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(undefined, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0800
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0800
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with null feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0800", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, null, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_0900
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_0900
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with undefined feature
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_0900", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, undefined, localId);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_1000
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1000
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with null accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_1000", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, null);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_1100
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1100
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with undefined accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_1100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, undefined);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else {
        expect(Number(error.code) === 401).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_1200
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1200
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION with invalid accountId
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_1200", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId + 1);
      expect(false).assertTrue();
    } catch (error) {
      if (Number(error.code) === 801) {
        expect(Number(error.code) === 801).assertTrue();
      } else if (Number(error.code) === 401) {
        expect(Number(error.code) === 401).assertTrue();
      } else {
        expect(Number(error.code) === 9200012).assertTrue();
      }
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_policy_for_account_distributed_transmission_1300
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_POLICY_FOR_ACCOUNT_DISTRIBUTED_TRANSMISSION_JS_1300
   * @tc.desc   test restrictions getDisallowedPolicyForAccount DISTRIBUTED_TRANSMISSION set then get
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_policy_for_account_distributed_transmission_1300", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    let osAccountManager: osAccount.AccountManager = osAccount.getAccountManager();
    try {
      let localId: number = await osAccountManager.getOsAccountLocalId();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, true, localId);
      let ret = restrictions.getDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, localId);
      expect(ret).assertTrue();
      restrictions.setDisallowedPolicyForAccount(SELFWANT, restrictions.FeatureForAccount.DISTRIBUTED_TRANSMISSION, false, localId);
    } catch (error) {
      expect(Number(error.code) === 801).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}
