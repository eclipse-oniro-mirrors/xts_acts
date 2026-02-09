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

export default function ActsHidEmitCodeTest1() {
  let deviceId: number = -1;
  describe('ActsHidEmitCodeTest1', () => {
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
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYESC_0100
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYESC_0100
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYESC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYESC_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYESC_0100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYESC();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYESC_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYESC_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY0_0200
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY0_0200
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY0_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY0_0200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY0();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY0_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY0_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY1_0300
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY1_0300
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY1_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY1_0300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY1();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY1_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY1_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY2_0400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY2_0400
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY2_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY2_0400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY2();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY2_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY2_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY3_0500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY3_0500
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY3_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY3_0500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY3();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY3_0500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY3_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY4_0600
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY4_0600
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY4_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY4_0600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY4();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY4_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY4_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY5_0700
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY5_0700
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY5_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY5_0700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY5();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY5_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY5_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY6_0800
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY6_0800
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY6_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY6_0800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY6();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY6_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY6_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY7_0900
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY7_0900
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY7_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY7_0900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY7();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY7_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY7_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY8_1000
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY8_1000
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY8_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY8_1000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY8();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY8_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY8_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY9_1100
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY9_1100
     * @tc.desc   Test HidCreateDeviceKeyCodeKEY9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY9_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY9_1100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEY9();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY9_1100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEY9_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYGRAVE_1200
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYGRAVE_1200
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYGRAVE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYGRAVE_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYGRAVE_1200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYGRAVE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYGRAVE_1200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYGRAVE_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMINUS_1300
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMINUS_1300
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYMINUS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMINUS_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMINUS_1300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYMINUS();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMINUS_1300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMINUS_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYEQUALS_1400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYEQUALS_1400
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYEQUALS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYEQUALS_1400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYEQUALS_1400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYEQUALS();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYEQUALS_1400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYEQUALS_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSPACE_1500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSPACE_1500
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYBACKSPACE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSPACE_1500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSPACE_1500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYBACKSPACE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSPACE_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSPACE_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLRFTBACKET_1600
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLRFTBACKET_1600
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYLRFTBACKET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLRFTBACKET_1600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLRFTBACKET_1600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYLRFTBACKET();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLRFTBACKET_1600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLRFTBACKET_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTBACKET_1700
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTBACKET_1700
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYRIGHTBACKET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTBACKET_1700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTBACKET_1700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYRIGHTBACKET();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTBACKET_1700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTBACKET_1700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYENTER_1800
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYENTER_1800
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYENTER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYENTER_1800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYENTER_1800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYENTER();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYENTER_1800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYENTER_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLEFTSHIFT_1900
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLEFTSHIFT_1900
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYLEFTSHIFT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLEFTSHIFT_1900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLEFTSHIFT_1900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYLEFTSHIFT();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLEFTSHIFT_1900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYLEFTSHIFT_1900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSLASH_2000
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSLASH_2000
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYBACKSLASH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSLASH_2000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSLASH_2000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYBACKSLASH();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSLASH_2000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBACKSLASH_2000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSEMICOLON_2100
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSEMICOLON_2100
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYSEMICOLON.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSEMICOLON_2100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSEMICOLON_2100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYSEMICOLON();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSEMICOLON_2100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSEMICOLON_2100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYAPOSTROPHE_2200
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYAPOSTROPHE_2200
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYAPOSTROPHE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYAPOSTROPHE_2200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYAPOSTROPHE_2200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYAPOSTROPHE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYAPOSTROPHE_2200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYAPOSTROPHE_2200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSPACE_2300
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSPACE_2300
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYSPACE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSPACE_2300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSPACE_2300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYSPACE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSPACE_2300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSPACE_2300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSLASH_2400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSLASH_2400
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYSLASH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSLASH_2400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSLASH_2400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYSLASH();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSLASH_2400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYSLASH_2400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYCOMMA_2500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYCOMMA_2500
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYCOMMA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYCOMMA_2500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYCOMMA_2500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYCOMMA();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYCOMMA_2500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYCOMMA_2500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYPERIOD_2600
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYPERIOD_2600
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYPERIOD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYPERIOD_2600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYPERIOD_2600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYPERIOD();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYPERIOD_2600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYPERIOD_2600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTSHIFT_2700
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTSHIFT_2700
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYRIGHTSHIFT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTSHIFT_2700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTSHIFT_2700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYRIGHTSHIFT();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTSHIFT_2700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYRIGHTSHIFT_2700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD0_2800
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD0_2800
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD0_2800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD0_2800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD0();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD0_2800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD0_2800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD1_2900
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD1_2900
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD1_2900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD1_2900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD1();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD1_2900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD1_2900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD2_3000
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD2_3000
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD2_3000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD2_3000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD2();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD2_3000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD2_3000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD3_3100
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD3_3100
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD3_3100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD3_3100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD3();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD3_3100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD3_3100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD4_3200
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD4_3200
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD4_3200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD4_3200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD4();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD4_3200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD4_3200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD5_3300
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD5_3300
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD5_3300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD5_3300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD5();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD5_3300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD5_3300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD6_3400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD6_3400
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD6_3400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD6_3400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD6();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD6_3400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD6_3400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD7_3500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD7_3500
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYNUMPAD7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD7_3500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD7_3500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD7();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD7_3500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD7_3500 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}