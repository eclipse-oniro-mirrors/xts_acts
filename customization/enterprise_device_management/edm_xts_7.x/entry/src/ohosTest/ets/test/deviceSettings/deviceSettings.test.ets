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
import { ENTINFO1, INVALID_WANT, SELFHAPNAME, SELFWANT, DEFAULT_USER_ID, getErrorCode } from '../commom.test.ets';

import adminManager from '@ohos.enterprise.adminManager';
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
    
  })
}