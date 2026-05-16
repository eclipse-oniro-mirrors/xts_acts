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
import { ENTINFO1, SELFHAPNAME, SELFWANT, getErrorCode } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import deviceSettings from '@ohos.enterprise.deviceSettings';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';

const ITEM_SCREEN_OFF: string = 'screenOff';
const ITEM_POWER_POLICY: string = 'powerPolicy';
const ITEM_DATE_TIME: string = 'dateTime';
const ITEM_EYE_COMFORT: string = 'eyeComfort';
const ITEM_DEFAULT_INPUT_METHOD: string = 'defaultInputMethod';

const VALID_MENUS_TO_HIDE: Array<deviceSettings.SettingsMenu> = [
  deviceSettings.SettingsMenu.ACCOUNT_ID,
  deviceSettings.SettingsMenu.WIFI
];

export default function deviceSettingsTest() {
  describe('deviceSettings_test', () => {
    /**
     * @tc.name   test_device_settings_get_value_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0100
     * @tc.desc   test deviceSettings getValue with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0200
     * @tc.desc   test deviceSettings getValue with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.getValue(SELFWANT, ITEM_EYE_COMFORT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0100
     * @tc.desc   test deviceSettings setValue with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0200
     * @tc.desc   test deviceSettings setValue with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_EYE_COMFORT, 'on');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0300
     * @tc.desc   test deviceSettings setValue with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DEFAULT_INPUT_METHOD, 'com.example.inputmethod');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_home_wall_paper_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0200
     * @tc.desc   test deviceSettings set home wall paper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_home_wall_paper_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setHomeWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 201).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_set_unlock_wall_paper_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0200
     * @tc.desc   test deviceSettings set unlock wall paper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_unlock_wall_paper_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setUnlockWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 201).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_for_account_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0100
     * @tc.desc   test deviceSettings getValueForAccount with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_for_account_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_for_account_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0100
     * @tc.desc   test deviceSettings setValueForAccount with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100, 'deviceName');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

   /**
    * @tc.name   test_device_settings_set_value_for_account_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0200
    * @tc.desc   test deviceSettings setValueForAccount with normal admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_device_settings_set_value_for_account_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100, '0');
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });
 	 
   /**
    * @tc.name   test_device_settings_get_value_for_account_0200
    * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0200
    * @tc.desc   test deviceSettings getValueForAccount with normal admin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("test_device_settings_get_value_for_account_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_add_hidden_settings_menu_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0100
     * @tc.desc   test add hidden settings menu with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0100
     * @tc.desc   test remove hidden settings menu with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_hidden_settings_menu_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_HIDDEN_SETTINGS_MENU_JS_0100
     * @tc.desc   test get hidden settings menu with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_hidden_settings_menu_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.getHiddenSettingsMenu(SELFWANT);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0100
     * @tc.desc   test deviceSettings setSwitchStatus with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.WIFI, deviceSettings.SwitchStatus.ON);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_nfc_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_NFC_0100
     * @tc.desc   test deviceSettings setSwitchStatus with NFC using normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_nfc_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.NFC, deviceSettings.SwitchStatus.ON);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 201).assertTrue();
        }
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });
  })
}