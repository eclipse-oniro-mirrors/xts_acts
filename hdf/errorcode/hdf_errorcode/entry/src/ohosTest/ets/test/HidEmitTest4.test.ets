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

import { afterAll, beforeAll, describe, expect, it, Level } from '@ohos/hypium'
import baskddkerror from 'libbaskddkerrorcode.so'
import deviceManager from "@ohos.driver.deviceManager";

const Success = 0
const TAG: string = "[HidEmitEventTest]";

export default function ActsHidEmitCodeTest4() {
  let deviceId: number = -1;
  describe('ActsHidEmitCodeTest4', () => {
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
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELX_0100
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELX_0100
     * @tc.desc   Test HidDdkErrCodeHIDRELX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELX_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELX_0100 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELX();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELX_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELX_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELY_0200
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELY_0200
     * @tc.desc   Test HidDdkErrCodeHIDRELY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELY_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELY_0200 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELY();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELY_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELY_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELZ_0300
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELZ_0300
     * @tc.desc   Test HidDdkErrCodeHIDRELZ.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELZ_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELZ_0300 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELZ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELZ_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELZ_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELRX_0400
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELRX_0400
     * @tc.desc   Test HidDdkErrCodeHIDRELRX.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELRX_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRX_0400 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELRX();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRX_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRX_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELRY_0500
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELRY_0500
     * @tc.desc   Test HidDdkErrCodeHIDRELRY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELRY_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRY_0500 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELRY();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRY_0500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRY_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELRZ_0600
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELRZ_0600
     * @tc.desc   Test HidDdkErrCodeHIDRELRZ.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELRZ_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRZ_0600 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELRZ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRZ_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRZ_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEEL_0700
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEEL_0700
     * @tc.desc   Test HidDdkErrCodeHIDRELHWHEEL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEEL_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEEL_0700 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELHWHEEL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEEL_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEEL_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELDIAL_0800
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELDIAL_0800
     * @tc.desc   Test HidDdkErrCodeHIDRELDIAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELDIAL_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELDIAL_0800 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELDIAL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELDIAL_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELDIAL_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEEL_0900
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEEL_0900
     * @tc.desc   Test HidDdkErrCodeHIDRELWHEEL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEEL_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEEL_0900 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELWHEEL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEEL_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEEL_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELMISC_1000
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELMISC_1000
     * @tc.desc   Test HidDdkErrCodeHIDRELMISC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELMISC_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELMISC_1000 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELMISC();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELMISC_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELMISC_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELRESERVED_1100
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELRESERVED_1100
     * @tc.desc   Test HidDdkErrCodeHIDRELRESERVED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELRESERVED_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRESERVED_1100 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELRESERVED();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRESERVED_1100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELRESERVED_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEELHIRES_1200
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEELHIRES_1200
     * @tc.desc   Test HidDdkErrCodeHIDRELWHEELHIRES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEELHIRES_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEELHIRES_1200 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELWHEELHIRES();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEELHIRES_1200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELWHEELHIRES_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEELHIRES_1300
     * @tc.number SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEELHIRES_1300
     * @tc.desc   Test HidDdkErrCodeHIDRELHWHEELHIRES.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEELHIRES_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEELHIRES_1300 start====");
        let result: number = baskddkerror.HidDdkErrCodeHIDRELHWHEELHIRES();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEELHIRES_1300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidDdkErrCodeHIDRELHWHEELHIRES_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceHIDMSCSERIAL_1400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceHIDMSCSERIAL_1400
     * @tc.desc   Test HidCreateDeviceHIDMSCSERIAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceHIDMSCSERIAL_1400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCSERIAL_1400 start====");
        let result: number = baskddkerror.HidCreateDeviceHIDMSCSERIAL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCSERIAL_1400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCSERIAL_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceHIDMSCPULSELED_1500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceHIDMSCPULSELED_1500
     * @tc.desc   Test HidCreateDeviceHIDMSCPULSELED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceHIDMSCPULSELED_1500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCPULSELED_1500 start====");
        let result: number = baskddkerror.HidCreateDeviceHIDMSCPULSELED();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCPULSELED_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCPULSELED_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceHIDMSCGESTURE_1600
     * @tc.number SUB_Driver_Ext_HidCreateDeviceHIDMSCGESTURE_1600
     * @tc.desc   Test HidCreateDeviceHIDMSCGESTURE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceHIDMSCGESTURE_1600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCGESTURE_1600 start====");
        let result: number = baskddkerror.HidCreateDeviceHIDMSCGESTURE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCGESTURE_1600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCGESTURE_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceHIDMSCRAW_1800
     * @tc.number SUB_Driver_Ext_HidCreateDeviceHIDMSCRAW_1800
     * @tc.desc   Test HidCreateDeviceHIDMSCRAW.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceHIDMSCRAW_1800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCRAW_1800 start====");
        let result: number = baskddkerror.HidCreateDeviceHIDMSCRAW();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCRAW_1800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCRAW_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceHIDMSCTIMESTAMP_1900
     * @tc.number SUB_Driver_Ext_HidCreateDeviceHIDMSCTIMESTAMP_1900
     * @tc.desc   Test HidCreateDeviceHIDMSCTIMESTAMP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceHIDMSCTIMESTAMP_1900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCTIMESTAMP_1900 start====");
        let result: number = baskddkerror.HidCreateDeviceHIDMSCTIMESTAMP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCTIMESTAMP_1900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceHIDMSCTIMESTAMP_1900 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}