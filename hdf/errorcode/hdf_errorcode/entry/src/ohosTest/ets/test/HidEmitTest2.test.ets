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

export default function ActsHidEmitCodeTest2() {
  let deviceId: number = -1;
  describe('ActsHidEmitCodeTest2', () => {
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
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD8_0100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD8_0100
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPAD8.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD8_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD8_0100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD8();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD8_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD8_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD9_0200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD9_0200
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPAD9.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD9_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD9_0200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPAD9();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD9_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPAD9_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeNUMPADDIVIDE_0300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeNUMPADDIVIDE_0300
     * @tc.desc    : Test HidCreateDeviceKeyCodeNUMPADDIVIDE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeNUMPADDIVIDE_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeNUMPADDIVIDE_0300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeNUMPADDIVIDE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeNUMPADDIVIDE_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeNUMPADDIVIDE_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY_0400
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY_0400
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY_0400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADMULTIPLY_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADADD_0500
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADADD_0500
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPADADD.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADADD_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADADD_0500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPADADD();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADADD_0500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADADD_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDOT_0600
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDOT_0600
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPADDOT.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDOT_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDOT_0600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPADDOT();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDOT_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDOT_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSYSRQ_0700
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSYSRQ_0700
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPADSYSRQ.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSYSRQ_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSYSRQ_0700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPADSYSRQ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSYSRQ_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSYSRQ_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDELETE_0800
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDELETE_0800
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPADDELETE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDELETE_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDELETE_0800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPADDELETE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDELETE_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADDELETE_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT_0900
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT_0900
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT_0900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYNUMPADSUBTRACT_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMUTE_1000
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMUTE_1000
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYMUTE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMUTE_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMUTE_1000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYMUTE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMUTE_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYMUTE_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEDOWN_1100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEDOWN_1100
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYVOLUMEDOWN.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEDOWN_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEDOWN_1100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYVOLUMEDOWN();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEDOWN_1100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEDOWN_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEUP_1200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEUP_1200
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYVOLUMEUP.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEUP_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEUP_1200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYVOLUMEUP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEUP_1200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYVOLUMEUP_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN_1300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN_1300
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN_1300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN_1300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSDOWN_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSUP_1400
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSUP_1400
     * @tc.desc    : Test HidCreateDeviceKeyCodeKEYBRIGHTNESSUP.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSUP_1400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSUP_1400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYBRIGHTNESSUP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSUP_1400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYBRIGHTNESSUP_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1500
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1500
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN0.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN0();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN1_1600
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN1_1600
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN1.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN1_1600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN1_1600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN1();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN1_1600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN1_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN2_1700
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN2_1700
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN2.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN2_1700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN2_1700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN2();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN2_1700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN2_1700 catch err: " + err);
        expect().assertFail();
      }
    })


    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN3_1800
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN3_1800
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN3.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN3_1800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN3_1800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN3();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN3_1800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN3_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1900
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1900
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN4.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN4_1900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN4();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1900 catch err: " + err);
        expect().assertFail();
      }
    })
    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN5_2000
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN5_2000
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN0.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN5_2000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN5_2000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN5();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN0_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN5_2000 catch err: " + err);
        expect().assertFail();
      }
    })


    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN6_2100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN6_2100
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN6.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN6_2100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN6_2100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN6();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN6_2100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN6_2100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN7_2200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN7_2200
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN7.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN7_2200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN7_2200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN7();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN7_2200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN7_2200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN8_2300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN8_2300
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN8.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN8_2300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN8_2300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN8();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN8_2300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN8_2300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN9_2400
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN9_2400
     * @tc.desc    : Test HidCreateDeviceKeyCodeBIN9.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN9_2400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN9_2400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBIN9();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN9_2400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBIN9_2400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINLEFT_2500
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINLEFT_2500
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINLEFT.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINLEFT_2500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINLEFT_2500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINLEFT();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINLEFT_2500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINLEFT_2500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINMIDDLE_2600
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINMIDDLE_2600
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINMIDDLE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINMIDDLE_2600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINMIDDLE_2600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINMIDDLE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINMIDDLE_2600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINMIDDLE_2600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINSIDE_2700
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINSIDE_2700
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINSIDE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINSIDE_2700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINSIDE_2700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINSIDE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINSIDE_2700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINSIDE_2700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINEXTRA_2800
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINEXTRA_2800
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINEXTRA.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINEXTRA_2800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINEXTRA_2800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINEXTRA();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINEXTRA_2800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINEXTRA_2800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINFORWARD_2900
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINFORWARD_2900
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINFORWARD.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINFORWARD_2900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINFORWARD_2900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINFORWARD();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINFORWARD_2900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINFORWARD_2900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINBACKWARD_3000
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINBACKWARD_3000
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINBACKWARD.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINBACKWARD_3000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINBACKWARD_3000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINBACKWARD();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINBACKWARD_3000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINBACKWARD_3000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTASK_3100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTASK_3100
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINTASK.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTASK_3100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTASK_3100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINTASK();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTASK_3100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTASK_3100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLBRUSH_3200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLBRUSH_3200
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINTOOLBRUSH.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLBRUSH_3200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLBRUSH_3200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINTOOLBRUSH();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLBRUSH_3200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLBRUSH_3200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLPENCIL_3300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLPENCIL_3300
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINTOOLPENCIL.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLPENCIL_3300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLPENCIL_3300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINTOOLPENCIL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLPENCIL_3300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLPENCIL_3300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLAIRBRUSH_3400
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLAIRBRUSH_3400
     * @tc.desc    : Test HidCreateDeviceKeyCodeBINTOOLAIRBRUSH.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLAIRBRUSH_3400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLAIRBRUSH_3400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeBINTOOLAIRBRUSH();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLAIRBRUSH_3400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeBINTOOLAIRBRUSH_3400 catch err: " + err);
        expect().assertFail();
      }
    })
  })
}