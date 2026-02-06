/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

export default function usbDdkTest() {
  let dev: number = -1;
  let deviceId: number = -1;

  describe('UsbDdkTest', () => {

    const TAG: string = "[usbDdkNdkJsTest]";
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
     * @tc.name   testUsbInit001
     * @tc.number SUB_Driver_Ext_DDKETS_0100
     * @tc.desc   OH_Usb_Init Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let data = usbDdk.usbInit();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(USB_DDK_SUCCESS);
      done()
    });

    /**
     * @tc.name   testUsbRelease001
     * @tc.number SUB_Driver_Ext_DDKETS_0200
     * @tc.desc   OH_Usb_Release Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data = usbDdk.usbRelease();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(1);
      done()
    });

    /**
     * @tc.name   testUsbReleaseResource001
     * @tc.number SUB_Driver_Ext_DDKETS_3800
     * @tc.desc   OH_Usb_ReleaseResource Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbReleaseResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let data = usbDdk.usbReleaseResource();
      console.info("Test USB data Result = " + data);
      expect(data).assertEqual(USB_DDK_SUCCESS);
      done()
    });

    /**
     * @tc.name   testUsbGetDeviceDescriptor001
     * @tc.number SUB_Driver_Ext_DDKETS_0300
     * @tc.desc   OH_Usb_GetDeviceDescriptor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetDeviceDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info("Test USB dev = " + dev);
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetDeviceDescriptorOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbGetDeviceDescriptor002
     * @tc.number SUB_Driver_Ext_DDKETS_0400
     * @tc.desc   OH_Usb_GetDeviceDescriptor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbGetDeviceDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetDeviceDescriptorTwo(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbGetConfigDescriptor001
     * @tc.number SUB_Driver_Ext_DDKETS_0500
     * @tc.desc   OH_Usb_GetConfigDescriptor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetConfigDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetConfigDescriptorOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbGetConfigDescriptor002
     * @tc.number SUB_Driver_Ext_DDKETS_0600
     * @tc.desc   OH_Usb_GetConfigDescriptor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbGetConfigDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetConfigDescriptorTwo();
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_OPERATION);
        done()
      }
    });

    /**
     * @tc.name   testUsbGetConfigDescriptor003
     * @tc.number SUB_Driver_Ext_DDKETS_0700
     * @tc.desc   OH_Usb_GetConfigDescriptor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbGetConfigDescriptor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetConfigDescriptorThree(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbFreeConfigDescriptor001
     * @tc.number SUB_Driver_Ext_DDKETS_0800
     * @tc.desc   OH_Usb_FreeConfigDescriptor Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbFreeConfigDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbFreeConfigDescriptor(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(1);
        done()
      }
    });

    /**
     * @tc.name   testUsbClaimInterface001
     * @tc.number SUB_Driver_Ext_DDKETS_0900
     * @tc.desc   OH_Usb_ClaimInterface Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbClaimInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbClaimInterfaceOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbClaimInterface002
     * @tc.number SUB_Driver_Ext_DDKETS_1000
     * @tc.desc   OH_Usb_ClaimInterface Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbClaimInterface002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbClaimInterfaceTwo();
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_OPERATION);
        done()
      }
    });

    /**
     * @tc.name   testUsbClaimInterface003
     * @tc.number SUB_Driver_Ext_DDKETS_1100
     * @tc.desc   OH_Usb_ClaimInterface Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbClaimInterface003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbClaimInterfaceThree(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbReleaseInterface001
     * @tc.number SUB_Driver_Ext_DDKETS_1200
     * @tc.desc   OH_Usb_ReleaseInterface Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbReleaseInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbReleaseInterface(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbSelectInterfaceSetting001
     * @tc.number SUB_Driver_Ext_DDKETS_1300
     * @tc.desc   OH_Usb_SelectInterfaceSetting Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSelectInterfaceSetting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSelectInterfaceSettingOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbSelectInterfaceSetting002
     * @tc.number SUB_Driver_Ext_DDKETS_1400
     * @tc.desc   OH_Usb_SelectInterfaceSetting Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbSelectInterfaceSetting002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSelectInterfaceSettingTwo(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_OPERATION);
        done()
      }
    });

    /**
     * @tc.name   testUsbGetCurrentInterfaceSetting001
     * @tc.number SUB_Driver_Ext_DDKETS_1500
     * @tc.desc   OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetCurrentInterfaceSetting001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetCurrentInterfaceSettingOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbGetCurrentInterfaceSetting002
     * @tc.number SUB_Driver_Ext_DDKETS_1600
     * @tc.desc   OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetCurrentInterfaceSetting002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetCurrentInterfaceSettingTwo(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_OPERATION);
        done()
      }
    });

    /**
     * @tc.name   testUsbGetCurrentInterfaceSetting003
     * @tc.number SUB_Driver_Ext_DDKETS_1700
     * @tc.desc   OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbGetCurrentInterfaceSetting003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbGetCurrentInterfaceSettingThree(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlReadRequest001
     * @tc.number SUB_Driver_Ext_DDKETS_1800
     * @tc.desc   OH_Usb_SendControlReadRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendControlReadRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlReadRequestOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlReadRequest002
     * @tc.number SUB_Driver_Ext_DDKETS_1900
     * @tc.desc   OH_Usb_SendControlReadRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbSendControlReadRequest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlReadRequestTwo(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_OPERATION);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlReadRequest003
     * @tc.number SUB_Driver_Ext_DDKETS_2000
     * @tc.desc   OH_Usb_SendControlReadRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbSendControlReadRequest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlReadRequestThree(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlReadRequest004
     * @tc.number SUB_Driver_Ext_DDKETS_2100
     * @tc.desc   OH_Usb_SendControlReadRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbSendControlReadRequest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlReadRequestFour(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlReadRequest005
     * @tc.number SUB_Driver_Ext_DDKETS_2200
     * @tc.desc   OH_Usb_SendControlReadRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbSendControlReadRequest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlReadRequestFive(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlWriteRequest001
     * @tc.number SUB_Driver_Ext_DDKETS_2300
     * @tc.desc   OH_Usb_SendControlWriteRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendControlWriteRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlWriteRequestOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlWriteRequest002
     * @tc.number SUB_Driver_Ext_DDKETS_2400
     * @tc.desc   OH_Usb_SendControlWriteRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbSendControlWriteRequest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlWriteRequestTwo(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_OPERATION);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlWriteRequest003
     * @tc.number SUB_Driver_Ext_DDKETS_2500
     * @tc.desc   OH_Usb_SendControlWriteRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUsbSendControlWriteRequest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlWriteRequestThree(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlWriteRequest004
     * @tc.number SUB_Driver_Ext_DDKETS_2600
     * @tc.desc   OH_Usb_SendControlWriteRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendControlWriteRequest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlWriteRequestFour(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendControlWriteRequest005
     * @tc.number SUB_Driver_Ext_DDKETS_3900
     * @tc.desc   OH_Usb_SendControlWriteRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendControlWriteRequest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendControlWriteRequestFive(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequest001
     * @tc.number SUB_Driver_Ext_DDKETS_2700
     * @tc.desc   OH_Usb_SendPipeRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendPipeRequestOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequest002
     * @tc.number SUB_Driver_Ext_DDKETS_2800
     * @tc.desc   OH_Usb_SendPipeRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendPipeRequestTwo(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_OPERATION);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequest003
     * @tc.number SUB_Driver_Ext_DDKETS_2900
     * @tc.desc   OH_Usb_SendPipeRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendPipeRequestThree(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequest004
     * @tc.number SUB_Driver_Ext_DDKETS_3000
     * @tc.desc   OH_Usb_SendPipeRequest Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbSendPipeRequestFour(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbCreateDeviceMemMap001
     * @tc.number SUB_Driver_Ext_DDKETS_3100
     * @tc.desc   OH_Usb_CreateDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbCreateDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbCreateDeviceMemMapOne(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_SUCCESS);
        done()
      }
    });

    /**
     * @tc.name   testUsbCreateDeviceMemMap002
     * @tc.number SUB_Driver_Ext_DDKETS_3200
     * @tc.desc   OH_Usb_CreateDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbCreateDeviceMemMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbCreateDeviceMemMapTwo(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(USB_DDK_INVALID_PARAMETER);
        done()
      }
    });

    /**
     * @tc.name   testUsbDestroyDeviceMemMap001
     * @tc.number SUB_Driver_Ext_DDKETS_3300
     * @tc.desc   OH_Usb_DestroyDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbDestroyDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (dev < 0) {
        console.info("Test USB device not connected");
        expect(dev).assertEqual(USB_DDK_FAILED);
        done()
      } else {
        let data = usbDdk.usbDestroyDeviceMemMap(dev);
        console.info("Test USB data Result = " + data);
        expect(data).assertEqual(1);
        done()
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequestWithAshmem001
     * @tc.number SUB_Driver_Ext_DDKETS_3400
     * @tc.desc   OH_Usb_SendPipeRequestWithAshmem Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequestWithAshmem001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSendPipeRequestWithAshmem001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbSendPipeRequestWithAshmemOne(dev);
        console.info("Test Result testUsbSendPipeRequestWithAshmem001 : " + ret);
        expect(ret).assertEqual(USB_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestWithAshmem001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequestWithAshmem002
     * @tc.number SUB_Driver_Ext_DDKETS_3500
     * @tc.desc   OH_Usb_SendPipeRequestWithAshmem Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequestWithAshmem002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSendPipeRequestWithAshmem002---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbSendPipeRequestWithAshmemTwo(dev);
        console.info("Test Result testUsbSendPipeRequestWithAshmem002 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestWithAshmem002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequestWithAshmem003
     * @tc.number SUB_Driver_Ext_DDKETS_3600
     * @tc.desc   OH_Usb_SendPipeRequestWithAshmem Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequestWithAshmem003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSendPipeRequestWithAshmem003---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbSendPipeRequestWithAshmemThree(dev);
        console.info("Test Result testUsbSendPipeRequestWithAshmem003 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestWithAshmem003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSendPipeRequestWithAshmem004
     * @tc.number SUB_Driver_Ext_DDKETS_3700
     * @tc.desc   OH_Usb_SendPipeRequestWithAshmem Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSendPipeRequestWithAshmem004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSendPipeRequestWithAshmem004---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbSendPipeRequestWithAshmemFour(dev);
        console.info("Test Result testUsbSendPipeRequestWithAshmem004 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestWithAshmem004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbGetDevices001
     * @tc.number SUB_Driver_Ext_DDK_0600
     * @tc.desc   OH_Usb_GetDevices Interface testing,return USB_DDK_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetDevices001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbGetDevices001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        const ret = usbDdk.usbGetDevicesOne(dev);
        console.info("Test Result testUsbGetDevices001 : " + ret);
        expect(ret).assertEqual(USB_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetDevices001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbGetDevices002
     * @tc.number SUB_Driver_Ext_DDK_0700
     * @tc.desc   OH_Usb_GetDevices Interface testing,return USB_DDK_INVALID_OPERATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetDevices002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbGetDevices002---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        const ret = usbDdk.usbGetDevicesTwo(dev);
        console.info("Test Result testUsbGetDevices002 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetDevices002 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbGetDevices003
     * @tc.number SUB_Driver_Ext_DDK_0800
     * @tc.desc   OH_Usb_GetDevices Interface testing,return USB_DDK_INVALID_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetDevices003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbGetDevices003---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        const ret = usbDdk.usbGetDevicesThree(dev);
        console.info("Test Result testUsbGetDevices003 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetDevices003 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInit001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0100
     * @tc.desc   OH_ScsiPeripheral_Init Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInit001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralInitOne();
        console.info("Test Result testScsiPeripheralInit001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInit001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRelease001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0200
     * @tc.desc   OH_ScsiPeripheral_Release Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRelease001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralReleaseOne();
        console.info("Test Result testScsiPeripheralRelease001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRelease001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRelease002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0300
     * @tc.desc   OH_ScsiPeripheral_Release Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralRelease002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRelease002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralReleaseTwo();
        console.info("Test Result testScsiPeripheralRelease002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRelease002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0400
     * @tc.desc   OH_ScsiPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenOne(deviceId);
        console.info("Test Result testScsiPeripheralOpen001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0500
     * @tc.desc   OH_ScsiPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenTwo(deviceId);
        console.info("Test Result testScsiPeripheralOpen002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0600
     * @tc.desc   OH_ScsiPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenThree(deviceId);
        console.info("Test Result testScsiPeripheralOpen003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0700
     * @tc.desc   OH_ScsiPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenFour(deviceId);
        console.info("Test Result testScsiPeripheralOpen004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen005
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0800
     * @tc.desc   OH_SCSIPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenFive(deviceId);
        console.info("Test Result testScsiPeripheralOpen005 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen006
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_0900
     * @tc.desc   OH_SCSIPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen006---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenSix(deviceId);
        console.info("Test Result testScsiPeripheralOpen006 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen006 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen007
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1000
     * @tc.desc   OH_SCSIPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen007---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenSeven(deviceId);
        console.info("Test Result testScsiPeripheralOpen007 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen007 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen008
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1100
     * @tc.desc   OH_SCSIPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen008---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenEight(deviceId);
        console.info("Test Result testScsiPeripheralOpen008 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen008 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralOpen009
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1200
     * @tc.desc   OH_SCSIPeripheral_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralOpen009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen009---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralOpenNine(deviceId);
        console.info("Test Result testScsiPeripheralOpen009 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen009 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralClose001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1300
     * @tc.desc   OH_ScsiPeripheral_Close Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralClose001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralCloseOne(deviceId);
        console.info("Test Result testScsiPeripheralClose001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralClose001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralClose002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1400
     * @tc.desc   OH_ScsiPeripheral_Close Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralClose002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralCloseTwo(deviceId);
        console.info("Test Result testScsiPeripheralClose002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralClose002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralClose003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1500
     * @tc.desc   OH_ScsiPeripheral_Close Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralClose003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralCloseThree(deviceId);
        console.info("Test Result testScsiPeripheralClose003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralClose003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralReadCapacity001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1600
     * @tc.desc   OH_ScsiPeripheral_ReadCapacity10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralReadCapacity001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadCapacityOne(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralReadCapacity002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1700
     * @tc.desc   OH_ScsiPeripheral_ReadCapacity10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralReadCapacity002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadCapacityTwo(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralReadCapacity003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1800
     * @tc.desc   OH_ScsiPeripheral_ReadCapacity10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralReadCapacity003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadCapacityThree(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralReadCapacity004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_1900
     * @tc.desc   OH_SCSIPeripheral_ReadCapacity10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralReadCapacity004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadCapacityFour(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralReadCapacity005
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2000
     * @tc.desc   OH_SCSIPeripheral_ReadCapacity10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralReadCapacity005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadCapacityFive(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity005 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralReadCapacity006
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2100
     * @tc.desc   OH_SCSIPeripheral_ReadCapacity10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralReadCapacity006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity006---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadCapacitySix(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity006 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity006 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralReadCapacity007
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2200
     * @tc.desc   OH_SCSIPeripheral_ReadCapacity10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralReadCapacity007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity007---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadCapacitySeven(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity007 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity007 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralTestUnitReady001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2300
     * @tc.desc   OH_ScsiPeripheral_TestUnitReady Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralTestUnitReady001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralTestUnitReady001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralTestUnitReadyOne(deviceId);
        console.info("Test Result testScsiPeripheralTestUnitReady001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralTestUnitReady001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralTestUnitReady002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2400
     * @tc.desc   OH_ScsiPeripheral_TestUnitReady Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralTestUnitReady002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralTestUnitReady002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralTestUnitReadyTwo(deviceId);
        console.info("Test Result testScsiPeripheralTestUnitReady002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralTestUnitReady002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralTestUnitReady003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2500
     * @tc.desc   OH_ScsiPeripheral_TestUnitReady Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralTestUnitReady003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralTestUnitReady003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralTestUnitReadyThree(deviceId);
        console.info("Test Result testScsiPeripheralTestUnitReady003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralTestUnitReady003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralTestUnitReady004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2600
     * @tc.desc   OH_SCSIPeripheral_TestUnitReady Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralTestUnitReady004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralTestUnitReady004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralTestUnitReadyFour(deviceId);
        console.info("Test Result testScsiPeripheralTestUnitReady004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralTestUnitReady004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralTestUnitReady005
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2700
     * @tc.desc   OH_SCSIPeripheral_TestUnitReady Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralTestUnitReady005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralTestUnitReady005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralTestUnitReadyFive(deviceId);
        console.info("Test Result testScsiPeripheralTestUnitReady005 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralTestUnitReady005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2800
     * @tc.desc   OH_ScsiPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralInquiry001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquiryOne(deviceId);
        console.info("Test Result testScsiPeripheralInquiry001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_2900
     * @tc.desc   OH_ScsiPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralInquiry002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquiryTwo(deviceId);
        console.info("Test Result testScsiPeripheralInquiry002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3000
     * @tc.desc   OH_ScsiPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralInquiry003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquiryThree(deviceId);
        console.info("Test Result testScsiPeripheralInquiry003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3100
     * @tc.desc   OH_SCSIPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralInquiry004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquiryFour(deviceId);
        console.info("Test Result testScsiPeripheralInquiry004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry005
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3200
     * @tc.desc   OH_SCSIPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralInquiry005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquiryFive(deviceId);
        console.info("Test Result testScsiPeripheralInquiry005 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry006
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3300
     * @tc.desc   OH_SCSIPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralInquiry006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry006---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquirySix(deviceId);
        console.info("Test Result testScsiPeripheralInquiry006 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry006 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry007
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3400
     * @tc.desc   OH_SCSIPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralInquiry007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry007---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquirySeven(deviceId);
        console.info("Test Result testScsiPeripheralInquiry007 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry007 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralInquiry008
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3500
     * @tc.desc   OH_SCSIPeripheral_Inquiry Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralInquiry008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry008---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralInquiryEight(deviceId);
        console.info("Test Result testScsiPeripheralInquiry008 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry008 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRequestSense001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3600
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralRequestSense001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRequestSense001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralRequestSenseOne(deviceId);
        console.info("Test Result testScsiPeripheralRequestSense001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRequestSense001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRequestSense002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3700
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRequestSense002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRequestSense002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralRequestSenseTwo(deviceId);
        console.info("Test Result testScsiPeripheralRequestSense002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRequestSense002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRequestSense003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3800
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRequestSense003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRequestSense003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralRequestSenseThree(deviceId);
        console.info("Test Result testScsiPeripheralRequestSense003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRequestSense003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRequestSense004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_3900
     * @tc.desc   OH_SCSIPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRequestSense004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRequestSense004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralRequestSenseFour(deviceId);
        console.info("Test Result testScsiPeripheralRequestSense004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRequestSense004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRequestSense005
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4000
     * @tc.desc   OH_SCSIPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRequestSense005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRequestSense005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralRequestSenseFive(deviceId);
        console.info("Test Result testScsiPeripheralRequestSense005 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRequestSense005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRequestSense006
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4100
     * @tc.desc   OH_SCSIPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRequestSense006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRequestSense006---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralRequestSenseSix(deviceId);
        console.info("Test Result testScsiPeripheralRequestSense006 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRequestSense006 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4200
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadOne(deviceId);
        console.info("Test Result testScsiPeripheralRead001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4300
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadTwo(deviceId);
        console.info("Test Result testScsiPeripheralRead002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4400
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadThree(deviceId);
        console.info("Test Result testScsiPeripheralRead003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4500
     * @tc.desc   OH_SCSIPeripheral_Read10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadFour(deviceId);
        console.info("Test Result testScsiPeripheralRead004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead005
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4600
     * @tc.desc   OH_SCSIPeripheral_Read10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadFive(deviceId);
        console.info("Test Result testScsiPeripheralRead005 : " + ret);
        let exp = (ret == SCSIPERIPHERAL_DDK_IO_ERROR || ret == SCSIPERIPHERAL_DDK_SUCCESS)
        expect(exp).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead006
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4700
     * @tc.desc   OH_SCSIPeripheral_Read10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead006---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadSix(deviceId);
        console.info("Test Result testScsiPeripheralRead006 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead006 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead007
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4800
     * @tc.desc   OH_SCSIPeripheral_Read10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead007---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadSeven(deviceId);
        console.info("Test Result testScsiPeripheralRead007 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead007 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead008
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_4900
     * @tc.desc   OH_SCSIPeripheral_Read10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead008---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadEight(deviceId);
        console.info("Test Result testScsiPeripheralRead008 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead008 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralRead009
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5000
     * @tc.desc   OH_SCSIPeripheral_Read10 Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralRead009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead009---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralReadNine(deviceId);
        console.info("Test Result testScsiPeripheralRead009 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead009 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralWrite001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5100
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralWrite001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralWriteOne(deviceId);
        console.info("Test Result testScsiPeripheralWrite001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralWrite001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralWrite002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5200
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralWrite002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralWriteTwo(deviceId);
        console.info("Test Result testScsiPeripheralWrite002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralWrite002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralWrite003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5300
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralWrite003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralWriteThree(deviceId);
        console.info("Test Result testScsiPeripheralWrite003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralWrite003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralWrite004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5400
     * @tc.desc   OH_SCSIPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralWrite004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralWriteFour(deviceId);
        console.info("Test Result testScsiPeripheralWrite004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralWrite004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralWrite0041
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5500
     * @tc.desc   OH_SCSIPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralWrite0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralWrite0041---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralWriteFour1(deviceId);
        console.info("Test Result testScsiPeripheralWrite0041 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralWrite0041 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralWrite005
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5600
     * @tc.desc   OH_SCSIPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralWrite005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralWrite005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralWriteFive(deviceId);
        console.info("Test Result testScsiPeripheralWrite005 : " + ret);
        let exp = (ret == SCSIPERIPHERAL_DDK_IO_ERROR || ret == SCSIPERIPHERAL_DDK_SUCCESS)
        expect(exp).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralWrite005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralVerify001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5700
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralVerify001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralVerify001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralVerifyOne(deviceId);
        console.info("Test Result testScsiPeripheralVerify001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralVerify001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralVerify002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5800
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralVerify002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralVerify002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralVerifyTwo(deviceId);
        console.info("Test Result testScsiPeripheralVerify002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralVerify002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralVerify003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_5900
     * @tc.desc   OH_ScsiPeripheral_RequestSense Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralVerify003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralVerify003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralVerifyThree(deviceId);
        console.info("Test Result testScsiPeripheralVerify003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralVerify003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralSendRequestByCDB001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6000
     * @tc.desc   OH_ScsiPeripheral_SendRequestByCdb Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralSendRequestByCDB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralSendRequestByCDB001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralSendRequestByCDBOne(deviceId);
        console.info("Test result testScsiPeripheralSendRequestByCDB001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralSendRequestByCDB001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralSendRequestByCDB002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6100
     * @tc.desc   OH_ScsiPeripheral_SendRequestByCdb Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralSendRequestByCDB002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralSendRequestByCDB002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralSendRequestByCDBTwo();
        console.info("Test result testScsiPeripheralSendRequestByCDB002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralSendRequestByCDB002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralSendRequestByCDB003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6200
     * @tc.desc   OH_ScsiPeripheral_SendRequestByCdb Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralSendRequestByCDB003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralSendRequestByCDB003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralSendRequestByCDBThree(deviceId);
        console.info("Test result testScsiPeripheralSendRequestByCDB003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralSendRequestByCDB003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralSendRequestByCDB004
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6300
     * @tc.desc   OH_ScsiPeripheral_SendRequestByCdb Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralSendRequestByCDB004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralSendRequestByCDB004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralSendRequestByCDBFour(deviceId);
        console.info("Test result testScsiPeripheralSendRequestByCDB004 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_IO_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralSendRequestByCDB004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralCreateDeviceMemMap001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6400
     * @tc.desc   OH_ScsiPeripheral_CreateDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralCreateDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralCreateDeviceMemMap001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralCreateDeviceMemMapOne(deviceId);
        console.info("Test result testScsiPeripheralCreateDeviceMemMap001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralCreateDeviceMemMap001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralCreateDeviceMemMap002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6500
     * @tc.desc   OH_ScsiPeripheral_CreateDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralCreateDeviceMemMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralCreateDeviceMemMap002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralCreateDeviceMemMapTwo(deviceId);
        console.info("Test result testScsiPeripheralCreateDeviceMemMap002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralCreateDeviceMemMap002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralCreateDeviceMemMap003
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6600
     * @tc.desc   OH_SCSIPeripheral_CreateDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralCreateDeviceMemMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralCreateDeviceMemMap003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralCreateDeviceMemMapThree(deviceId);
        console.info("Test result testScsiPeripheralCreateDeviceMemMap003 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_MEMORY_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralCreateDeviceMemMap003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralDestroyDeviceMemMap001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6700
     * @tc.desc   OH_ScsiPeripheral_DestroyDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralDestroyDeviceMemMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralDestroyDeviceMemMap001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test SCSI deviceId = " + deviceId);
        const ret = usbDdk.scsiPeripheralDestroyDeviceMemMapOne(deviceId);
        console.info("Test result testScsiPeripheralDestroyDeviceMemMap001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralDestroyDeviceMemMap001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralDestroyDeviceMemMap002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6800
     * @tc.desc   OH_ScsiPeripheral_DestroyDeviceMemMap Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralDestroyDeviceMemMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralDestroyDeviceMemMap002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralDestroyDeviceMemMapTwo(deviceId);
        console.info("Test result testScsiPeripheralDestroyDeviceMemMap002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralDestroyDeviceMemMap002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralParseBasicSenseInfo001
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_6900
     * @tc.desc   OH_ScsiPeripheral_ParseBasicSenseInfo Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScsiPeripheralParseBasicSenseInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralParseBasicSenseInfo001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralParseBasicSenseInfoOne();
        console.info("Test result testScsiPeripheralParseBasicSenseInfo001 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralParseBasicSenseInfo001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testScsiPeripheralParseBasicSenseInfo002
     * @tc.number SUB_Driver_Ext_ScsiDdk_NdkStage_7000
     * @tc.desc   OH_ScsiPeripheral_ParseBasicSenseInfo Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testScsiPeripheralParseBasicSenseInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testScsiPeripheralParseBasicSenseInfo002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test SCSI device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.scsiPeripheralParseBasicSenseInfoTwo();
        console.info("Test result testScsiPeripheralParseBasicSenseInfo002 : " + ret);
        expect(ret).assertEqual(SCSIPERIPHERAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralParseBasicSenseInfo002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialOpen001
     * @tc.number SUB_Driver_Ext_UsbSerial_0400
     * @tc.desc   OH_UsbSerial_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialOpen001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialOpenOne(deviceId);
        console.info("Test Result testUsbSerialOpen001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialOpen001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialOpen002
     * @tc.number SUB_Driver_Ext_UsbSerial_0500
     * @tc.desc   OH_UsbSerial_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialOpen002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialOpenTwo(deviceId);
        console.info("Test Result testUsbSerialOpen002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialOpen002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialOpen003
     * @tc.number SUB_Driver_Ext_UsbSerial_0600
     * @tc.desc   OH_UsbSerial_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialOpen003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialOpenThree(deviceId);
        console.info("Test Result testUsbSerialOpen003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialOpen003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialOpen004
     * @tc.number SUB_Driver_Ext_UsbSerial_0700
     * @tc.desc   OH_UsbSerial_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialOpen004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialOpenFour(deviceId);
        console.info("Test Result testUsbSerialOpen004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialOpen004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialOpen005
     * @tc.number SUB_Driver_Ext_UsbSerial_0800
     * @tc.desc   OH_UsbSerial_Open Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialOpen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialOpen005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialOpenFive(deviceId);
        console.info("Test Result testUsbSerialOpen005 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialOpen005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialWrite001
     * @tc.number SUB_Driver_Ext_UsbSerial_0900
     * @tc.desc   OH_UsbSerial_Write Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialWrite001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialWriteOne(deviceId);
        console.info("Test Result testUsbSerialWrite001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialWrite001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialWrite002
     * @tc.number SUB_Driver_Ext_UsbSerial_1000
     * @tc.desc   OH_UsbSerial_Write Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialWrite002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialWriteTwo(deviceId);
        console.info("Test Result testUsbSerialWrite002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialWrite002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialWrite003
     * @tc.number SUB_Driver_Ext_UsbSerial_1100
     * @tc.desc   OH_UsbSerial_Write Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialWrite003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialWriteThree(deviceId);
        console.info("Test Result testUsbSerialWrite003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialWrite003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialWrite004
     * @tc.number SUB_Driver_Ext_UsbSerial_1200
     * @tc.desc   OH_UsbSerial_Write Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialWrite004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialWrite004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialWriteFour(deviceId);
        console.info("Test Result testUsbSerialWrite004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialWrite004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialClose003
     * @tc.number SUB_Driver_Ext_UsbSerial_1500
     * @tc.desc   OH_UsbSerial_Write Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialClose003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.usbSerialCloseThree(deviceId);
        console.info("Test Result testUsbSerialClose003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialClose003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialClose004
     * @tc.number SUB_Driver_Ext_UsbSerial_1600
     * @tc.desc   OH_UsbSerial_Write Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialClose004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialClose004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        const ret = usbDdk.usbSerialCloseFour(deviceId);
        console.info("Test Result testUsbSerialClose004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialClose004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialRead001
     * @tc.number SUB_Driver_Ext_UsbSerial_1700
     * @tc.desc   OH_UsbSerial_Read Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialRead001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialReadOne(deviceId);
        console.info("Test Result testUsbSerialRead001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialRead001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialRead002
     * @tc.number SUB_Driver_Ext_UsbSerial_1800
     * @tc.desc   OH_UsbSerial_Read Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialRead002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialReadTwo(deviceId);
        console.info("Test Result testUsbSerialRead002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialRead002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialRead003
     * @tc.number SUB_Driver_Ext_UsbSerial_1900
     * @tc.desc   OH_UsbSerial_Read Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialRead003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialReadThree(deviceId);
        console.info("Test Result testUsbSerialRead003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialRead003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialRead004
     * @tc.number SUB_Driver_Ext_UsbSerial_2000
     * @tc.desc   OH_UsbSerial_Read Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialRead004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialReadFour(deviceId);
        console.info("Test Result testUsbSerialRead004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialRead004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetBaudRate001
     * @tc.number SUB_Driver_Ext_UsbSerial_2100
     * @tc.desc   OH_UsbSerial_SetBaudRate Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetBaudRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetBaudRate001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetBaudRateOne(deviceId);
        console.info("Test Result testUsbSerialSetBaudRate001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetBaudRate001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetBaudRate002
     * @tc.number SUB_Driver_Ext_UsbSerial_2200
     * @tc.desc   OH_UsbSerial_SetBaudRate Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetBaudRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetBaudRate002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetBaudRateTwo(deviceId);
        console.info("Test Result testUsbSerialSetBaudRate002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetBaudRate002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetBaudRate003
     * @tc.number SUB_Driver_Ext_UsbSerial_2300
     * @tc.desc   OH_UsbSerial_SetBaudRate Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetBaudRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetBaudRate003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetBaudRateThree(deviceId);
        console.info("Test Result testUsbSerialSetBaudRate003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetBaudRate003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetBaudRate004
     * @tc.number SUB_Driver_Ext_UsbSerial_2400
     * @tc.desc   OH_UsbSerial_SetBaudRate Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetBaudRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetBaudRate004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetBaudRateFour(deviceId);
        console.info("Test Result testUsbSerialSetBaudRate004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetBaudRate004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetParams001
     * @tc.number SUB_Driver_Ext_UsbSerial_2500
     * @tc.desc   OH_UsbSerial_SetParams Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetParams001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetParamsOne(deviceId);
        console.info("Test Result testUsbSerialSetParams001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetParams001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetParams002
     * @tc.number SUB_Driver_Ext_UsbSerial_2600
     * @tc.desc   OH_UsbSerial_SetParams Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetParams002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetParams002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetParamsTwo(deviceId);
        console.info("Test Result testUsbSerialSetParams002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetParams002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetParams003
     * @tc.number SUB_Driver_Ext_UsbSerial_2700
     * @tc.desc   OH_UsbSerial_SetParams Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetParams003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetParams003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetParamsThree(deviceId);
        console.info("Test Result testUsbSerialSetParams003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetParams003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetParams004
     * @tc.number SUB_Driver_Ext_UsbSerial_2800
     * @tc.desc   OH_UsbSerial_SetParams Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetParams004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetParams004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetParamsFour(deviceId);
        console.info("Test Result testUsbSerialSetParams004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetParams004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetTimeout001
     * @tc.number SUB_Driver_Ext_UsbSerial_2900
     * @tc.desc   OH_UsbSerial_SetTimeout Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetTimeout001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetTimeoutOne(deviceId);
        console.info("Test Result testUsbSerialSetTimeout001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetTimeout001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetTimeout002
     * @tc.number SUB_Driver_Ext_UsbSerial_3000
     * @tc.desc   OH_UsbSerial_SetTimeout Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetTimeout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetTimeout002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetTimeoutTwo(deviceId);
        console.info("Test Result testUsbSerialSetTimeout002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetTimeout002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetTimeout003
     * @tc.number SUB_Driver_Ext_UsbSerial_3100
     * @tc.desc   OH_UsbSerial_SetTimeout Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetTimeout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetTimeout003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetTimeoutThree(deviceId);
        console.info("Test Result testUsbSerialSetTimeout003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetTimeout003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetTimeout004
     * @tc.number SUB_Driver_Ext_UsbSerial_3200
     * @tc.desc   OH_UsbSerial_SetTimeout Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetTimeout004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetTimeout004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetTimeoutFour(deviceId);
        console.info("Test Result testUsbSerialSetTimeout004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetTimeout004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetTimeout005
     * @tc.number SUB_Driver_Ext_UsbSerial_3300
     * @tc.desc   OH_UsbSerial_SetTimeout Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetTimeout005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetTimeout005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetTimeoutFive(deviceId);
        console.info("Test Result testUsbSerialSetTimeout005 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetTimeout005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetFlowControl001
     * @tc.number SUB_Driver_Ext_UsbSerial_3400
     * @tc.desc   OH_UsbSerial_SetFlowControl Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetFlowControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetFlowControl001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetFlowControlOne(deviceId);
        console.info("Test Result testUsbSerialSetFlowControl001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetFlowControl001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetFlowControl002
     * @tc.number SUB_Driver_Ext_UsbSerial_3500
     * @tc.desc   OH_UsbSerial_SetFlowControl Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetFlowControl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetFlowControl002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetFlowControlTwo(deviceId);
        console.info("Test Result testUsbSerialSetFlowControl002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetFlowControl002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetFlowControl003
     * @tc.number SUB_Driver_Ext_UsbSerial_3600
     * @tc.desc   OH_UsbSerial_SetFlowControl Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetFlowControl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetFlowControl003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetFlowControlThree(deviceId);
        console.info("Test Result testUsbSerialSetFlowControl003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetFlowControl003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialSetFlowControl004
     * @tc.number SUB_Driver_Ext_UsbSerial_3700
     * @tc.desc   OH_UsbSerial_SetFlowControl Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialSetFlowControl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetFlowControl004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialSetFlowControlFour(deviceId);
        console.info("Test Result testUsbSerialSetFlowControl004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetFlowControl004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlush001
     * @tc.number SUB_Driver_Ext_UsbSerial_3800
     * @tc.desc   OH_UsbSerial_Flush Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlush001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushOne(deviceId);
        console.info("Test Result testUsbSerialFlush001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlush001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlush002
     * @tc.number SUB_Driver_Ext_UsbSerial_3900
     * @tc.desc   OH_UsbSerial_Flush Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlush002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushTwo(deviceId);
        console.info("Test Result testUsbSerialFlush002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlush002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlush003
     * @tc.number SUB_Driver_Ext_UsbSerial_4000
     * @tc.desc   OH_UsbSerial_Flush Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlush003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlush003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushThree(deviceId);
        console.info("Test Result testUsbSerialFlush003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlush003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlush004
     * @tc.number SUB_Driver_Ext_UsbSerial_4100
     * @tc.desc   OH_UsbSerial_Flush Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlush004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlush004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushFour(deviceId);
        console.info("Test Result testUsbSerialFlush004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlush004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushInput001
     * @tc.number SUB_Driver_Ext_UsbSerial_4200
     * @tc.desc   OH_UsbSerial_FlushInput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushInput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushInput001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushInputOne(deviceId);
        console.info("Test Result testUsbSerialFlushInput001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushInput001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushInput002
     * @tc.number SUB_Driver_Ext_UsbSerial_4300
     * @tc.desc   OH_UsbSerial_FlushInput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushInput002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushInput002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushInputTwo(deviceId);
        console.info("Test Result testUsbSerialFlushInput002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushInput002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushInput003
     * @tc.number SUB_Driver_Ext_UsbSerial_4400
     * @tc.desc   OH_UsbSerial_FlushInput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushInput003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushInput003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushInputThree(deviceId);
        console.info("Test Result testUsbSerialFlushInput003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushInput003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushInput004
     * @tc.number SUB_Driver_Ext_UsbSerial_4500
     * @tc.desc   OH_UsbSerial_FlushInput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushInput004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushInput004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushInputFour(deviceId);
        console.info("Test Result testUsbSerialFlushInput004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushInput004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushOutput001
     * @tc.number SUB_Driver_Ext_UsbSerial_4600
     * @tc.desc   OH_UsbSerial_FlushOutput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushOutput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushOutput001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushOutputOne(deviceId);
        console.info("Test Result testUsbSerialFlushOutput001 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushOutput001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushOutput002
     * @tc.number SUB_Driver_Ext_UsbSerial_4700
     * @tc.desc   OH_UsbSerial_FlushOutput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushOutput002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushOutput002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushOutputTwo(deviceId);
        console.info("Test Result testUsbSerialFlushOutput002 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushOutput002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushOutput003
     * @tc.number SUB_Driver_Ext_UsbSerial_4800
     * @tc.desc   OH_UsbSerial_FlushOutput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushOutput003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushOutput003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushOutputThree(deviceId);
        console.info("Test Result testUsbSerialFlushOutput003 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushOutput003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbSerialFlushOutput004
     * @tc.number SUB_Driver_Ext_UsbSerial_4900
     * @tc.desc   OH_UsbSerial_FlushOutput Interface testing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbSerialFlushOutput004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushOutput004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test USB SERIAL device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test USB SERIAL deviceId = " + deviceId);
        const ret = usbDdk.usbSerialFlushOutputFour(deviceId);
        console.info("Test Result testUsbSerialFlushOutput004 : " + ret);
        expect(ret).assertEqual(USB_SERIAL_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushOutput004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}

