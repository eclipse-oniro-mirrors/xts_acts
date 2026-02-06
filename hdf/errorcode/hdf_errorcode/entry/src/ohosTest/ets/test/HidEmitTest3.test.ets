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

export default function ActsHidEmitCodeTest3() {
  let deviceId: number = -1;
  describe('ActsHidEmitCodeTest3', () => {
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
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLFINGER_0100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLFINGER_0100
     * @tc.desc    : Test HidCreateDeviceKeyCodeTOOLFINGER.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLFINGER_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLFINGER_0100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeTOOLFINGER();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLFINGER_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLFINGER_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLMOUSE_0200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLMOUSE_0200
     * @tc.desc    : Test HidCreateDeviceKeyCodeTOOLMOUSE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLMOUSE_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLMOUSE_0200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeTOOLMOUSE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLMOUSE_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLMOUSE_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLLENS_0300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLLENS_0300
     * @tc.desc    : Test HidCreateDeviceKeyCodeTOOLLENS.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLLENS_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLLENS_0300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeTOOLLENS();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLLENS_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLLENS_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUINTTAP_0400
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUINTTAP_0400
     * @tc.desc    : Test HidCreateDeviceKeyCodeTOOLQUINTTAP.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUINTTAP_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUINTTAP_0400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeTOOLQUINTTAP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUINTTAP_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUINTTAP_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS3_0500
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS3_0500
     * @tc.desc    : Test HidCreateDeviceKeyCodeSTYLUS3.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS3_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS3_0500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeSTYLUS3();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS3_0500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS3_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS2_0600
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS2_0600
     * @tc.desc    : Test HidCreateDeviceKeyCodeSTYLUS2.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS2_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS2_0600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeSTYLUS2();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS2_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeSTYLUS2_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLDOUBLETAP_0700
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLDOUBLETAP_0700
     * @tc.desc    : Test HidCreateDeviceKeyCodeTOOLDOUBLETAP.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLDOUBLETAP_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLDOUBLETAP_0700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeTOOLDOUBLETAP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLDOUBLETAP_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLDOUBLETAP_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLTRIPLETAP_0800
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLTRIPLETAP_0800
     * @tc.desc    : Test HidCreateDeviceKeyCodeTOOLTRIPLETAP.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLTRIPLETAP_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLTRIPLETAP_0800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeTOOLTRIPLETAP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLTRIPLETAP_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLTRIPLETAP_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUADTAP_0900
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUADTAP_0900
     * @tc.desc    : Test HidCreateDeviceKeyCodeTOOLQUADTAP.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUADTAP_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUADTAP_0900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeTOOLQUADTAP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUADTAP_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeTOOLQUADTAP_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceKeyCodeWHEEL_1000
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceKeyCodeWHEEL_1000
     * @tc.desc    : Test HidCreateDeviceKeyCodeWHEEL.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeWHEEL_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeWHEEL_1000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeWHEEL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeWHEEL_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeWHEEL_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSZ_1100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSZ_1100
     * @tc.desc    : Test HidCreateDeviceABSZ.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSZ_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSZ_1100 start====");
        let result: number = baskddkerror.HidCreateDeviceABSZ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSZ_1100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSZ_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSRX_1200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSRX_1200
     * @tc.desc    : Test HidCreateDeviceABSRX.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSRX_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRX_1200 start====");
        let result: number = baskddkerror.HidCreateDeviceABSRX();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRX_1200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSRX_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSRY_1300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSRY_1300
     * @tc.desc    : Test HidCreateDeviceABSRY.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSRY_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRY_1300 start====");
        let result: number = baskddkerror.HidCreateDeviceABSRY();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRY_1300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSRY_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSRZ_1400
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSRZ_1400
     * @tc.desc    : Test HidCreateDeviceABSRZ.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSRZ_1400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRZ_1400 start====");
        let result: number = baskddkerror.HidCreateDeviceABSRZ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRZ_1400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSRZ_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSTHROTTLE_1500
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSTHROTTLE_1500
     * @tc.desc    : Test HidCreateDeviceABSTHROTTLE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSTHROTTLE_1500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTHROTTLE_1500 start====");
        let result: number = baskddkerror.HidCreateDeviceABSTHROTTLE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTHROTTLE_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSTHROTTLE_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSRUDDER_1600
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSRUDDER_1600
     * @tc.desc    : Test HidCreateDeviceABSRUDDER.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSRUDDER_1600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRUDDER_1600 start====");
        let result: number = baskddkerror.HidCreateDeviceABSRUDDER();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSRUDDER_1600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSRUDDER_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSWHEEL_1700
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSWHEEL_1700
     * @tc.desc    : Test HidCreateDeviceABSWHEEL.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSWHEEL_1700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSWHEEL_1700 start====");
        let result: number = baskddkerror.HidCreateDeviceABSWHEEL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSWHEEL_1700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSWHEEL_1700 catch err: " + err);
        expect().assertFail();
      }
    })


    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSGAS_1800
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSGAS_1800
     * @tc.desc    : Test HidCreateDeviceABSGAS.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSGAS_1800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSGAS_1800 start====");
        let result: number = baskddkerror.HidCreateDeviceABSGAS();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSGAS_1800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSGAS_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSBRAKE_1900
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSBRAKE_1900
     * @tc.desc    : Test HidCreateDeviceABSBRAKE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSBRAKE_1900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSBRAKE_1900 start====");
        let result: number = baskddkerror.HidCreateDeviceABSBRAKE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSBRAKE_1900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSBRAKE_1900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT0X_2000
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT0X_2000
     * @tc.desc    : Test HidCreateDeviceABSHAT0X.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT0X_2000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT0X_2000 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT0X();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT0X_2000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT0X_2000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT0Y_2100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT0Y_2100
     * @tc.desc    : Test HidCreateDeviceABSHAT0Y.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT0Y_2100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT0Y_2100 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT0Y();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT0Y_2100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT0Y_2100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT1X_2200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT1X_2200
     * @tc.desc    : Test HidCreateDeviceABSHAT1X.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT1X_2200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT1X_2200 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT1X();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT1X_2200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT1X_2200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT1Y_2300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT1Y_2300
     * @tc.desc    : Test HidCreateDeviceABSHAT1Y.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT1Y_2300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT1Y_2300 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT1Y();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT1Y_2300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT1Y_2300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT2X_2400
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT2X_2400
     * @tc.desc    : Test HidCreateDeviceABSHAT2X.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT2X_2400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT2X_2400 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT2X();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT2X_2400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT2X_2400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT2Y_2500
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT2Y_2500
     * @tc.desc    : Test HidCreateDeviceABSHAT2Y.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT2Y_2500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT2Y_2500 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT2Y();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT2Y_2500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT2Y_2500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT3X_2600
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT3X_2600
     * @tc.desc    : Test HidCreateDeviceABSHAT3X.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT3X_2600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT3X_2600 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT3X();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT3X_2600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT3X_2600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSHAT3Y_2700
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSHAT3Y_2700
     * @tc.desc    : Test HidCreateDeviceABSHAT3Y.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSHAT3Y_2700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT3Y_2700 start====");
        let result: number = baskddkerror.HidCreateDeviceABSHAT3Y();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSHAT3Y_2700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSHAT3Y_2700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSDISTANCE_2800
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSDISTANCE_2800
     * @tc.desc    : Test HidCreateDeviceABSDISTANCE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSDISTANCE_2800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSDISTANCE_2800 start====");
        let result: number = baskddkerror.HidCreateDeviceABSDISTANCE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSDISTANCE_2800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSDISTANCE_2800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSTILTX_2900
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSTILTX_2900
     * @tc.desc    : Test HidCreateDeviceABSTILTX.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSTILTX_2900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTILTX_2900 start====");
        let result: number = baskddkerror.HidCreateDeviceABSTILTX();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTILTX_2900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSTILTX_2900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSTILTY_3000
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSTILTY_3000
     * @tc.desc    : Test HidCreateDeviceABSTILTY.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSTILTY_3000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTILTY_3000 start====");
        let result: number = baskddkerror.HidCreateDeviceABSTILTY();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTILTY_3000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSTILTY_3000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSTOOLWIDTH_3100
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSTOOLWIDTH_3100
     * @tc.desc    : Test HidCreateDeviceABSTOOLWIDTH.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSTOOLWIDTH_3100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTOOLWIDTH_3100 start====");
        let result: number = baskddkerror.HidCreateDeviceABSTOOLWIDTH();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSTOOLWIDTH_3100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSTOOLWIDTH_3100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSVOLUME_3200
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSVOLUME_3200
     * @tc.desc    : Test HidCreateDeviceABSVOLUME.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSVOLUME_3200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSVOLUME_3200 start====");
        let result: number = baskddkerror.HidCreateDeviceABSVOLUME();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSVOLUME_3200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSVOLUME_3200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_HidCreateDeviceABSMISC_3300
     * @tc.name    : SUB_Driver_Ext_HidCreateDeviceABSMISC_3300
     * @tc.desc    : Test HidCreateDeviceABSMISC.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_HidCreateDeviceABSMISC_3300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSMISC_3300 start====");
        let result: number = baskddkerror.HidCreateDeviceABSMISC();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceABSMISC_3300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceABSMISC_3300 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}