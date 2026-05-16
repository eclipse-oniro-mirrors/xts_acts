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
import { ENTINFO1, INVALID_WANT, SELFHAPNAME, SELFWANT, DEFAULT_USER_ID, getErrorCode } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import bluetoothManager from '@ohos.enterprise.bluetoothManager';
import deviceSettings from '@ohos.enterprise.deviceSettings';
import wifiManager from '@ohos.enterprise.wifiManager';
import restrictions from '@ohos.enterprise.restrictions';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { inputMethod } from '@kit.IMEKit';

const ITEM_SCREEN_OFF: string = 'screenOff';
const ITEM_POWER_POLICY: string = 'powerPolicy';
const ITEM_DATE_TIME: string = 'dateTime';
const ITEM_EYE_COMFORT: string = 'eyeComfort';
const ITEM_DEFAULT_INPUT_METHOD: string = 'defaultInputMethod';

const KEY_INVALID: number = 999;
const STATUS_INVALID: number = 999;
const LABEL_WIFI = "wifi";
const LABEL_BLUETOOTH = "bluetooth";
const LABEL_NFC = "nfc";

const VALID_MENUS_TO_HIDE: Array<deviceSettings.SettingsMenu> = [
  deviceSettings.SettingsMenu.ACCOUNT_ID,
  deviceSettings.SettingsMenu.WIFI
];

const FULL_VALID_MENUS_TO_HIDE: Array<deviceSettings.SettingsMenu> = [
  deviceSettings.SettingsMenu.ACCOUNT_ID,
  deviceSettings.SettingsMenu.WIFI,
  deviceSettings.SettingsMenu.WIFI_PROXY_SETTINGS,
  deviceSettings.SettingsMenu.WIFI_IP_SETTINGS,
  deviceSettings.SettingsMenu.BLUETOOTH,
  deviceSettings.SettingsMenu.NETWORK,
  deviceSettings.SettingsMenu.MOBILE_NETWORK,
  deviceSettings.SettingsMenu.SUPER_DEVICE,
  deviceSettings.SettingsMenu.MORE_CONNECTIVITY_OPTIONS,
  deviceSettings.SettingsMenu.HOME_SCREEN_STYLE,
  deviceSettings.SettingsMenu.DISPLAY_BRIGHTNESS,
  deviceSettings.SettingsMenu.SOUND_VIBRATION,
  deviceSettings.SettingsMenu.NOTIFICATIONS,
  deviceSettings.SettingsMenu.BIOMETRICS_PASSWORD,
  deviceSettings.SettingsMenu.APPS_AND_SERVICES,
  deviceSettings.SettingsMenu.BATTERY,
  deviceSettings.SettingsMenu.STORAGE,
  deviceSettings.SettingsMenu.PRIVACY_AND_SECURITY,
  deviceSettings.SettingsMenu.DIGITAL_BALANCE,
  deviceSettings.SettingsMenu.SMART_ASSISTANT,
  deviceSettings.SettingsMenu.ACCESSIBILITY,
  deviceSettings.SettingsMenu.SYSTEM,
  deviceSettings.SettingsMenu.ABOUT_DEVICE,
  deviceSettings.SettingsMenu.SYSTEM_NAVIGATION,
  deviceSettings.SettingsMenu.LANGUAGE_REGION,
  deviceSettings.SettingsMenu.INPUT_METHODS,
  deviceSettings.SettingsMenu.DATE_TIME,
  deviceSettings.SettingsMenu.DATA_CLONE,
  deviceSettings.SettingsMenu.BACKUP_SETTINGS,
  deviceSettings.SettingsMenu.RESET,
  deviceSettings.SettingsMenu.SUPERHUB,
  deviceSettings.SettingsMenu.USER_EXPERIENCE,
  deviceSettings.SettingsMenu.SCREEN_CAST,
  deviceSettings.SettingsMenu.PRINTERS_SCANNERS,
  deviceSettings.SettingsMenu.MOBILE_DATA,
  deviceSettings.SettingsMenu.PERSONAL_HOTSPOT,
  deviceSettings.SettingsMenu.SIM_MANAGEMENT,
  deviceSettings.SettingsMenu.AIRPLANE_MODE,
  deviceSettings.SettingsMenu.MANAGE_DATA_USAGE,
  deviceSettings.SettingsMenu.VPN_SETTINGS,
  deviceSettings.SettingsMenu.TEXT_DISPLAY_SIZE,
  deviceSettings.SettingsMenu.APP_DUPLICATOR,
  deviceSettings.SettingsMenu.SEARCH
];

const INVALID_MENU: deviceSettings.SettingsMenu = 999 as deviceSettings.SettingsMenu;
const INVALID_MENUS_TO_HIDE: Array<deviceSettings.SettingsMenu> = [INVALID_MENU];

export default function deviceSettingsTest() {
  describe('deviceSettings_test', () => {
    /**
     * @tc.name   test_device_settings_get_value_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0100
     * @tc.desc   test deviceSettings getValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0300
     * @tc.desc   test deviceSettings getValue unsupported item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValue(SELFWANT, '123');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0400
     * @tc.desc   test deviceSettings getValue, item = screenOff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(result).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0500
     * @tc.desc   test deviceSettings getValue, item = powerPolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_POWER_POLICY);
        expect(JSON.parse(result)).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0600
     * @tc.desc   test deviceSettings getValue with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValue(null, ITEM_SCREEN_OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0700
     * @tc.desc   test deviceSettings getValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0700", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.getValue(SELFWANT, ITEM_EYE_COMFORT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0800
     * @tc.desc   test deviceSettings getValue with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.getValue(SELFWANT, ITEM_EYE_COMFORT);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_0900
     * @tc.desc   test deviceSettings getValue, item = eyeComfort
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_EYE_COMFORT, 'on');
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_EYE_COMFORT);
        expect(result).assertEqual('on');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_JS_1000
     * @tc.desc   test deviceSettings getValue with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValue(null, ITEM_EYE_COMFORT);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0100
     * @tc.desc   test deviceSettings setValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0300
     * @tc.desc   test deviceSettings setValue unsupported item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, '123', '30000');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0400
     * @tc.desc   test deviceSettings setValue, item = screenOff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '30000');
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_SCREEN_OFF);
        expect(result == '30000').assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0500
     * @tc.desc   test deviceSettings setValue, item = screenOff, time overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_SCREEN_OFF, '1234567891023687999710');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0600
     * @tc.desc   test deviceSettings setValue, item = dateTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let time = new Date().getTime().toString();
        let ret = deviceSettings.setValue(SELFWANT, ITEM_DATE_TIME, time);
        expect(ret == null).assertTrue();
      } catch (error) {
        expect(false).assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0700
     * @tc.desc   test deviceSettings setValue, item = dateTime, time overflow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DATE_TIME, '12345678910236879997100');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0800
     * @tc.desc   test deviceSettings setValue, item = powerPolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerPolicy: deviceSettings.PowerPolicy = {
          powerPolicyAction: deviceSettings.PowerPolicyAction.AUTO_SUSPEND,
          delayTime: 30000
        }
        let powerScene: deviceSettings.PowerScene = deviceSettings.PowerScene.TIME_OUT;
        let value: string = JSON.stringify({
          powerScene: powerScene,
          powerPolicy: powerPolicy
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_POWER_POLICY);
        expect(JSON.parse(result)).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_0900
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, error powerPolicy undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerScene: deviceSettings.PowerScene = deviceSettings.PowerScene.TIME_OUT;
        let value: string = JSON.stringify({
          powerScene: powerScene,
          powerPolicy: undefined
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1000
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, empty value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, '');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1100
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, error value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, JSON.stringify({
          test: 1,
          testKey: '123'
        }));
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1200
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, lost powerScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerPolicy: deviceSettings.PowerPolicy = {
          powerPolicyAction: deviceSettings.PowerPolicyAction.AUTO_SUSPEND,
          delayTime: 30000
        }
        let value: string = JSON.stringify({
          powerPolicy: powerPolicy
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1300
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, lost powerPolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let powerScene: deviceSettings.PowerScene = deviceSettings.PowerScene.TIME_OUT;
        let value: string = JSON.stringify({
          powerScene: powerScene,
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1400
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, error powerScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let value: string = JSON.stringify({
          powerScene: '0',
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1500
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, error powerPolicy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let value: string = JSON.stringify({
          powerPolicy: '123456'
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1600
     * @tc.desc   test deviceSettings setValue, item = powerPolicy, error powerPolicy and powerScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let value: string = JSON.stringify({
          powerPolicy: '123456',
          powerScene: '0'
        });
        deviceSettings.setValue(SELFWANT, ITEM_POWER_POLICY, value);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1700
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1700
     * @tc.desc   test deviceSettings setValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1700", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setValue(SELFWANT, ITEM_EYE_COMFORT, 'on');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1800
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1800
     * @tc.desc   test deviceSettings setValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_EYE_COMFORT, 'on');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_1900
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_1900
     * @tc.desc   test deviceSettings setValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_1900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_EYE_COMFORT, 'off');
        let result: string = deviceSettings.getValue(SELFWANT, ITEM_EYE_COMFORT);
        expect(result).assertEqual('off');
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_2000
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_2000
     * @tc.desc   test deviceSettings setValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_2000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_EYE_COMFORT, 'onoff111');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_2001
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_2001
     * @tc.desc   test deviceSettings setValue without active admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_2001", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DEFAULT_INPUT_METHOD, 'com.example.inputmethod');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_2002
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_2002
     * @tc.desc   test deviceSettings setValue with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_2002", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DEFAULT_INPUT_METHOD, 'com.example.inputmethod');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_2003
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_2003
     * @tc.desc   test deviceSettings setValue without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_2003", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setValue(null, ITEM_DEFAULT_INPUT_METHOD, 'com.example.inputmethod');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_2004
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_2004
     * @tc.desc   test deviceSettings setValue with error param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_2004", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DEFAULT_INPUT_METHOD, 'com.example.inputmethod');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_2005
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_JS_2005
     * @tc.desc   test deviceSettings setValue with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_2005", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let bundleName = inputMethod.getCurrentInputMethod().name;
        let ret = deviceSettings.setValue(SELFWANT, ITEM_DEFAULT_INPUT_METHOD, bundleName);
        expect(ret == null).assertTrue();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
    
    /**
     * @tc.name   test_device_settings_set_home_wall_paper_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0100
     * @tc.desc   test deviceSettings set home wall paper with out admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_home_wall_paper_0100", Level.LEVEL2, async (done: Function) => {
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setHomeWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200001).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_set_home_wall_paper_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0200
     * @tc.desc   test deviceSettings set home wall paper with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_home_wall_paper_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setHomeWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200002).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_set_home_wall_paper_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_HOME_WALL_PAPER_JS_0300
     * @tc.desc   test deviceSettings set home wall paper with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_home_wall_paper_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let filePath: string = getContext().resourceDir + '/101mb.bmp';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setHomeWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_set_unlock_wall_paper_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0100
     * @tc.desc   test deviceSettings set unlock wall paper with out admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_unlock_wall_paper_0100", Level.LEVEL2, async (done: Function) => {
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setUnlockWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200001).assertTrue();
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_set_unlock_wall_paper_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0200
     * @tc.desc   test deviceSettings set unlock wall paper with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_unlock_wall_paper_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      let filePath: string = getContext().resourceDir + '/wallpaper.png';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setUnlockWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        expect(error.code == 9200002).assertTrue();
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_set_unlock_wall_paper_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_UNLOCK_WALL_PAPER_JS_0300
     * @tc.desc   test deviceSettings set unlock wall paper with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_unlock_wall_paper_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let filePath: string = getContext().resourceDir + '/101mb.bmp';
      let fd: number = fs.openSync(filePath, fs.OpenMode.READ_ONLY).fd;
      await deviceSettings.setUnlockWallpaper(SELFWANT, fd).then(() => {
      }).catch((error: BusinessError) => {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 9200012).assertTrue();
        }
      }).finally(async () => {
        await adminManager.disableAdmin(SELFWANT);
      });
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_for_account_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0100
     * @tc.desc   test deviceSettings getValueForAccount without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_for_account_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_for_account_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0300
     * @tc.desc   test deviceSettings getValueForAccount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_for_account_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceSettings.getValueForAccount(SELFWANT,
          deviceSettings.SettingsItem.DEVICE_NAME, 100);
        expect(result).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_for_account_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0400
     * @tc.desc   test deviceSettings getValueForAccount with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_for_account_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValueForAccount(null, deviceSettings.SettingsItem.DEVICE_NAME, 100);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_for_account_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0500
     * @tc.desc   test deviceSettings getValueForAccount with accountId is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_for_account_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, -1);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  
    /**
     * @tc.name   test_device_settings_get_value_for_account_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0600
     * @tc.desc   test deviceSettings getValueForAccount with accountId is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_for_account_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 0);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_get_value_for_account_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_VALUE_FOR_ACCOUNT_JS_0700
     * @tc.desc   test deviceSettings getValueForAccount not support item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_value_for_account_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValueForAccount(SELFWANT, -1, 100);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  
    /**
     * @tc.name   test_device_settings_set_value_for_account_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0100
     * @tc.desc   test deviceSettings setValueForAccount without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100, 'deviceName');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
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
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100, 'deviceName');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_for_account_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0300
     * @tc.desc   test deviceSettings setValueForAccount with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValueForAccount(null, deviceSettings.SettingsItem.DEVICE_NAME, 100, 'deviceName');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  
    /**
     * @tc.name   test_device_settings_set_value_for_account_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0400
     * @tc.desc   test deviceSettings setValueForAccount with accountId is -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, -1, 'deviceName');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  
    /**
     * @tc.name   test_device_settings_set_value_for_account_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0500
     * @tc.desc   test deviceSettings setValueForAccount with accountId is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 0, 'deviceName');
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  
    /**
     * @tc.name   test_device_settings_set_value_for_account_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0600
     * @tc.desc   test deviceSettings setValueForAccount, deviceName is too long
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let deviceName: string =
          'test1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111';
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100, deviceName);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_for_account_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0700
     * @tc.desc   test deviceSettings setValueForAccount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      let nameBefore: string = deviceSettings.getValueForAccount(SELFWANT,
        deviceSettings.SettingsItem.DEVICE_NAME, 100);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100, 'deviceName');
        let result: string = deviceSettings.getValueForAccount(SELFWANT,
          deviceSettings.SettingsItem.DEVICE_NAME, 100);
        expect(result).assertEqual('deviceName');
      } catch (error) {
        expect().assertFail();
      } finally {
        if (nameBefore != "") {
          deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, 100, nameBefore);
        }
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_value_for_account_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_VALUE_FOR_ACCOUNT_JS_0800
     * @tc.desc   test deviceSettings setValueForAccount not support item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_value_for_account_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValueForAccount(SELFWANT, -1, 100, 'test');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   setValue_test_001
     * @tc.number setValue_test_001
     * @tc.desc   setValue with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValue_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValue_test_001  -------- START --------');
      try {
        deviceSettings.setValue(null, ITEM_DEFAULT_INPUT_METHOD, 'bundleName');
        console.info(' --- setValue_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValue_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValue_test_001  -------- END --------');
    })


    /**
     * @tc.name   setValue_test_002
     * @tc.number setValue_test_002
     * @tc.desc   setValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValue_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValue_test_002  -------- START --------');
      try {
        deviceSettings.setValue(undefined, ITEM_DEFAULT_INPUT_METHOD, 'bundleName');
        console.info(' --- setValue_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValue_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValue_test_002  -------- END --------');
    })

    /**
     * @tc.name   setValue_test_003
     * @tc.number setValue_test_003
     * @tc.desc   setValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValue_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValue_test_003  -------- START --------');
      try {
        deviceSettings.setValue(SELFWANT, null, 'bundleName');
        console.info(' --- setValue_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValue_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValue_test_003  -------- END --------');
    })

    /**
     * @tc.name   setValue_test_004
     * @tc.number setValue_test_004
     * @tc.desc   setValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValue_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValue_test_004  -------- START --------');
      try {
        deviceSettings.setValue(SELFWANT, undefined, 'bundleName');
        console.info(' --- setValue_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValue_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValue_test_004  -------- END --------');
    })

    /**
     * @tc.name   setValue_test_005
     * @tc.number setValue_test_005
     * @tc.desc   setValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValue_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValue_test_005  -------- START --------');
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DEFAULT_INPUT_METHOD, null);
        console.info(' --- setValue_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValue_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValue_test_005  -------- END --------');
    })

    /**
     * @tc.name   setValue_test_006
     * @tc.number setValue_test_006
     * @tc.desc   setValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValue_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValue_test_006  -------- START --------');
      try {
        deviceSettings.setValue(SELFWANT, ITEM_DEFAULT_INPUT_METHOD, undefined);
        console.info(' --- setValue_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValue_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValue_test_006  -------- END --------');
    })

    /**
     * @tc.name   getValue_test_001
     * @tc.number getValue_test_001
     * @tc.desc   getValue with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValue_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValue_test_001  -------- START --------');
      try {
        deviceSettings.getValue(null, ITEM_EYE_COMFORT);
        console.info(' --- getValue_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValue_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValue_test_001  -------- END --------');
    })


    /**
     * @tc.name   getValue_test_002
     * @tc.number getValue_test_002
     * @tc.desc   getValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValue_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValue_test_002  -------- START --------');
      try {
        deviceSettings.getValue(undefined, ITEM_EYE_COMFORT);
        console.info(' --- getValue_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValue_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValue_test_002  -------- END --------');
    })

    /**
     * @tc.name   getValue_test_003
     * @tc.number getValue_test_003
     * @tc.desc   getValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValue_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValue_test_003  -------- START --------');
      try {
        deviceSettings.getValue(SELFWANT, null);
        console.info(' --- getValue_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValue_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValue_test_003  -------- END --------');
    })

    /**
     * @tc.name   getValue_test_004
     * @tc.number getValue_test_004
     * @tc.desc   getValue with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValue_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValue_test_004  -------- START --------');
      try {
        deviceSettings.getValue(SELFWANT, undefined);
        console.info(' --- getValue_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValue_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValue_test_004  -------- END --------');
    })

    /**
     * @tc.name   setHomeWallpaper_test_001
     * @tc.number setHomeWallpaper_test_001
     * @tc.desc   setHomeWallpaper with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_001  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(null, DEFAULT_USER_ID);
        console.info(' --- setHomeWallpaper_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_001  -------- END --------');
    })


    /**
     * @tc.name   setHomeWallpaper_test_002
     * @tc.number setHomeWallpaper_test_002
     * @tc.desc   setHomeWallpaper with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_002  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(undefined, DEFAULT_USER_ID);
        console.info(' --- setHomeWallpaper_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_002  -------- END --------');
    })


    /**
     * @tc.name   setHomeWallpaper_test_003
     * @tc.number setHomeWallpaper_test_003
     * @tc.desc   setHomeWallpaper with null parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_003  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(SELFWANT, null);
        console.info(' --- setHomeWallpaper_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_003  -------- END --------');
    })


    /**
     * @tc.name   setHomeWallpaper_test_004
     * @tc.number setHomeWallpaper_test_004
     * @tc.desc   setHomeWallpaper with undefined parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_004  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(SELFWANT, undefined);
        console.info(' --- setHomeWallpaper_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_004  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_001
     * @tc.number setUnlockWallpaper_test_001
     * @tc.desc   setUnlockWallpaper with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_001  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(null, DEFAULT_USER_ID);
        console.info(' --- setUnlockWallpaper_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_001  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_002
     * @tc.number setUnlockWallpaper_test_002
     * @tc.desc   setUnlockWallpaper with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_002  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(undefined, DEFAULT_USER_ID);
        console.info(' --- setUnlockWallpaper_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_002  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_003
     * @tc.number setUnlockWallpaper_test_003
     * @tc.desc   setUnlockWallpaper with null parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_003  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(SELFWANT, null);
        console.info(' --- setUnlockWallpaper_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_003  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_004
     * @tc.number setUnlockWallpaper_test_004
     * @tc.desc   setUnlockWallpaper with undefined parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_004  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(SELFWANT, undefined);
        console.info(' --- setUnlockWallpaper_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_004  -------- END --------');
    })


    /**
     * @tc.name   setValueForAccount_test_001
     * @tc.number setValueForAccount_test_001
     * @tc.desc   setValueForAccount with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValueForAccount_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValueForAccount_test_001  -------- START --------');
      try {
        deviceSettings.setValueForAccount(null, deviceSettings.SettingsItem.DEVICE_NAME, DEFAULT_USER_ID, 'deviceName');
        console.info(' --- setValueForAccount_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValueForAccount_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValueForAccount_test_001  -------- END --------');
    })


    /**
     * @tc.name   setValueForAccount_test_002
     * @tc.number setValueForAccount_test_002
     * @tc.desc   setValueForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValueForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValueForAccount_test_002  -------- START --------');
      try {
        deviceSettings.setValueForAccount(undefined, deviceSettings.SettingsItem.DEVICE_NAME, DEFAULT_USER_ID, 'deviceName');
        console.info(' --- setValueForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValueForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValueForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   setValueForAccount_test_003
     * @tc.number setValueForAccount_test_003
     * @tc.desc   setValueForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValueForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValueForAccount_test_003  -------- START --------');
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, null, 'deviceName');
        console.info(' --- setValueForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValueForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValueForAccount_test_003  -------- END --------');
    })

    /**
     * @tc.name   setValueForAccount_test_004
     * @tc.number setValueForAccount_test_004
     * @tc.desc   setValueForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValueForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValueForAccount_test_004  -------- START --------');
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, undefined, 'deviceName');
        console.info(' --- setValueForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValueForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValueForAccount_test_004  -------- END --------');
    })

    /**
     * @tc.name   setValueForAccount_test_005
     * @tc.number setValueForAccount_test_005
     * @tc.desc   setValueForAccount with null parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValueForAccount_test_005", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValueForAccount_test_005  -------- START --------');
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, DEFAULT_USER_ID, null);
        console.info(' --- setValueForAccount_test_005 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValueForAccount_test_005 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValueForAccount_test_005  -------- END --------');
    })

    /**
     * @tc.name   setValueForAccount_test_006
     * @tc.number setValueForAccount_test_006
     * @tc.desc   setValueForAccount with undefined parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValueForAccount_test_006", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValueForAccount_test_006  -------- START --------');
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, DEFAULT_USER_ID, undefined);
        console.info(' --- setValueForAccount_test_006 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValueForAccount_test_006 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setValueForAccount_test_006  -------- END --------');
    })

    /**
     * @tc.name   setValueForAccount_test_007
     * @tc.number setValueForAccount_test_007
     * @tc.desc   setValueForAccount with undefined parameter value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setValueForAccount_test_007", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setValueForAccount_test_007  -------- START --------');
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, DEFAULT_USER_ID, '');
        console.info(' --- setValueForAccount_test_007 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setValueForAccount_test_007 error 9200001 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
      console.info(' --- setValueForAccount_test_007  -------- END --------');
    })

    /**
     * @tc.name   getValueForAccount_test_001
     * @tc.number getValueForAccount_test_001
     * @tc.desc   getValueForAccount with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValueForAccount_test_001", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValueForAccount_test_001  -------- START --------');
      try {
        deviceSettings.getValueForAccount(null, deviceSettings.SettingsItem.DEVICE_NAME, DEFAULT_USER_ID);
        console.info(' --- getValueForAccount_test_001 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValueForAccount_test_001 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValueForAccount_test_001  -------- END --------');
    })


    /**
     * @tc.name   getValueForAccount_test_002
     * @tc.number getValueForAccount_test_002
     * @tc.desc   getValueForAccount with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValueForAccount_test_002", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValueForAccount_test_002  -------- START --------');
      try {
        deviceSettings.getValueForAccount(undefined, deviceSettings.SettingsItem.DEVICE_NAME, DEFAULT_USER_ID);
        console.info(' --- getValueForAccount_test_002 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValueForAccount_test_002 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValueForAccount_test_002  -------- END --------');
    })


    /**
     * @tc.name   getValueForAccount_test_003
     * @tc.number getValueForAccount_test_003
     * @tc.desc   getValueForAccount with null parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValueForAccount_test_003", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValueForAccount_test_003  -------- START --------');
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, null);
        console.info(' --- getValueForAccount_test_003 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValueForAccount_test_003 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValueForAccount_test_003  -------- END --------');
    })


    /**
     * @tc.name   getValueForAccount_test_004
     * @tc.number getValueForAccount_test_004
     * @tc.desc   getValueForAccount with undefined parameter accountId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("getValueForAccount_test_004", Level.LEVEL2, async (done: Function) => {
      console.info(' --- getValueForAccount_test_004  -------- START --------');
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.DEVICE_NAME, undefined);
        console.info(' --- getValueForAccount_test_004 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- getValueForAccount_test_004 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- getValueForAccount_test_004  -------- END --------');
    })

    /**
     * @tc.name   setHomeWallpaper_test_029
     * @tc.number setHomeWallpaper_test_029
     * @tc.desc   setHomeWallpaper with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_029  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(null, DEFAULT_USER_ID);
        console.info(' --- setHomeWallpaper_test_029 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_029  -------- END --------');
    })


    /**
     * @tc.name   setHomeWallpaper_test_030
     * @tc.number setHomeWallpaper_test_030
     * @tc.desc   setHomeWallpaper with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_030  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(undefined, DEFAULT_USER_ID);
        console.info(' --- setHomeWallpaper_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_030  -------- END --------');
    })


    /**
     * @tc.name   setHomeWallpaper_test_031
     * @tc.number setHomeWallpaper_test_031
     * @tc.desc   setHomeWallpaper with null parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_031  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(SELFWANT, null);
        console.info(' --- setHomeWallpaper_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_031  -------- END --------');
    })


    /**
     * @tc.name   setHomeWallpaper_test_032
     * @tc.number setHomeWallpaper_test_032
     * @tc.desc   setHomeWallpaper with undefined parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setHomeWallpaper_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setHomeWallpaper_test_032  -------- START --------');
      try {
        deviceSettings.setHomeWallpaper(SELFWANT, undefined);
        console.info(' --- setHomeWallpaper_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setHomeWallpaper_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setHomeWallpaper_test_032  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_029
     * @tc.number setUnlockWallpaper_test_029
     * @tc.desc   setUnlockWallpaper with null parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_029", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_029  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(null, DEFAULT_USER_ID);
        console.info(' --- setUnlockWallpaper_test_029 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_029 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_029  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_030
     * @tc.number setUnlockWallpaper_test_030
     * @tc.desc   setUnlockWallpaper with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_030", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_030  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(undefined, DEFAULT_USER_ID);
        console.info(' --- setUnlockWallpaper_test_030 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_030 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_030  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_031
     * @tc.number setUnlockWallpaper_test_031
     * @tc.desc   setUnlockWallpaper with null parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_031", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_031  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(SELFWANT, null);
        console.info(' --- setUnlockWallpaper_test_031 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_031 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_031  -------- END --------');
    })


    /**
     * @tc.name   setUnlockWallpaper_test_032
     * @tc.number setUnlockWallpaper_test_032
     * @tc.desc   setUnlockWallpaper with undefined parameter fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("setUnlockWallpaper_test_032", Level.LEVEL2, async (done: Function) => {
      console.info(' --- setUnlockWallpaper_test_032  -------- START --------');
      try {
        deviceSettings.setUnlockWallpaper(SELFWANT, undefined);
        console.info(' --- setUnlockWallpaper_test_032 error is expected, but it done.');
        expect(false).assertTrue();
      } catch (error) {
        console.info(' --- setUnlockWallpaper_test_032 error 401 is expected, actually catch: ' + error.code);
        expect(Number(error.code) === 401).assertTrue();
      }
      done();
      console.info(' --- setUnlockWallpaper_test_032  -------- END --------');
    })

    /**
 	      * @tc.name   test_device_settings_get_floating_navigation_0100
 	      * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_FLOATING_NAVIGATION_JS_0100
 	      * @tc.desc   test deviceSettings getFloatingNavigatio without admin
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
    it("test_device_settings_get_floating_navigation_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100);
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
     * @tc.name   test_device_settings_get_floating_navigation_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_FLOATING_NAVIGATION_JS_0200
     * @tc.desc   test deviceSettings getFloatingNavigatio with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_floating_navigation_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.getValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100);
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
     * @tc.name   test_device_settings_get_floating_navigation_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_FLOATING_NAVIGATION_JS_0300
     * @tc.desc   test deviceSettings getFloatingNavigation with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_floating_navigation_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getValueForAccount(null, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100);
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
     * @tc.name   test_device_settings_set_floating_navigation_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_FLOATING_NAVIGATION_JS_0100
     * @tc.desc   test deviceSettings setFloatingNavigation without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_floating_navigation_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100, '0');
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
     * @tc.name   test_device_settings_set_floating_navigation_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_FLOATING_NAVIGATION_JS_0200
     * @tc.desc   test deviceSettings setFloatingNavigation with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_floating_navigation_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100, '0');
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
     * @tc.name   test_device_settings_set_floating_navigation_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_FLOATING_NAVIGATION_JS_0300
     * @tc.desc   test deviceSettings setFloatingNavigation, Incorrect parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_floating_navigation_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100, '2');
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
     * @tc.name   test_device_settings_set_floating_navigation_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_FLOATING_NAVIGATION_JS_0400
     * @tc.desc   test deviceSettings setFloatingNavigation with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_floating_navigation_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValueForAccount(null, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100, '0');
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
     * @tc.name   test_device_settings_set_floating_navigation_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_FLOATING_NAVIGATION_JS_0500
     * @tc.desc   test deviceSettings setFloatingNavigation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_floating_navigation_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100, '0');
        let result: string = deviceSettings.getValueForAccount(SELFWANT,
          deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100);
        expect(result).assertEqual('0');
        deviceSettings.setValueForAccount(SELFWANT, deviceSettings.SettingsItem.FLOATING_NAVIGATION, 100, '1');
      } catch (err) {
        const errorCode = getErrorCode(err);
        expect(errorCode === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_add_hidden_settings_menu_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0100
     * @tc.desc   test add hidden settings menu without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0101
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0101
     * @tc.desc   test add hidden settings menu with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0101", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0102
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0102
     * @tc.desc   test add hidden settings menu with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0102", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.addHiddenSettingsMenu(INVALID_WANT, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0103
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0103
     * @tc.desc   test add hidden settings menu with empty data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0103", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, []);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0104
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0104
     * @tc.desc   test add hidden settings menu with invalid hidden item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0104", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, INVALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0105
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0105
     * @tc.desc   test add hidden settings menu success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0105", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, FULL_VALID_MENUS_TO_HIDE);
        const addResultList: Array<number> = deviceSettings.getHiddenSettingsMenu(SELFWANT) as Array<number>;
        const result = FULL_VALID_MENUS_TO_HIDE.every(menu => addResultList.includes(menu as number));
        expect(result).assertTrue();
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, FULL_VALID_MENUS_TO_HIDE);
        const removeResultList: Array<number> = deviceSettings.getHiddenSettingsMenu(SELFWANT) as Array<number>;
        expect(removeResultList.length).assertEqual(0);
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
    
    /**
     * @tc.name   test_device_settings_add_hidden_settings_menu_0106
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0106
     * @tc.desc   test add hidden settings menu with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0106", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.addHiddenSettingsMenu(null, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0107
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0107
     * @tc.desc   test add hidden settings menu with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0107", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.addHiddenSettingsMenu(undefined, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0108
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0108
     * @tc.desc   test add hidden settings menu with null parameter settings menu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0108", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, null);
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
     * @tc.name   test_device_settings_add_hidden_settings_menu_0109
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_ADD_HIDDEN_SETTINGS_MENU_JS_0109
     * @tc.desc   test add hidden settings menu with undefined parameter settings menu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_add_hidden_settings_menu_0109", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.addHiddenSettingsMenu(SELFWANT, undefined);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0100
     * @tc.desc   test remove hidden settings menu without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0101
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0101
     * @tc.desc   test remove hidden settings menu with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0101", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0102
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0102
     * @tc.desc   test remove hidden settings menu with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0102", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.removeHiddenSettingsMenu(INVALID_WANT, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0103
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0103
     * @tc.desc   test remove hidden settings menu with invalid hidden item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0103", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, INVALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0104
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0104
     * @tc.desc   test remove hidden settings menu with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0104", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.removeHiddenSettingsMenu(null, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0105
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0105
     * @tc.desc   test remove hidden settings menu with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0105", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.removeHiddenSettingsMenu(undefined, VALID_MENUS_TO_HIDE);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0106
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0106
     * @tc.desc   test remove hidden settings menu with null parameter settings menu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0106", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, null);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0107
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0107
     * @tc.desc   test remove hidden settings menu with undefined parameter settings menu
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0107", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, undefined);
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
     * @tc.name   test_device_settings_remove_hidden_settings_menu_0108
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_REMOVE_HIDDEN_SETTINGS_MENU_JS_0108
     * @tc.desc   test remove hidden settings menu with empty data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_remove_hidden_settings_menu_0108", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.removeHiddenSettingsMenu(SELFWANT, []);
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
     * @tc.name   test_device_settings_get_hidden_settings_menu_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_HIDDEN_SETTINGS_MENU_JS_0100
     * @tc.desc   test get hidden settings menu without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_hidden_settings_menu_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.getHiddenSettingsMenu(SELFWANT);
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
     * @tc.name   test_device_settings_get_hidden_settings_menu_0101
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_HIDDEN_SETTINGS_MENU_JS_0101
     * @tc.desc   test get hidden settings menu with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_hidden_settings_menu_0101", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.getHiddenSettingsMenu(SELFWANT);
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
     * @tc.name   test_device_settings_get_hidden_settings_menu_0102
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_HIDDEN_SETTINGS_MENU_JS_0102
     * @tc.desc   test get hidden settings menu with invalid admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_hidden_settings_menu_0102", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getHiddenSettingsMenu(INVALID_WANT);
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
     * @tc.name   test_device_settings_get_hidden_settings_menu_0103
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_HIDDEN_SETTINGS_MENU_JS_0103
     * @tc.desc   test get hidden settings menu with null admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_hidden_settings_menu_0103", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.getHiddenSettingsMenu(null);
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
     * @tc.name   test_device_settings_get_hidden_settings_menu_0104
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_GET_HIDDEN_SETTINGS_MENU_JS_0104
     * @tc.desc   test get hidden settings menu with undefined parameter admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_get_hidden_settings_menu_0104", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.getHiddenSettingsMenu(undefined);
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

    let sleep = (timeout: number): Promise<ESObject> => {
      return new Promise(resolve => {
        const st =setTimeout(() => {
          resolve(null);
          clearTimeout(st);
        }, timeout);
      });
    };

    /**
     * @tc.name   test_device_settings_set_switch_status_0100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0100
     * @tc.desc   test deviceSettings setSwitchStatus without admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0100", Level.LEVEL2, async (done: Function) => {
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.BLUETOOTH, deviceSettings.SwitchStatus.OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0200
     * @tc.desc   test deviceSettings setSwitchStatus with null admin parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(null, deviceSettings.SwitchKey.NEARLINK, deviceSettings.SwitchStatus.OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0300
     * @tc.desc   test deviceSettings setSwitchStatus with null key parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, null, deviceSettings.SwitchStatus.OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0400
     * @tc.desc   test deviceSettings setSwitchStatus with null status parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.NEARLINK, null);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0500
     * @tc.desc   test deviceSettings setSwitchStatus with undefined admin parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(undefined, deviceSettings.SwitchKey.WIFI, deviceSettings.SwitchStatus.ON);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0600
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0600
     * @tc.desc   test deviceSettings setSwitchStatus with undefined key parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, undefined, deviceSettings.SwitchStatus.ON);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0700
     * @tc.desc   test deviceSettings setSwitchStatus with undefined status parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.WIFI, undefined);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0800
     * @tc.desc   test deviceSettings setSwitchStatus with normal admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.WIFI, deviceSettings.SwitchStatus.ON);
        await sleep(3000);
        await adminManager.disableAdmin(SELFWANT);
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        let result: boolean = wifiManager.isWifiActiveSync(SELFWANT);
        expect(result === true).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_0900
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_0900
     * @tc.desc   test deviceSettings setSwitchStatus with invalid key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_0900", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, KEY_INVALID, deviceSettings.SwitchStatus.OFF);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_1000
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_1000
     * @tc.desc   test deviceSettings setSwitchStatus with invalid status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_1000", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.WIFI, STATUS_INVALID);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200012).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_1100
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_1100
     * @tc.desc   test deviceSettings setSwitchStatus with already disallowed policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_1100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, true);
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.WIFI, deviceSettings.SwitchStatus.ON);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 203).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_1200
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_1200
     * @tc.desc   test deviceSettings setSwitchStatus with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_1200", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.WIFI, deviceSettings.SwitchStatus.OFF);
        await sleep(3000);
        let result: boolean = wifiManager.isWifiActiveSync(SELFWANT);
        expect(result === false).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_1300
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_1300
     * @tc.desc   test deviceSettings setSwitchStatus with byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_1300", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.WIFI, deviceSettings.SwitchStatus.ON);
        await adminManager.disableAdmin(SELFWANT);
        await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
        await sleep(3000);
        let result: boolean = wifiManager.isWifiActiveSync(SELFWANT);
        expect(result === true).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_1400
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_1400
     * @tc.desc   test deviceSettings setSwitchStatus with byod admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_1400", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.BLUETOOTH, deviceSettings.SwitchStatus.FORCE_ON);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_1500
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_1500
     * @tc.desc   test deviceSettings setSwitchStatus with super admin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_1500", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.BLUETOOTH, deviceSettings.SwitchStatus.FORCE_ON);
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_BLUETOOTH, true);
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.BLUETOOTH, deviceSettings.SwitchStatus.FORCE_ON);
        expect(false).assertTrue();
      } catch (error) {
        expect(Number(error.code) === 203).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_1600
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_JS_1600
     * @tc.desc   test deviceSettings setSwitchStatus with force on bluetooth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_1600", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.BLUETOOTH, deviceSettings.SwitchStatus.FORCE_ON);
        await sleep(3000);
        let result: bluetoothManager.BluetoothInfo = bluetoothManager.getBluetoothInfo(SELFWANT);
        expect(Number(result.state) === 2).assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_nfc_0700
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_NFC_0700
     * @tc.desc   test deviceSettings setSwitchStatus with NFC using super admin with disallowed policy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_nfc_0700", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        restrictions.setDisallowedPolicy(SELFWANT, LABEL_NFC, true);
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.NFC, deviceSettings.SwitchStatus.ON);
        expect(false).assertTrue();
      } catch (error) {
        if (Number(error.code) === 801) {
          expect(Number(error.code) === 801).assertTrue();
        } else {
          expect(Number(error.code) === 203).assertTrue();
        }
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.name   test_device_settings_set_switch_status_nfc_0800
     * @tc.number SUB_CUSTOMIZATION_EDM_DEVICE_SETTINGS_SET_SWITCH_STATUS_NFC_0800
     * @tc.desc   test deviceSettings setSwitchStatus with NFC using invalid status
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("test_device_settings_set_switch_status_nfc_0800", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceSettings.setSwitchStatus(SELFWANT, deviceSettings.SwitchKey.NFC, STATUS_INVALID);
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
  })
}