/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import usbNoPerDdk from 'libusbddkndk.so'
import deviceManager from "@ohos.driver.deviceManager";


export default function usbNoPerCanIUseTest() {
  describe('usbNoPerCanIUseTest', () => {

    const TAG: string = "[usbNoPerCanIUseTest]";
    const DDK_ERR_NOPERM: number = 201;
    const USB_DDK_FAILED: number = -1;
    let deviceId: number = -1;

    beforeAll(async () => {
      console.log(TAG, '*************hid Unit usbNoPerCanIUseTest start*************');
      try {
        let devices: Array<deviceManager.Device> = deviceManager.queryDevices(deviceManager.BusType.USB);
        for (let item of devices) {
          let device: deviceManager.USBDevice = item as deviceManager.USBDevice;
          deviceId = device.deviceId;
          console.info(TAG, `Device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(TAG, `Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
    })

    afterAll(async () => {
      console.log(TAG, '*************hid Unit usbNoPerCanIUseTest end*************');
    })

    /**
     * @tc.name   testUsbNoPerCanIUse001
     * @tc.number SUB_Driver_Ext_USBNoPerCanIUse_0100
     * @tc.desc   OH_Usb_NoPerCanIUse face testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbNoPerCanIUse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let flag = canIUse("SystemCapability.Driver.USB.Extension");
      expect(flag).assertEqual(false);
      done();
    });
  })
}
