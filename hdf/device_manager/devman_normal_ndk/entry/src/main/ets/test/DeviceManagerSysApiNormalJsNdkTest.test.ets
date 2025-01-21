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

import { beforeAll, afterAll, describe, it, expect } from "@ohos/hypium"
import usbManager from "@ohos.usbManager"
import deviceManager from '@ohos.driver.deviceManager'


export default function DeviceManagerSysApiNormalJsNdkTest() {
  describe('DeviceManagerSysApiNormalJsNdkTest', () => {

    const TAG: string = "[DeviceManagerSysApiNormalJsNdkTest]";
    const SYSTEMAPI_DENIED_CODE = 202;
    const TEST_DEVICE_ID = 0;
    const TEST_DRIVER_UID = 'testDriverUid';

    let deviceNum = 0;
    const isDeviceConnected = done => {
      if (deviceNum > 0) {
        console.info("Test USB device is connected");
          return true;
      }
      console.info("Test USB device is not connected");
      expect(true).assertTrue();
      if (typeof(done) === 'function') {
        done();
      }
      return false;
    }
    
    beforeAll(async () => {
      console.log('*************DeviceManager Unit DeviceManagerSysApiNormalJsNdkTest Begin*************');
        try {
          let devicesList = usbManager.getDevices();
          if (Array.isArray(devicesList)) {
            deviceNum = devicesList.length;
          }
        } catch (err) {
          console.error(TAG, `getDevices failed, message is ${err.message}`);
        }
    })

    afterAll(function () {
      console.log('*************DeviceManager Unit DeviceManagerSysApiNormalJsNdkTest End*************');
    })

    /**
     * @tc.number     : SUB_Driver_Ext_DevManSysApiNormal_0100
     * @tc.name       : testSystemApiQueryDeviceInfoNormal001
     * @tc.desc       : verify SystemApi of queryDeviceInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSystemApiQueryDeviceInfoNormal001', 0, (done: Function) => {
      console.info('----------------------testSystemApiQueryDeviceInfoNormal001---------------------------');
      if (!isDeviceConnected(done)) {
        return;
      }
      try {
        let deviceInfos = deviceManager.queryDeviceInfo(TEST_DEVICE_ID);
        expect(deviceInfos === null).assertTrue();
        done();
      } catch (err) {
        console.info(TAG, 'testSystemApiQueryDeviceInfoNormal001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(SYSTEMAPI_DENIED_CODE);
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DevManSysApiNormal_0100
     * @tc.name       : testSystemApiQueryDriverInfoNormal001
     * @tc.desc       : verify SystemApi of queryDriverInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('testSystemApiQueryDriverInfoNormal001', 0, (done: Function) => {
      console.info('----------------------testSystemApiQueryDriverInfoNormal001---------------------------');
      if (!isDeviceConnected(done)) {
        return;
      }
      try {
        let deviceInfos = deviceManager.queryDriverInfo(TEST_DRIVER_UID);
        expect(deviceInfos === null).assertTrue();
        done();
      } catch (err) {
        console.info(TAG, 'testSystemApiQueryDriverInfoNormal001 catch err code: ',
          err.code, ', message: ', err.message);
        expect(err.code).assertEqual(SYSTEMAPI_DENIED_CODE);
        done();
      }
    });

  })
}
