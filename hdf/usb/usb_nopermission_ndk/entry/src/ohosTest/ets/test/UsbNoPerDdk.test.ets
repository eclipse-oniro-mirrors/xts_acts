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

import { beforeAll, afterAll, describe, it, expect, TestType, Size, Level } from "@ohos/hypium"
import usbNoPerDdk from 'libusbddkndk.so'
import deviceManager from "@ohos.driver.deviceManager";


export default function usbNoPerDdkTest() {
  describe('usbNoPerDdkTest', () => {

    const TAG: string = "[usbNoPerDdkTest]";
    const DDK_ERR_NOPERM: number = 201;
    const USB_DDK_FAILED: number = -1;
    let deviceId: number = -1;

    beforeAll(async () => {
      console.log(TAG, '*************hid Unit usbNoPerDdkTest start*************');
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
      console.log(TAG, '*************hid Unit usbNoPerDdkTest end*************');
    })

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0100
     * @tc.name       : testUsbInitNoPer001
     * @tc.desc       : OH_Usb_Init Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testUsbInitNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbInitNoPer001---------------------------');
      try {
        const ret = usbNoPerDdk.usbInit();
        console.info(TAG, "Test Result testUsbInitNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbInitNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0200
     * @tc.name       : testUsbReleaseNoPer001
     * @tc.desc       : OH_Usb_Release Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbReleaseNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbInitNoPer001---------------------------');
      try {
        const ret = usbNoPerDdk.usbRelease();
        console.info(TAG, "Test Result testUsbReleaseNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbReleaseNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1600
     * @tc.name       : testUsbReleaseResourceNoPer001
     * @tc.desc       : OH_Usb_ReleaseResource Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbReleaseResourceNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbReleaseResourceNoPer001---------------------------');
      try {
        const ret = usbNoPerDdk.usbReleaseResource();
        console.info(TAG, "Test Result testUsbReleaseNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbReleaseResourceNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0300
     * @tc.name       : testUsbGetDeviceDescriptorNoPer001
     * @tc.desc       : OH_Usb_GetDeviceDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetDeviceDescriptorNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbGetDeviceDescriptorNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbGetDeviceDescriptor(deviceId);
        console.info(TAG, "Test Result testUsbGetDeviceDescriptorNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetDeviceDescriptorNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0400
     * @tc.name       : testUsbGetConfigDescriptorNoPer001
     * @tc.desc       : OH_Usb_GetConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetConfigDescriptorNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbGetConfigDescriptorNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbGetConfigDescriptor(deviceId);
        console.info(TAG, "Test Result testUsbGetConfigDescriptorNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetConfigDescriptorNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0500
     * @tc.name       : testUsbFreeConfigDescriptorNoPer001
     * @tc.desc       : OH_Usb_FreeConfigDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbFreeConfigDescriptorNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbFreeConfigDescriptorNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbFreeConfigDescriptor(deviceId);
        console.info(TAG, "Test Result testUsbFreeConfigDescriptorNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbFreeConfigDescriptorNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0600
     * @tc.name       : testUsbClaimInterfaceNoPer001
     * @tc.desc       : OH_Usb_ClaimInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbClaimInterfaceNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbClaimInterfaceNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbClaimInterface(deviceId);
        console.info(TAG, "Test Result testUsbClaimInterfaceNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbClaimInterfaceNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0700
     * @tc.name       : testUsbReleaseInterfaceNoPer001
     * @tc.desc       : OH_Usb_ReleaseInterface Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbReleaseInterfaceNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbReleaseInterfaceNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbReleaseInterface(deviceId);
        console.info(TAG, "Test Result testUsbReleaseInterfaceNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbReleaseInterfaceNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0800
     * @tc.name       : testUsbSelectInterfaceSettingNoPer001
     * @tc.desc       : OH_Usb_SelectInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSelectInterfaceSettingNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSelectInterfaceSettingNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSelectInterfaceSetting(deviceId);
        console.info(TAG, "Test Result testUsbSelectInterfaceSettingNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSelectInterfaceSettingNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_0900
     * @tc.name       : testUsbGetCurrentInterfaceSettingNoPer001
     * @tc.desc       : OH_Usb_GetCurrentInterfaceSetting Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetCurrentInterfaceSettingNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbGetCurrentInterfaceSettingNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbGetCurrentInterfaceSetting(deviceId);
        console.info(TAG, "Test Result testUsbGetCurrentInterfaceSettingNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetCurrentInterfaceSettingNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1000
     * @tc.name       : testUsbSendControlReadRequestNoPer001
     * @tc.desc       : OH_Usb_SendControlReadRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendControlReadRequestNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendControlReadRequestNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendControlReadRequest(deviceId);
        console.info(TAG, "Test Result testUsbSendControlReadRequestNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendControlReadRequestNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1100
     * @tc.name       : testUsbSendControlWriteRequestNoPer001
     * @tc.desc       : OH_Usb_SendControlWriteRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendControlWriteRequestNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendControlWriteRequestNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendControlWriteRequest(deviceId);
        console.info(TAG, "Test Result testUsbSendControlWriteRequestNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendControlWriteRequestNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1200
     * @tc.name       : testUsbSendPipeRequestNoPer001
     * @tc.desc       : OH_Usb_SendPipeRequest Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequestNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendPipeRequestNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendPipeRequest(deviceId);
        console.info(TAG, "Test Result testUsbSendPipeRequestNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1300
     * @tc.name       : testUsbCreateDeviceMemMapNoPer001
     * @tc.desc       : OH_Usb_CreateDeviceMemMap Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     /* @tc.level      : Level 0/
     */
    it('testUsbCreateDeviceMemMapNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbCreateDeviceMemMapNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbCreateDeviceMemMap(deviceId);
        console.info(TAG, "Test Result testUsbCreateDeviceMemMapNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbCreateDeviceMemMapNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1400
     * @tc.name       : testUsbDestroyDeviceMemMapNoPer001
     * @tc.desc       : OH_Usb_DestroyDeviceMemMap Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbDestroyDeviceMemMapNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbDestroyDeviceMemMapNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
         expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbDestroyDeviceMemMap(deviceId);
        console.info(TAG, "Test Result testUsbDestroyDeviceMemMapNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbDestroyDeviceMemMapNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

     /**
     * @tc.number     : SUB_Driver_Ext_DDKNoPer_1500
     * @tc.name       : testUsbSendPipeRequestWithAshmemNoPer001
     * @tc.desc       : OH_Usb_SendPipeRequestWithAshmem Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbSendPipeRequestWithAshmemNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, '----------------------testUsbSendPipeRequestWithAshmemNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        console.info(TAG, "Test USB deviceId = " + deviceId);
        const ret = usbNoPerDdk.usbSendPipeRequestWithAshmem(deviceId);
        console.info(TAG, "Test Result testUsbSendPipeRequestWithAshmemNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSendPipeRequestWithAshmemNoPer001 failed, message is ${err.message}`);
        expect(err === null).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_DDK_0900
     * @tc.name       : testUsbGetDevicesNoPer001
     * @tc.desc       : OH_Usb_GetDevices Interface testing,teturn DDK_ERR_NOPERM
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testUsbGetDevicesNoPer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbGetDevicesNoPer001---------------------------');
      try {
        if (deviceId < 0) {
          console.info(TAG, "Test USB device not connected");
          expect(deviceId).assertEqual(USB_DDK_FAILED);
          done();
          return;
        }
        const ret = usbNoPerDdk.usbGetDevices(deviceId);
        console.info("Test Result testUsbGetDevicesNoPer001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbGetDevicesNoPer001 failed, message is ${err.message}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0100
     * @tc.name       : testScsiPeripheralInit001
     * @tc.desc       : OH_ScsiPeripheral_Init Interface testing
     */
    it('testScsiPeripheralInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInit001---------------------------');
      try {
        const ret = usbNoPerDdk.scsiPeripheralInit();
        console.info("Test result testScsiPeripheralInit001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInit001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0200
     * @tc.name       : testScsiPeripheralRelease001
     * @tc.desc       : OH_ScsiPeripheral_Release Interface testing
     */
    it('testScsiPeripheralRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRelease001---------------------------');
      try {
        const ret = usbNoPerDdk.scsiPeripheralRelease();
        console.info("Test result testScsiPeripheralRelease001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRelease001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0300
     * @tc.name       : testScsiPeripheralOpen001
     * @tc.desc       : OH_ScsiPeripheral_Open Interface testing
     */
    it('testScsiPeripheralOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralOpen001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralOpen(deviceId);
        console.info("Test Result testScsiPeripheralOpen001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralOpen001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0400
     * @tc.name       : testScsiPeripheralClose001
     * @tc.desc       : OH_ScsiPeripheral_Close Interface testing
     */
    it('testScsiPeripheralClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralClose001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralClose(deviceId);
        console.info("Test Result testScsiPeripheralClose001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralClose001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0500
     * @tc.name       : testScsiPeripheralTestUnitReady001
     * @tc.desc       : OH_ScsiPeripheral_TestUnitReady Interface testing
     */
    it('testScsiPeripheralTestUnitReady001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralTestUnitReady001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralTestUnitReady(deviceId);
        console.info("Test Result testScsiPeripheralTestUnitReady001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralTestUnitReady001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0600
     * @tc.name       : testScsiPeripheralInquiry001
     * @tc.desc       : OH_ScsiPeripheral_Inquiry Interface testing
     */
    it('testScsiPeripheralInquiry001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralInquiry001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralInquiry(deviceId);
        console.info("Test Result testScsiPeripheralInquiry001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralInquiry001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0700
     * @tc.name       : testScsiPeripheralReadCapacity10_001
     * @tc.desc       : OH_ScsiPeripheral_ReadCapacity10 Interface testing
     */
    it('testScsiPeripheralReadCapacity10_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralReadCapacity10_001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralReadCapacity10(deviceId);
        console.info("Test Result testScsiPeripheralReadCapacity10_001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralReadCapacity10_001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0800
     * @tc.name       : testScsiPeripheralRequestSense001
     * @tc.desc       : OH_ScsiPeripheral_RequestSense Interface testing
     */
    it('testScsiPeripheralRequestSense001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRequestSense001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralRequestSense(deviceId);
        console.info("Test Result testScsiPeripheralRequestSense001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRequestSense001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_0900
     * @tc.name       : testScsiPeripheralRead10_001
     * @tc.desc       : OH_ScsiPeripheral_Read10 Interface testing
     */
    it('testScsiPeripheralRead10_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralRead10_001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralRead10(deviceId);
        console.info("Test Result testScsiPeripheralRead10_001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralRead10_001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_1000
     * @tc.name       : testScsiPeripheralWrite10_001
     * @tc.desc       : OH_ScsiPeripheral_Write10 Interface testing
     */
    it('testScsiPeripheralWrite10_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralWrite10_001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralWrite10(deviceId);
        console.info("Test Result testScsiPeripheralWrite10_001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralWrite10_001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_1100
     * @tc.name       : testScsiPeripheralVerify10_001
     * @tc.desc       : OH_ScsiPeripheral_Verify10 Interface testing
     */
    it('testScsiPeripheralVerify10_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralVerify10_001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralVerify10(deviceId);
        console.info("Test Result testScsiPeripheralVerify10_001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralVerify10_001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_ScsiDdk_NdkPermisson_1200
     * @tc.name       : testScsiPeripheralSendRequestByCDB001
     * @tc.desc       : OH_ScsiPeripheral_SendRequestByCdb Interface testing
     */
    it('testScsiPeripheralSendRequestByCDB001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testScsiPeripheralSendRequestByCDB001---------------------------');
      try {
        console.info("Test scsi deviceId = " + deviceId);
        const ret = usbNoPerDdk.scsiPeripheralSendRequestByCDB(deviceId);
        console.info("Test Result testScsiPeripheralSendRequestByCDB001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testScsiPeripheralSendRequestByCDB001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0100
     * @tc.name       : testHidInit001
     * @tc.desc       : OH_Hid_Init Interface testing
     */
    it('testHidInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidInit001---------------------------');
      try {
        const ret = usbNoPerDdk.hidInit();
        console.info("Test Result testHidInit001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidInit001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0200
     * @tc.name       : testHidRelease001
     * @tc.desc       : OH_Hid_Release Interface testing
     */
    it('testHidRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRelease001---------------------------');
      try {
        const ret = usbNoPerDdk.hidRelease();
        console.info("Test Result testHidRelease001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidRelease001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0300
     * @tc.name       : testHidOpen001
     * @tc.desc       : OH_Hid_Open Interface testing
     */
    it('testHidOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidOpen001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidOpen(deviceId);
        console.info("Test Result testHidOpen001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidOpen001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0400
     * @tc.name       : testHidClose001
     * @tc.desc       : OH_Hid_Close Interface testing
     */
    it('testHidClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidClose001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidClose(deviceId);
        console.info("Test Result testHidClose001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidClose001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0500
     * @tc.name       : testHidWrite001
     * @tc.desc       : OH_Hid_Write Interface testing
     */
    it('testHidWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidWrite001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidWrite(deviceId);
        console.info("Test Result testHidWrite001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidWrite001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0600
     * @tc.name       : testHidReadTimeout001
     * @tc.desc       : OH_Hid_ReadTimeout Interface testing
     */
    it('testHidReadTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidReadTimeout001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidReadTimeout(deviceId);
        console.info("Test Result testHidReadTimeout001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidReadTimeout001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0700
     * @tc.name       : testHidRead001
     * @tc.desc       : OH_Hid_Read Interface testing
     */
    it('testHidRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRead001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidRead(deviceId);
        console.info("Test Result testHidRead001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidRead001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0800
     * @tc.name       : testHidSetNonBlocking001
     * @tc.desc       : OH_Hid_SetNonBlocking Interface testing
     */
    it('testHidSetNonBlocking001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSetNonBlocking001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidSetNonBlocking(deviceId);
        console.info("Test Result testHidSetNonBlocking001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidSetNonBlocking001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_0900
     * @tc.name       : testHidGetRawInfo001
     * @tc.desc       : OH_Hid_GetRawInfo Interface testing
     */
    it('testHidGetRawInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawInfo001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidGetRawInfo(deviceId);
        console.info("Test Result testHidGetRawInfo001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawInfo001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_1000
     * @tc.name       : testHidGetRawName001
     * @tc.desc       : OH_Hid_GetRawName Interface testing
     */
    it('testHidGetRawName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawName001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidGetRawName(deviceId);
        console.info("Test Result testHidGetRawName001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawName001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_1100
     * @tc.name       : testHidGetPhysicalAddress001
     * @tc.desc       : OH_Hid_GetPhysicalAddress Interface testing
     */
    it('testHidGetPhysicalAddress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetPhysicalAddress001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidGetPhysicalAddress(deviceId);
        console.info("Test Result testHidGetPhysicalAddress001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetPhysicalAddress001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_1200
     * @tc.name       : testHidGetRawUniqueId001
     * @tc.desc       : OH_Hid_GetRawUniqueId Interface testing
     */
    it('testHidGetRawUniqueId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawUniqueId001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidGetRawUniqueId(deviceId);
        console.info("Test Result testHidGetRawUniqueId001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawUniqueId001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_1300
     * @tc.name       : testHidSendReport001
     * @tc.desc       : OH_Hid_SendReport Interface testing
     */
    it('testHidSendReport001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSendReport001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidSendReport(deviceId);
        console.info("Test Result testHidSendReport001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidSendReport001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_1400
     * @tc.name       : testHidGetReport001
     * @tc.desc       : OH_Hid_GetReport Interface testing
     */
    it('testHidGetReport001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReport001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidGetReport(deviceId);
        console.info("Test Result testHidGetReport001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReport001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_Permission_1500
     * @tc.name       : testHidGetReportDescriptor001
     * @tc.desc       : OH_Hid_GetReportDescriptor Interface testing
     */
    it('testHidGetReportDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReportDescriptor001---------------------------');
      try {
        console.info("Test HID deviceId = " + deviceId);
        const ret = usbNoPerDdk.hidGetReportDescriptor(deviceId);
        console.info("Test Result testHidGetReportDescriptor001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReportDescriptor001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0100
     * @tc.name       : testUsbSerialInit001
     * @tc.desc       : OH_UsbSerial_Init Interface testing
     */
    it('testUsbSerialInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialInit001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialInit();
        console.info("Test Result testUsbSerialInit001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialInit001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0200
     * @tc.name       : testUsbSerialRelease001
     * @tc.desc       : OH_UsbSerial_Release Interface testing
     */
    it('testUsbSerialRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialRelease001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialRelease();
        console.info("Test Result testUsbSerialRelease001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialRelease001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0300
     * @tc.name       : testUsbSerialOpen001
     * @tc.desc       : OH_UsbSerial_Open Interface testing
     */
    it('testUsbSerialOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialOpen001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialOpen();
        console.info("Test Result testUsbSerialOpen001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialOpen001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0400
     * @tc.name       : testUsbSerialClose001
     * @tc.desc       : OH_UsbSerial_Close Interface testing
     */
    it('testUsbSerialClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialClose001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialClose();
        console.info("Test Result testUsbSerialClose001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialClose001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0500
     * @tc.name       : testUsbSerialRead001
     * @tc.desc       : OH_UsbSerial_Read Interface testing
     */
    it('testUsbSerialRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialRead001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialRead();
        console.info("Test Result testUsbSerialRead001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialRead001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0600
     * @tc.name       : testUsbSerialWrite001
     * @tc.desc       : OH_UsbSerial_Write Interface testing
     */
    it('testUsbSerialWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialWrite001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialWrite();
        console.info("Test Result testUsbSerialWrite001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialWrite001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0700
     * @tc.name       : testUsbSerialSetBaudRate001
     * @tc.desc       : OH_UsbSerial_SetBaudRate Interface testing
     */
    it('testUsbSerialSetBaudRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetBaudRate001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialSetBaudRate();
        console.info("Test Result testUsbSerialSetBaudRate001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetBaudRate001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0800
     * @tc.name       : testUsbSerialSetParams001
     * @tc.desc       : OH_UsbSerial_SetParams Interface testing
     */
    it('testUsbSerialSetParams001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetParams001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialSetParams();
        console.info("Test Result testUsbSerialSetParams001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetParams001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_0900
     * @tc.name       : testUsbSerialSetTimeout001
     * @tc.desc       : OH_UsbSerial_SetTimeout Interface testing
     */
    it('testUsbSerialSetTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetTimeout001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialSetTimeout();
        console.info("Test Result testUsbSerialSetTimeout001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetTimeout001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_1000
     * @tc.name       : testUsbSerialSetFlowControl001
     * @tc.desc       : OH_UsbSerial_SetFlowControl Interface testing
     */
    it('testUsbSerialSetFlowControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialSetFlowControl001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialSetFlowControl();
        console.info("Test Result testUsbSerialSetFlowControl001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialSetFlowControl001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_1100
     * @tc.name       : testUsbSerialFlush001
     * @tc.desc       : OH_UsbSerial_Flush Interface testing
     */
    it('testUsbSerialFlush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlush001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialFlush();
        console.info("Test Result testUsbSerialFlush001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlush001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_1200
     * @tc.name       : testUsbSerialFlushInput001
     * @tc.desc       : OH_UsbSerial_FlushInput Interface testing
     */
    it('testUsbSerialFlushInput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushInput001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialFlushInput();
        console.info("Test Result testUsbSerialFlushInput001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushInput001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_UsbSerial_Permission_1300
     * @tc.name       : testUsbSerialFlushOutput001
     * @tc.desc       : OH_UsbSerial_FlushOutput Interface testing
     */
    it('testUsbSerialFlushOutput001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testUsbSerialFlushOutput001---------------------------');
      try {
        const ret = usbNoPerDdk.usbSerialFlushOutput();
        console.info("Test Result testUsbSerialFlushOutput001 : " + ret);
        expect(ret).assertEqual(DDK_ERR_NOPERM);
        done();
      } catch (err) {
        console.error(TAG, `testUsbSerialFlushOutput001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

  })
}
