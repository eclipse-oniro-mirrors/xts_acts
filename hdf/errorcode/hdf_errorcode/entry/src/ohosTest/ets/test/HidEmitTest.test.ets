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

export default function ActsHidEmitCodeTest() {
  let deviceId: number = -1;
  describe('ActsHidEmitCodeTest', () => {
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
     * @tc.name   SUB_Driver_Ext_HidCreateDevicePropPointer_0100
     * @tc.number SUB_Driver_Ext_HidCreateDevicePropPointer_0100
     * @tc.desc   Test HidCreateDevicePropPointer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDevicePropPointer_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointer_0100 start====");
        let result: number = baskddkerror.HidCreateDevicePropPointer();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointer_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropPointer_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200
     * @tc.number SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200
     * @tc.desc   Test HidCreateDevicePropPointingStick.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200 start====");
        let result: number = baskddkerror.HidCreateDevicePropPointingStick();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropPointingStick_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300
     * @tc.number SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300
     * @tc.desc   Test HidCreateDevicePropButtonPad.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300 start====");
        let result: number = baskddkerror.HidCreateDevicePropButtonPad();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropButtonPad_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400
     * @tc.number SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400
     * @tc.desc   Test HidCreateDevicePropSemiMt.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400 start====");
        let result: number = baskddkerror.HidCreateDevicePropSemiMt();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropSemiMt_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500
     * @tc.number SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500
     * @tc.desc   Test HidCreateDevicePropTopButtonPad.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500 start====");
        let result: number = baskddkerror.HidCreateDevicePropTopButtonPad();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropTopButtonPad_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600
     * @tc.number SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600
     * @tc.desc   Test HidCreateDevicePropAccelerometer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600 start====");
        let result: number = baskddkerror.HidCreateDevicePropAccelerometer();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDevicePropAccelerometer_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700
     * @tc.number SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700
     * @tc.desc   Test HidCreateDeviceEventTypeHidEVRel.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700 start====");
        let result: number = baskddkerror.HidCreateDeviceEventTypeHidEVRel();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceEventTypeHidEVRel_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidSynEventReport_0800
     * @tc.number SUB_Driver_Ext_HidSynEventReport_0800
     * @tc.desc   Test HidSynEventReport.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidSynEventReport_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventReport_0800 start====");
        let result: number = baskddkerror.HidSynEventReport();
        expect(result).assertEqual(0);
        console.info("====>SUB_Driver_Ext_HidSynEventReport_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventReport_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidSynEventConfig_0900
     * @tc.number SUB_Driver_Ext_HidSynEventConfig_0900
     * @tc.desc   Test HidSynEventConfig.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidSynEventConfig_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventConfig_0900 start====");
        let result: number = baskddkerror.HidSynEventConfig();
        expect(result).assertEqual(0);
        console.info("====>SUB_Driver_Ext_HidSynEventConfig_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventConfig_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidSynEventMtReport_1000
     * @tc.number SUB_Driver_Ext_HidSynEventMtReport_1000
     * @tc.desc   Test HidSynEventMtReport.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidSynEventMtReport_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventMtReport_1000 start====");
        let result: number = baskddkerror.HidSynEventMtReport();
        expect(result).assertEqual(0);
        console.info("====>SUB_Driver_Ext_HidSynEventMtReport_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventMtReport_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidSynEventDropped_1100
     * @tc.number SUB_Driver_Ext_HidSynEventDropped_1100
     * @tc.desc   Test HidSynEventDropped.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidSynEventDropped_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidSynEventDropped_1100 start====");
        let result: number = baskddkerror.HidSynEventReport();
        expect(result).assertEqual(0);
        console.info("====>SUB_Driver_Ext_HidSynEventDropped_1100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidSynEventDropped_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYA();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYA_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYB.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYB();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYB_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYC();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYC_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYD.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYD();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYD_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYE();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYE_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYF.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYF();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYF_1700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYG.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYG();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYG_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYA.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYH();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYH_1900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYI();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYI_2000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYJ.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYJ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYJ_2100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYK();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYL_2300
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYL_2300
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYL_2300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYL_2300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYL();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYL_2300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYL_2300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYM_2400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYM_2400
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYM_2400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYM_2400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYM();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYM_2400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYM_2400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYN_2500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYN_2500
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYN_2500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYN_2500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYN();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYN_2500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYN_2500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYO_2600
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYO_2600
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYO_2600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYO_2600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYO();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYO_2600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYO_2600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYP_2700
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYP_2700
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYP_2700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYP_2700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYP();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYP_2700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYP_2700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYQ_2800
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYQ_2800
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYQ.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYQ_2800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYQ_2800 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYQ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYQ_2800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYQ_2800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYR_2900
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYR_2900
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYR.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYR_2900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYR_2900 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYR();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYR_2900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYR_2900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3000
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3000
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3000 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYS();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYT_3100
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYT_3100
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYT_3100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYT_3100 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYT();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYT_3100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYT_3100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYU_3200
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYU_3200
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYU.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYU_3200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYU_3200 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYU();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYU_3200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYK_2200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYV_3300
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYV_3300
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYV.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYV_3300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYV_3300 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYV();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYV_3300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYV_3300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYW_3400
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYW_3400
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYW.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYW_3400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYW_3400 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYW();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYW_3400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYW_3400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3500
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3500
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYS.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3500 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYS();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYS_3500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYY_3600
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYY_3600
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYY_3600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYY_3600 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYY();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYY_3600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYY_3600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYZ_3700
     * @tc.number SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYZ_3700
     * @tc.desc   Test HidCreateDeviceKeyCodeKEYZ.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYZ_3700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYZ_3700 start====");
        let result: number = baskddkerror.HidCreateDeviceKeyCodeKEYZ();
        expect(result >= 0).assertTrue();
        console.info("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYZ_3700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_HidCreateDeviceKeyCodeKEYZ_3700 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}