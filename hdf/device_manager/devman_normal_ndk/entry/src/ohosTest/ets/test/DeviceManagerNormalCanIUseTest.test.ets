/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeAll, afterAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import usbManager from "@ohos.usbManager"
import deviceManager from '@ohos.driver.deviceManager'


export default function DeviceManagerNormalCanIUseTest() {
  describe('DeviceManagerNormalCanIUseTest', () => {

    const TAG: string = "[DeviceManagerNormalCanIUseTest]";
    const SYSTEMAPI_DENIED_CODE = 202;
    const TEST_DEVICE_ID = 0;
    const TEST_DRIVER_UID = 'testDriverUid';

    let deviceNum = 0;
    const isDeviceConnected = (done:Function) => {
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

    afterAll( ()=> {
      console.log('*************DeviceManager Unit DeviceManagerSysApiNormalJsNdkTest End*************');
    })

    /**
     * @tc.name   testDeviceManagerNormalCanIUsek001
     * @tc.number SUB_Driver_Ext_DeviceManagerNormalCanIUse_0100
     * @tc.desc   verify DeviceManagerCanIUse any device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeviceManagerNormalCanIUsek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (done: Function) => {
        console.info(TAG, '----------------------testDeviceManagerNormalCanIUsek001---------------------------');
        let flag = canIUse("SystemCapability.Driver.ExternalDevice");
        expect(flag).assertEqual(false);
        done();
    })
})
}
