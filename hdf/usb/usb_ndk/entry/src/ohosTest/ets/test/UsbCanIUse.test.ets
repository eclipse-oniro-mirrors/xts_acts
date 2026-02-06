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

import { beforeAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import usbDdk from 'libusbddkndk.so'
import deviceManager from "@ohos.driver.deviceManager";

export default function usbCanIUseTest() {
  let dev: number = -1;
  let deviceId: number = -1;

  describe('usbCanIUseTest', () => {

    const TAG: string = "[usbCanIUseTest]";
    const USB_DDK_SUCCESS: number = 0;
    const USB_DDK_FAILED: number = -1;
    const USB_DDK_INVALID_PARAMETER: number = 401;
    const USB_DDK_INVALID_OPERATION: number = 27400002;
    const SCSIPERIPHERAL_DDK_NO_PERM: number = 201;
    const SCSIPERIPHERAL_DDK_INVALID_PARAMETER: number = 401;
    const SCSIPERIPHERAL_DDK_SUCCESS: number = 31700000;
    const SCSIPERIPHERAL_DDK_MEMORY_ERROR: number = 31700001;
    const SCSIPERIPHERAL_DDK_INVALID_OPERATION: number = 31700002;
    const SCSIPERIPHERAL_DDK_IO_ERROR: number = 31700003;
    const SCSIPERIPHERAL_DDK_TIMEOUT: number = 31700004;
    const SCSIPERIPHERAL_DDK_INIT_ERROR: number = 31700005;
    const SCSIPERIPHERAL_DDK_SERVICE_ERROR: number = 31700006;
    const SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND: number = 31700007;
    const USB_SERIAL_DDK_INVALID_PARAMETER: number = 401;
    const USB_SERIAL_DDK_SUCCESS: number = 31600000;
    const USB_SERIAL_DDK_INVALID_OPERATION: number = 31600001;
    const USB_SERIAL_DDK_INIT_ERROR: number = 31600002;
    const USB_SERIAL_DDK_SERVICE_ERROR: number = 31600003;
    const USB_SERIAL_DDK_MEMORY_ERROR: number = 31600004;
    const USB_SERIAL_DDK_IO_ERROR: number = 31600005;
    const USB_SERIAL_DDK_DEVICE_NOT_FOUND: number = 31600006;

    beforeAll(async () => {
      try {
        let devices: Array<deviceManager.Device> = deviceManager.queryDevices(deviceManager.BusType.USB);
        for (let item of devices) {
          let device: deviceManager.USBDevice = item as deviceManager.USBDevice;
          dev = device.deviceId;
          console.info(`Device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
    })

    /**
     * @tc.name   testUsbCanIUse001
     * @tc.number SUB_Driver_Ext_USBCanIUse_0100
     * @tc.desc   OH_Usb_CanIUse Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbCanIUse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let flag = canIUse("SystemCapability.Driver.USB.Extension");
      expect(flag).assertEqual(false);
      done();
    });
  })
}

