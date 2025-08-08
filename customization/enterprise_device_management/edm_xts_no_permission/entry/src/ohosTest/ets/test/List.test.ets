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
import browserManagerTest from './browser/browser.test.ets';
import bluetoothManagerTest from './bluetoothManager/bluetoothManager.test.ets';
import securityManagerTest from './securityManager/securityManager.test';
import deviceSettingsTest from './deviceSettings/deviceSettings.test';
import deviceInfoTest from './deviceInfo/deviceInfo.test';
import accountManagerTest from './accountManager/accountManager.test.ets';
import adminManagerTest from './adminManager/adminManager.test.ets';
import applicationManagerTest from './applicationManager/applicationManager.test.ets'
import bundleManagerTest from './bundleManager/bundleManager.test.ets';
import networkManagerTest from './networkManager/networkManager.test';
import restrictionsTest from './restrictions/restrictions.test';
import systemManagerTest from './systemManager/systemManager.test';
import wifiManagerTest from './wifiManager/wifiManager.test';
import deviceControlTest from './deviceControl/deviceControl.test.ets';
import locationManagerTest from './locationManager/locationManager.test.ets';
import usbManagerTest from './usbManager/usbManager.test.ets';
import telephonyManagerTest from './telephonyManager/telephonyManager.test.ets';

export default function testsuite() {
  networkManagerTest();
  systemManagerTest();
  wifiManagerTest();
  deviceControlTest();
  locationManagerTest();
  usbManagerTest();
  browserManagerTest();
  bluetoothManagerTest();
  securityManagerTest();
  deviceSettingsTest();
  deviceInfoTest();
  accountManagerTest();
  adminManagerTest();
  applicationManagerTest();
  bundleManagerTest();
  restrictionsTest();
  telephonyManagerTest();
}