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

import { describe, expect, beforeAll, afterAll, it, TestType, Size, Level } from '@ohos/hypium'
import hidEmitEvent from 'libhidemiteventndk.so'
import deviceManager from "@ohos.driver.deviceManager";


const TAG: string = "[HidCanIUseTest]";
const DEVICE_NOSUPPORT_ERRINFO: string = "The device does not support or cannot find hid_ddk_service;";
const HID_DDK_SUCCESS: number = 0;
const HID_DDK_INVALID_PARAMETER: number = 401;
const HID_DDK_TIMEOUT: number = 27300004;
const HID_DDK_INIT_ERROR: number = 27300005;
const HID_DDK_SERVICE_ERROR: number = 27300006;
const HID_DDK_MEMORY_ERROR: number  = 27300007;
const HID_DDK_IO_ERROR: number = 27300008;
const HID_DDK_DEVICE_NOT_FOUND: number = 27300009;

function IsDevcieSupport(errCode: number, caseName: string) {
  if (errCode == -3) {
    console.info(TAG, `Test result ${caseName} : ${DEVICE_NOSUPPORT_ERRINFO}`);
    expect('undefined').assertEqual(DEVICE_NOSUPPORT_ERRINFO);
  }
}

export default function HidCanIUseTest() {
  let deviceId: number = -1;
  describe('HidCanIUseTest', () => {

    beforeAll(async () => {
      try {
        console.info(`before queryDevices`)
        let devices: Array<deviceManager.Device> = deviceManager.queryDevices(deviceManager.BusType.USB);
        console.info(`after queryDevices`)
        for (let item of devices) {
          console.info(`enter for`)
          let device: deviceManager.USBDevice = item as deviceManager.USBDevice;
          if ((device.vendorId == 0x2109 && device.productId == 0x888b) ||
            (device.vendorId == 0xbda && device.productId == 0x8153) ||
            (!hidEmitEvent.isHidDevice(device.deviceId))) {
            console.info(`Device vid = ${device.vendorId} pid = ${device.productId}, is not hid device`);
            continue;
          }
          deviceId = device.deviceId;
          console.info(`Hid device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
      console.log(TAG, '*************hid Unit HidCanIUseTest start*************');
    })

    afterAll(async () => {
      console.log(TAG, '*************hid Unit HidCanIUseTest end*************');
    })

    /**
     * @tc.name   testHIDCanIUse0100
     * @tc.number SUB_Driver_Ext_HIDCanIUse_0100
     * @tc.desc   OH_Hid_CanIUse testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHIDCanIUse0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let flag = canIUse("SystemCapability.Driver.HID.Extension");
      expect(flag).assertEqual(false);
      done();
    });
  })
}
