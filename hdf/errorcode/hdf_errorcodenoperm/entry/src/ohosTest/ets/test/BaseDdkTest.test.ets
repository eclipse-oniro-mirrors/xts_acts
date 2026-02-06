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
import baskddkerror from 'libbaskddkerrorcodenoperm.so'
import { deviceManager } from '@kit.DriverDevelopmentKit';

const Success = 0
const TAG: string = "[HidEmitEventTest]";
export default function ActsBaseDDkNoPermTest() {
  let deviceId: number = -1;
  describe('ActsBaseDDkNoPermTest', () => {

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
            (!baskddkerror.IsHidDevice(device.deviceId))) {
            console.info(`Device vid = ${device.vendorId} pid = ${device.productId}, is not hid device`);
            continue;
          }
          deviceId = device.deviceId;
          console.info(`Hid device id is ${device.deviceId}`);
        }
      } catch (error) {
        console.error(`Failed to query device. Code is ${error.code}, message is ${error.message}`);
      }
      console.log(TAG, '*************hid Unit HidEmitEventTest start*************');
    })

    afterAll(async () => {
      console.log(TAG, '*************hid Unit HidEmitEventTest end*************');
    })

    /**
     * @tc.number   SUB_Driver_Ext_CreateTestDeviceDdkNOPERM_0100
     * @tc.name     SUB_Driver_Ext_CreateTestDeviceDdkNOPERM_0100
     * @tc.desc     Test CreateTestDeviceDdkNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_CreateTestDeviceDdkNOPERM_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_CreateTestDeviceDdkNOPERM_0100 sta`rt====");
        let result:number = baskddkerror.CreateTestDeviceDdkNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_CreateTestDeviceDdkNOPERM_0100 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_CreateTestDeviceDdkNOPERM_0100 catch err: " + err);
        expect().assertFail();
      }
    })


    /**
     * @tc.number   SUB_Driver_Ext_HidEmitEventNOPERM_0200
     * @tc.name     SUB_Driver_Ext_HidEmitEventNOPERM_0200
     * @tc.desc     Test HidEmitEventNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidEmitEventNOPERM_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidEmitEventNOPERM_0200 sta`rt====");
        let result:number = baskddkerror.HidEmitEventNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidEmitEventNOPERM_0200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidEmitEventNOPERM_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidDestroyDeviceNOPERM_0300
     * @tc.name     SUB_Driver_Ext_HidDestroyDeviceNOPERM_0300
     * @tc.desc     Test HidDestroyDeviceNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidDestroyDeviceNOPERM_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDestroyDeviceNOPERM_0300 sta`rt====");
        let result:number = baskddkerror.HidDestroyDeviceNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidDestroyDeviceNOPERM_0300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDestroyDeviceNOPERM_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidInitNOPERM_0400
     * @tc.name     SUB_Driver_Ext_HidInitNOPERM_0400
     * @tc.desc     Test HidInitNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidInitNOPERM_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidInitNOPERM_0400 sta`rt====");
        let result:number = baskddkerror.HidInitNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidInitNOPERM_0400 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidInitNOPERM_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidReleaseNOPERM_0500
     * @tc.name     SUB_Driver_Ext_HidReleaseNOPERM_0500
     * @tc.desc     Test HidReleaseNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidReleaseNOPERM_0500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidReleaseNOPERM_0500 sta`rt====");
        let result:number = baskddkerror.HidReleaseNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidReleaseNOPERM_0500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidReleaseNOPERM_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidOpenNOPERM_0600
     * @tc.name     SUB_Driver_Ext_HidOpenNOPERM_0600
     * @tc.desc     Test HidOpenNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidOpenNOPERM_0600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidOpenNOPERM_0600 sta`rt====");
        let result:number = baskddkerror.HidOpenNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidOpenNOPERM_0600 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidOpenNOPERM_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidCloseNOPERM_0700
     * @tc.name     SUB_Driver_Ext_HidCloseNOPERM_0700
     * @tc.desc     Test HidCloseNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidCloseNOPERM_0700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCloseNOPERM_0700 sta`rt====");
        let result:number = baskddkerror.HidCloseNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidCloseNOPERM_0700 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCloseNOPERM_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidWriteNOPERM_0800
     * @tc.name     SUB_Driver_Ext_HidWriteNOPERM_0800
     * @tc.desc     Test HidWriteNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidWriteNOPERM_0800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidWriteNOPERM_0800 sta`rt====");
        let result:number = baskddkerror.HidWriteNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidWriteNOPERM_0800 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidWriteNOPERM_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidReadTimeoutNOPERM_0900
     * @tc.name     SUB_Driver_Ext_HidReadTimeoutNOPERM_0900
     * @tc.desc     Test HidReadTimeoutNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidReadTimeoutNOPERM_0900', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidReadTimeoutNOPERM_0900 sta`rt====");
        let result:number = baskddkerror.HidReadTimeoutNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidReadTimeoutNOPERM_0900 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidReadTimeoutNOPERM_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidReadNOPERM_1000
     * @tc.name     SUB_Driver_Ext_HidReadNOPERM_1000
     * @tc.desc     Test HidReadNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidReadNOPERM_1000', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidReadNOPERM_1000 sta`rt====");
        let result:number = baskddkerror.HidReadNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidReadNOPERM_1000 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidReadNOPERM_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidDdkErrCodeNOPERM_1100
     * @tc.name     SUB_Driver_Ext_HidDdkErrCodeNOPERM_1100
     * @tc.desc     Test HidDdkErrCodeNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidDdkErrCodeNOPERM_1100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeNOPERM_1100 sta`rt====");
        let result:number = baskddkerror.HidDdkErrCodeNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeNOPERM_1100 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeNOPERM_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidSetNonBlockingNOPERM_1200
     * @tc.name     SUB_Driver_Ext_HidSetNonBlockingNOPERM_1200
     * @tc.desc     Test HidSetNonBlockingNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidSetNonBlockingNOPERM_1200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSetNonBlockingNOPERM_1200 sta`rt====");
        let result:number = baskddkerror.HidSetNonBlockingNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidSetNonBlockingNOPERM_1200 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSetNonBlockingNOPERM_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidGetRawInfoNOPERM_1300
     * @tc.name     SUB_Driver_Ext_HidGetRawInfoNOPERM_1300
     * @tc.desc     Test HidGetRawInfoNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidGetRawInfoNOPERM_1300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidGetRawInfoNOPERM_1300 sta`rt====");
        let result:number = baskddkerror.HidGetRawInfoNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidGetRawInfoNOPERM_1300 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidGetRawInfoNOPERM_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidGetRawNameNOPERM_1400
     * @tc.name     SUB_Driver_Ext_HidGetRawNameNOPERM_1400
     * @tc.desc     Test HidGetRawNameNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidGetRawNameNOPERM_1400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidGetRawNameNOPERM_1400 sta`rt====");
        let result:number = baskddkerror.HidGetRawNameNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidGetRawNameNOPERM_1400 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidGetRawNameNOPERM_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidGetPhysicalAddressNOPERM_1500
     * @tc.name     SUB_Driver_Ext_HidGetPhysicalAddressNOPERM_1500
     * @tc.desc     Test HidGetPhysicalAddressNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidGetPhysicalAddressNOPERM_1500', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidGetPhysicalAddressNOPERM_1500 sta`rt====");
        let result:number = baskddkerror.HidGetPhysicalAddressNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidGetPhysicalAddressNOPERM_1500 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidGetPhysicalAddressNOPERM_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidGetRawUniqueIdNOPERM_1600
     * @tc.name     SUB_Driver_Ext_HidGetRawUniqueIdNOPERM_1600
     * @tc.desc     Test HidGetRawUniqueIdNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidGetRawUniqueIdNOPERM_1600', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidGetRawUniqueIdNOPERM_1600 sta`rt====");
        let result:number = baskddkerror.HidGetRawUniqueIdNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidGetRawUniqueIdNOPERM_1600 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidGetRawUniqueIdNOPERM_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidSendReportNOPERM_1700
     * @tc.name     SUB_Driver_Ext_HidSendReportNOPERM_1700
     * @tc.desc     Test HidSendReportNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidSendReportNOPERM_1700', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSendReportNOPERM_1700 sta`rt====");
        let result:number = baskddkerror.HidSendReportNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidSendReportNOPERM_1700 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSendReportNOPERM_1700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidGetReportNOPERM_1800
     * @tc.name     SUB_Driver_Ext_HidGetReportNOPERM_1800
     * @tc.desc     Test HidGetReportNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidGetReportNOPERM_1800', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidGetReportNOPERM_1800 sta`rt====");
        let result:number = baskddkerror.HidGetReportNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidGetReportNOPERM_1800 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidGetReportNOPERM_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_HidGetReportDescriptorNOPERM_1900
     * @tc.name     SUB_Driver_Ext_HidGetReportDescriptorNOPERM_1900
     * @tc.desc     Test HidGetReportDescriptorNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_HidGetReportDescriptorNOPERM_1900', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidGetReportDescriptorNOPERM_1900 sta`rt====");
        let result:number = baskddkerror.HidGetReportDescriptorNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_HidGetReportDescriptorNOPERM_1900 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidGetReportDescriptorNOPERM_1900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_UsbSerialReleaseNOPERM_2000
     * @tc.name     SUB_Driver_Ext_UsbSerialReleaseNOPERM_2000
     * @tc.desc     Test UsbSerialReleaseNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_UsbSerialReleaseNOPERM_2000', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialReleaseNOPERM_2000 sta`rt====");
        let result:number = baskddkerror.UsbSerialReleaseNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialReleaseNOPERM_2000 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialReleaseNOPERM_2000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   SUB_Driver_Ext_UsbSerialCloseNOPERM_2100
     * @tc.name     SUB_Driver_Ext_UsbSerialCloseNOPERM_2100
     * @tc.desc     Test UsbSerialCloseNOPERM.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
     */
    it('SUB_Driver_Ext_UsbSerialCloseNOPERM_2100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialCloseNOPERM_2100 sta`rt====");
        let result:number = baskddkerror.UsbSerialCloseNOPERM();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialCloseNOPERM_2100 result: " + result);
        done();
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialCloseNOPERM_2100 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}
