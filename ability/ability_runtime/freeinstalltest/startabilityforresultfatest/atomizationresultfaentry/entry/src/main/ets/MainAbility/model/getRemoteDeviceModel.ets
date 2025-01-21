/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import deviceManager from '@ohos.distributedDeviceManager';
import { BusinessError } from '@ohos.base'

export default class RemoteDeviceModel {
  deviceList = [];
  deviceManager;

  constructor() {
  }

  registerDeviceListCallback() {
    if (typeof (this.deviceManager) === 'undefined') {
      console.log('[dmsDemo] deviceManager.createDeviceManager begin');
      let self = this;
      try {
        self.deviceManager = deviceManager.createDeviceManager('com.ohos.distributedmusicplayer');
        self.registerDeviceListCallback_();
      } catch(err) {
        let e: BusinessError = err as BusinessError;
        console.error('createDeviceManager errCode:' + e.code + ',errMessage:' + e.message);
        return;
      }
      console.log('[dmsDemo] deviceManager.createDeviceManager end');
    } else {
      this.registerDeviceListCallback_();
    }
  }

  registerDeviceListCallback_(){
    console.info('[dmsDemo] registerDeviceListCallback');
    if (this.deviceManager == undefined) {
      console.error('[dmsDemo] deviceManager has not initialized');
      return;
    }

    try {
      console.info('[dmsDemo] getTrustedDeviceListSync begin');
      let list: Array<deviceManager.DeviceBasicInfo> = this.deviceManager.getAvailableDeviceListSync();
      console.info('[dmsDemo] getTrustedDeviceListSync end, deviceList=' + JSON.stringify(list));
      if (typeof (list) != 'undefined' && typeof (list.length) != 'undefined') {
        this.deviceList = list;
      }
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error('getAvailableDeviceListSync errCode:' + e.code + ',errMessage:' + e.message);
      return;
    }
    console.info('[dmsDemo] callback finished');
  }

  unregisterDeviceListCallback() {
    console.info('[dmsDemo] stopDeviceDiscovery');
    try {
      this.deviceManager.stopDiscovering();
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error('stopDiscovering errCode:' + e.code + ',errMessage:' + e.message);
    }
    this.deviceList = [];
  }
}