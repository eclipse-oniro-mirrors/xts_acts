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

import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium'
import baskddkerror from 'libbaskddkerrorcode.so'
import deviceManager from "@ohos.driver.deviceManager";

const Success = 0
const TAG: string = "[HidEmitEventTest]";
export default function UsbDdkTest1() {
  let deviceId: number = -1;
  describe('UsbDdkTest1', () => {
    beforeAll(async () => {
      try {
        let devices: Array<deviceManager.Device> = deviceManager.queryDevices(deviceManager.BusType.USB);
        for (let item of devices) {
          let device: deviceManager.USBDevice = item as deviceManager.USBDevice;
          deviceId = device.deviceId;
          console.info(`Device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
    })
    /**
     * @tc.name   testUSB_DDK_SUCCESS_0100
     * @tc.number SUB_Driver_Ext_USB_DDK_SUCCESS_0100
     * @tc.desc   Test UsbDdkErrCode interface USB_DDK_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUSB_DDK_SUCCESS_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUSB_DDK_SUCCESS_0100 start====");
        let result:number = baskddkerror.ErrcodeTest_001();
        expect(result).assertEqual(Success);
        console.info("====>testUSB_DDK_SUCCESS_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUSB_DDK_SUCCESS_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUSB_DDK_INVALID_PARAMETER_0100
     * @tc.number SUB_Driver_Ext_USB_DDK_INVALID_PARAMETER_0100
     * @tc.desc   Test UsbDdkErrCode interface USB_DDK_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUSB_DDK_INVALID_PARAMETER_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUSB_DDK_INVALID_PARAMETER_0100 start====");
        let result:number = baskddkerror.ErrcodeTest_002();
        expect(result).assertEqual(Success);
        console.info("====>testUSB_DDK_INVALID_PARAMETER_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUSB_DDK_INVALID_PARAMETER_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0100
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0100
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0100 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_001(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0200
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0200
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0200 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_002(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0300
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0300
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0300 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_003(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0400
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0400
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0400 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_004(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0400 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0500
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0500
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0500 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_005(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0600
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0600
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0600 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_006(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0600 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0700
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0700
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0700 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_007(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0700 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0800
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0800
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0800 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_008(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0800 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_0900
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_0900
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_0900', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_0900 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_009(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_0900 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_1000
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_1000
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_1000', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_1000 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_010(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_1000 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_1100
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_1100
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_1100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_1100 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_011(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_1100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_1200
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_1200
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_1200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_1200 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_012(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_1200 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_1300
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_1300
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_1300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_1300 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_013(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_1300 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbDeviceDescriptor_1400
     * @tc.number SUB_Driver_Ext_UsbDeviceDescriptor_1400
     * @tc.desc   Test UsbDeviceDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbDeviceDescriptor_1400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbDeviceDescriptor_1400 start====");
        let result:number = baskddkerror.UsbDeviceDescriptorTest_014(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbDeviceDescriptor_1400 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbDeviceDescriptor_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbConfigDescriptor_0100
     * @tc.number SUB_Driver_Ext_UsbConfigDescriptor_0100
     * @tc.desc   Test UsbConfigDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbConfigDescriptor_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbConfigDescriptor_0100 start====");
        let result:number = baskddkerror.UsbConfigDescriptorTest_001(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbConfigDescriptor_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbConfigDescriptor_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbConfigDescriptor_0200
     * @tc.number SUB_Driver_Ext_UsbConfigDescriptor_0200
     * @tc.desc   Test UsbConfigDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbConfigDescriptor_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbConfigDescriptor_0200 start====");
        let result:number = baskddkerror.UsbConfigDescriptorTest_002(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbConfigDescriptor_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbConfigDescriptor_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbConfigDescriptor_0300
     * @tc.number SUB_Driver_Ext_UsbConfigDescriptor_0300
     * @tc.desc   Test UsbConfigDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbConfigDescriptor_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbConfigDescriptor_0300 start====");
        let result:number = baskddkerror.UsbConfigDescriptorTest_003(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbConfigDescriptor_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbConfigDescriptor_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbConfigDescriptor_0400
     * @tc.number SUB_Driver_Ext_UsbConfigDescriptor_0400
     * @tc.desc   Test UsbConfigDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbConfigDescriptor_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbConfigDescriptor_0400 start====");
        let result:number = baskddkerror.UsbConfigDescriptorTest_004(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbConfigDescriptor_0400 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbConfigDescriptor_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbConfigDescriptor_0500
     * @tc.number SUB_Driver_Ext_UsbConfigDescriptor_0500
     * @tc.desc   Test UsbConfigDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbConfigDescriptor_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbConfigDescriptor_0500 start====");
        let result:number = baskddkerror.UsbConfigDescriptorTest_005(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbConfigDescriptor_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbConfigDescriptor_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbConfigDescriptor_0600
     * @tc.number SUB_Driver_Ext_UsbConfigDescriptor_0600
     * @tc.desc   Test UsbConfigDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbConfigDescriptor_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbConfigDescriptor_0600 start====");
        let result:number = baskddkerror.UsbConfigDescriptorTest_006(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbConfigDescriptor_0600 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbConfigDescriptor_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsbConfigDescriptor_0700
     * @tc.number SUB_Driver_Ext_UsbConfigDescriptor_0700
     * @tc.desc   Test UsbConfigDescriptor struct bLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsbConfigDescriptor_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsbConfigDescriptor_0700 start====");
        let result:number = baskddkerror.UsbConfigDescriptorTest_007(deviceId);
        if (deviceId == -1) {
          expect(result).assertEqual(Success);
        }
        console.info("====>testUsbConfigDescriptor_0700 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsbConfigDescriptor_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   testUsb_DeviceArray_0100
     * @tc.number SUB_Driver_Ext_Usb_DeviceArray_0100
     * @tc.desc   Test Usb_DeviceArray struct num
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUsb_DeviceArray_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testUsb_DeviceArray_0100 start====");
        let result:number = baskddkerror.DeviceArrayTest_001(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>testUsb_DeviceArray_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>testUsb_DeviceArray_0100 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}
