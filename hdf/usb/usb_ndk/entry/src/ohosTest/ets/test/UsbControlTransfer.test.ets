/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

export default function usbControlTransferTest() {
  let dev: number = -1;

  describe('UsbControlTransferTest', () => {

    const TAG: string = "[usbControlTransferTest]";
    const USB_DDK_SUCCESS: number = 0;
    const USB_DDK_FAILED: number = -1;
    const USB_DDK_INVALID_PARAMETER: number = 401;
    const USB_DDK_INVALID_OPERATION: number = 27400002;
    const USB_DDK_IO_FAILED: number = 27400003;
    const USB_DDK_TIMEOUT: number = 27400004;

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
     * @tc.name   testUsbGetNonRootHubs001
     * @tc.number SUB_Driver_Ext_GetNonRootHub_0100
     * @tc.desc   OH_Usb_GetNonRootHub Interface testing - DDK success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbGetNonRootHubs001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbGetNonRootHubs001---------------------------');
      try {
        const ret = usbDdk.usbGetNonRootHubsOne(dev);
        console.info("Test Result testUsbGetNonRootHubs001 : " + ret);
        expect(ret).assertEqual(USB_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetNonRootHubs001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbGetNonRootHubs002
     * @tc.number SUB_Driver_Ext_GetNonRootHub_0200
     * @tc.desc   OH_Usb_GetNonRootHub Interface testing - DDK not initialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbGetNonRootHubs002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testUsbGetNonRootHubs002---------------------------');
      try {
        const ret = usbDdk.usbGetNonRootHubsTwo(dev);
        console.info("Test Result testUsbGetNonRootHubs002 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetNonRootHubs002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbGetNonRootHubs003
     * @tc.number SUB_Driver_Ext_GetNonRootHub_0300
     * @tc.desc   OH_Usb_GetNonRootHub Interface testing -  input null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbGetNonRootHubs003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testUsbGetNonRootHubs003---------------------------');
      try {
        const ret = usbDdk.usbGetNonRootHubsThree(dev);
        console.info("Test Result testUsbGetNonRootHubs003 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetNonRootHubs003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransfer002
     * @tc.number SUB_Driver_Ext_ControlTransfer_0200
     * @tc.desc   OH_Usb_ControlTransfer Interface testing -  success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransfer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testUsbControlTransfer002---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        const ret = usbDdk.usbControlTransferTwo(dev);
        console.info("Test Result testUsbControlTransfer002 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransfer002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferGetStatus001
     * @tc.number SUB_Driver_Ext_ControlTransfer_0400
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - GET_STATUS request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbControlTransferGetStatus001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbControlTransferGetStatus001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferGetStatus(dev);
        console.info("Test Result testUsbControlTransferGetStatus001 : " + ret);
        expect(ret >= USB_DDK_SUCCESS).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferGetStatus001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferSetFeature001
     * @tc.number SUB_Driver_Ext_ControlTransfer_0500
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - SET_FEATURE request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbControlTransferSetFeature001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbControlTransferSetFeature001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferSetFeature(dev);
        console.info("Test Result testUsbControlTransferSetFeature001 : " + ret);
        expect(ret >= USB_DDK_SUCCESS).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferSetFeature001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferClearFeature001
     * @tc.number SUB_Driver_Ext_ControlTransfer_0600
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - CLEAR_FEATURE request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbControlTransferClearFeature001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbControlTransferClearFeature001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferClearFeature(dev);
        console.info("Test Result testUsbControlTransferClearFeature001 : " + ret);
        expect(ret >= USB_DDK_SUCCESS).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferClearFeature001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferGetDescriptor001
     * @tc.number SUB_Driver_Ext_ControlTransfer_0700
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - GET_DESCRIPTOR request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbControlTransferGetDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbControlTransferGetDescriptor001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferGetDescriptor(dev);
        console.info("Test Result testUsbControlTransferGetDescriptor001 : " + ret);
        expect(ret >= USB_DDK_SUCCESS).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferGetDescriptor001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferGetConfiguration001
     * @tc.number SUB_Driver_Ext_ControlTransfer_0800
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - GET_CONFIGURATION request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbControlTransferGetConfiguration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbControlTransferGetConfiguration001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferGetConfiguration(dev);
        console.info("Test Result testUsbControlTransferGetConfiguration001 : " + ret);
        expect(ret >= USB_DDK_SUCCESS).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferGetConfiguration001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferGetInterface001
     * @tc.number SUB_Driver_Ext_ControlTransfer_0900
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - GET_INTERFACE request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbControlTransferGetInterface001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbControlTransferGetInterface001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferGetInterface(dev);
        console.info("Test Result testUsbControlTransferGetInterface001 : " + ret);
        expect(ret >= USB_DDK_SUCCESS).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferGetInterface001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferSetConfiguration001
     * @tc.number SUB_Driver_Ext_ControlTransfer_1000
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - SET_CONFIGURATION request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testUsbControlTransferSetConfiguration001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbControlTransferSetConfiguration001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferSetConfiguration(dev);
        console.info("Test Result testUsbControlTransferSetConfiguration001 : " + ret);
        expect(ret >= USB_DDK_SUCCESS).assertTrue();
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferSetConfiguration001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferSetupNull001
     * @tc.number SUB_Driver_Ext_ControlTransfer_1100
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - setupPacket is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferSetupNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testUsbControlTransferSetupNull001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferSetupNull(dev);
        console.info("Test Result testUsbControlTransferSetupNull001 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferSetupNull001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferDataNull001
     * @tc.number SUB_Driver_Ext_ControlTransfer_1200
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - data is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferDataNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testUsbControlTransferDataNull001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferDataNull(dev);
        console.info("Test Result testUsbControlTransferDataNull001 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferDataNull001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferInvalidDeviceId001
     * @tc.number SUB_Driver_Ext_ControlTransfer_1300
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - invalid deviceId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferInvalidDeviceId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testUsbControlTransferInvalidDeviceId001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferInvalidDeviceId(dev);
        console.info("Test Result testUsbControlTransferInvalidDeviceId001 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferInvalidDeviceId001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   testUsbControlTransferNoInit001
     * @tc.number SUB_Driver_Ext_ControlTransfer_1400
     * @tc.desc   OH_Usb_ControlTransfer Interface testing - DDK not initialized
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUsbControlTransferNoInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('----------------------testUsbControlTransferNoInit001---------------------------');
      try {
        if (dev < 0) {
          console.info("Test USB device not connected");
          expect(dev).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info("Test USB deviceId = " + dev);
        const ret = usbDdk.usbControlTransferNoInit(dev);
        console.info("Test Result testUsbControlTransferNoInit001 : " + ret);
        expect(ret).assertEqual(USB_DDK_INVALID_OPERATION);
        done();
      } catch (err) {
        console.error(TAG, `testUsbControlTransferNoInit001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });
  })
}