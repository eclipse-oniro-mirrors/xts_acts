/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, beforeAll, afterAll, it, TestType, Size, Level } from '@ohos/hypium'
import hidEmitEvent from 'libhidemiteventndk.so'
import deviceManager from "@ohos.driver.deviceManager";


const TAG: string = "[HidEmitEventTest]";
const DEVICE_NOSUPPORT_ERRINFO: string = "The device does not support or cannot find hid_ddk_service;";
const HID_DDK_SUCCESS: number = 0;
const HID_DDK_INVALID_PARAMETER: number = 401;
const HID_DDK_TIMEOUT: number = 27300004;
const HID_DDK_INIT_ERROR: number = 27300005;
const HID_DDK_SERVICE_ERROR: number = 27300006;
const HID_DDK_MEMORY_ERROR: number  = 27300007;
const HID_DDK_IO_ERROR: number = 27300008;
const HID_DDK_DEVICE_NOT_FOUND: number = 27300009;

function IsDevcieSupport(errCode: number, caseName: string) {
  if (errCode == -3) {
    console.info(TAG, `Test result ${caseName} : ${DEVICE_NOSUPPORT_ERRINFO}`);
    expect('undefined').assertEqual(DEVICE_NOSUPPORT_ERRINFO);
  }
}

export default function HidEmitEventTest() {
  let deviceId: number = -1;
  describe('HidEmitEventTest', () => {

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
            (!hidEmitEvent.isHidDevice(device.deviceId))) {
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
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0100
     * @tc.name       : testHidCreateDevice0100
     * @tc.desc       : OH_Hid_CreateDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidCreateDevice0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidCreateDeviceOne();
      console.info(TAG, "Test result testHidCreateDevice0100 : " + ret);
      IsDevcieSupport(ret, 'testHidCreateDevice0100');
      expect(ret >= 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0800
     * @tc.name       : testHidCreateDevice0200
     * @tc.desc       : OH_Hid_CreateDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidCreateDevice0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidCreateDeviceTwo();
      console.info(TAG, "Test result testHidCreateDevice0200 : " + ret);
      IsDevcieSupport(ret, 'testHidCreateDevice0100');
      expect(ret == HID_DDK_INVALID_PARAMETER).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0900
     * @tc.name       : testHidCreateDevice0300
     * @tc.desc       : OH_Hid_CreateDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidCreateDevice0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidCreateDeviceThree();
      console.info(TAG, "Test result testHidCreateDevice0300 : " + ret);
      IsDevcieSupport(ret, 'testHidCreateDevice0100');
      expect(ret == HID_DDK_INVALID_PARAMETER).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0200
     * @tc.name       : testHidEmitEventOne0100
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventOne();
      console.info(TAG, "Test result testHidEmitEventOne0100 : " + ret);
      IsDevcieSupport(ret, 'testHidEmitEventOne0100');
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0300
     * @tc.name       : testHidEmitEventTwo0200
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventTwo();
      console.info(TAG, "Test result testHidEmitEventTwo0200 : " + ret);
      IsDevcieSupport(ret, 'testHidEmitEventTwo0200');
      expect(ret != 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0400
     * @tc.name       : testHidEmitEventThree0300
     * @tc.desc       : OH_Hid_EmitEvent Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidEmitEventThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidEmitEventThree();
      console.info(TAG, "Test result testHidEmitEventThree0300 : " + ret);
      IsDevcieSupport(ret, 'testHidEmitEventThree0300');
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0500
     * @tc.name       : testHidDestroyDeviceOne0100
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceOne();
      console.info(TAG, "Test result testHidDestroyDeviceOne0100 : " + ret);
      IsDevcieSupport(ret, 'testHidDestroyDeviceOne0100');
      expect(ret).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0600
     * @tc.name       : testHidDestroyDeviceTwo0200
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceTwo();
      console.info(TAG, "Test result testHidDestroyDeviceTwo0200 : " + ret);
      IsDevcieSupport(ret, 'testHidDestroyDeviceTwo0200');
      expect(ret != 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HIDDDK_0700
     * @tc.name       : testHidDestroyDeviceThree0300
     * @tc.desc       : OH_Hid_DestroyDevice Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testHidDestroyDeviceThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret = hidEmitEvent.hidDestroyDeviceThree();
      console.info(TAG, "Test result testHidDestroyDeviceThree0300 : " + ret);
      IsDevcieSupport(ret, 'testHidDestroyDeviceThree0300');
      expect(ret != 0).assertTrue();
      done()
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0100
     * @tc.name       : testHidInit001
     * @tc.desc       : OH_Hid_Init Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidInit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidInit001---------------------------');
      try {
        const ret = hidEmitEvent.hidInitOne();
        console.info("Test Result testHidInit001 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidInit001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0200
     * @tc.name       : testHidRelease001
     * @tc.desc       : OH_Hid_Release Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidRelease001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRelease001---------------------------');
      try {
        const ret = hidEmitEvent.hidReleaseOne();
        console.info("Test Result testHidRelease001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidRelease001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0300
     * @tc.name       : testHidRelease002
     * @tc.desc       : OH_Hid_Release Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidRelease002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRelease002---------------------------');
      try {
        const ret = hidEmitEvent.hidReleaseTwo();
        console.info("Test Result testHidRelease002 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidRelease002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0400
     * @tc.name       : testHidOpen001
     * @tc.desc       : OH_Hid_Open Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidOpen001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidOpenOne(deviceId);
        console.info("Test Result testHidOpen001 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidOpen001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0500
     * @tc.name       : testHidOpen002
     * @tc.desc       : OH_Hid_Open Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidOpen002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidOpenTwo(deviceId);
        console.info("Test Result testHidOpen002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidOpen002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0600
     * @tc.name       : testHidOpen003
     * @tc.desc       : OH_Hid_Open Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidOpen003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidOpenThree(deviceId);
        console.info("Test Result testHidOpen003 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidOpen003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0700
     * @tc.name       : testHidOpen004
     * @tc.desc       : OH_Hid_Open Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidOpen004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidOpenFour(deviceId);
        console.info("Test Result testHidOpen004 : " + ret);
        expect(ret).assertEqual(HID_DDK_DEVICE_NOT_FOUND);
        done();
      } catch (err) {
        console.error(TAG, `testHidOpen004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0800
     * @tc.name       : testHidClose001
     * @tc.desc       : OH_Hid_Close Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidClose001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidCloseOne(deviceId);
        console.info("Test Result testHidClose001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidClose001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_0900
     * @tc.name       : testHidClose002
     * @tc.desc       : OH_Hid_Close Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidClose002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidCloseTwo(deviceId);
        console.info("Test Result testHidClose002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidClose002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1000
     * @tc.name       : testHidClose003
     * @tc.desc       : OH_Hid_Close Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidClose003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidCloseThree(deviceId);
        console.info("Test Result testHidClose003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidClose003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1100
     * @tc.name       : testHidWrite001
     * @tc.desc       : OH_Hid_Write Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidWrite001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidWriteOne(deviceId);
        console.info("Test Result testHidWrite001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidWrite001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1200
     * @tc.name       : testHidWrite002
     * @tc.desc       : OH_Hid_Write Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidWrite002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidWriteTwo(deviceId);
        console.info("Test Result testHidWrite002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidWrite002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1300
     * @tc.name       : testHidWrite003
     * @tc.desc       : OH_Hid_Write Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidWrite003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidWriteThree(deviceId);
        console.info("Test Result testHidWrite003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidWrite003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1400
     * @tc.name       : testHidReadTimeout001
     * @tc.desc       : OH_Hid_ReadTimeout Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidReadTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidReadTimeout001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadTimeoutOne(deviceId);
        console.info("Test Result testHidReadTimeout001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidReadTimeout001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1500
     * @tc.name       : testHidReadTimeout002
     * @tc.desc       : OH_Hid_ReadTimeout Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidReadTimeout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidReadTimeout002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadTimeoutTwo(deviceId);
        console.info("Test Result testHidReadTimeout002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidReadTimeout002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1600
     * @tc.name       : testHidReadTimeout003
     * @tc.desc       : OH_Hid_ReadTimeout Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidReadTimeout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidReadTimeout003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadTimeoutThree(deviceId);
        console.info("Test Result testHidReadTimeout003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidReadTimeout003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1700
     * @tc.name       : testHidReadTimeout004
     * @tc.desc       : OH_Hid_ReadTimeout Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidReadTimeout004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidReadTimeout004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadTimeoutFour(deviceId);
        console.info("Test Result testHidReadTimeout004 : " + ret);
        expect(ret).assertEqual(HID_DDK_TIMEOUT);
        done();
      } catch (err) {
        console.error(TAG, `testHidReadTimeout004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1800
     * @tc.name       : testHidRead001
     * @tc.desc       : OH_Hid_Read Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRead001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadOne(deviceId);
        console.info("Test Result testHidRead001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidRead001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_1900
     * @tc.name       : testHidRead002
     * @tc.desc       : OH_Hid_Read Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRead002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadTwo(deviceId);
        console.info("Test Result testHidRead002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidRead002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2000
     * @tc.name       : testHidRead003
     * @tc.desc       : OH_Hid_Read Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRead003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadThree(deviceId);
        console.info("Test Result testHidRead003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidRead003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2100
     * @tc.name       : testHidRead004
     * @tc.desc       : OH_Hid_Read Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidRead004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidReadFour(deviceId);
        console.info("Test Result testHidRead004 : " + ret);
        expect(ret).assertEqual(HID_DDK_TIMEOUT);
        done();
      } catch (err) {
        console.error(TAG, `testHidRead004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2200
     * @tc.name       : testHidSetNonBlocking001
     * @tc.desc       : OH_Hid_SetNonBlocking Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSetNonBlocking001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSetNonBlocking001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSetNonBlockingOne(deviceId);
        console.info("Test Result testHidSetNonBlocking001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidSetNonBlocking001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2300
     * @tc.name       : testHidSetNonBlocking002
     * @tc.desc       : OH_Hid_SetNonBlocking Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSetNonBlocking002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSetNonBlocking002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSetNonBlockingTwo(deviceId);
        console.info("Test Result testHidSetNonBlocking002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidSetNonBlocking002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2400
     * @tc.name       : testHidSetNonBlocking003
     * @tc.desc       : OH_Hid_SetNonBlocking Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSetNonBlocking003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSetNonBlocking003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSetNonBlockingThree(deviceId);
        console.info("Test Result testHidSetNonBlocking003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidSetNonBlocking003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2500
     * @tc.name       : testHidGetRawInfo001
     * @tc.desc       : OH_Hid_GetRawInfo Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawInfo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawInfo001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawInfoOne(deviceId);
        console.info("Test Result testHidGetRawInfo001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawInfo001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2600
     * @tc.name       : testHidGetRawInfo002
     * @tc.desc       : OH_Hid_GetRawInfo Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawInfo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawInfo002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawInfoTwo(deviceId);
        console.info("Test Result testHidGetRawInfo002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawInfo002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2700
     * @tc.name       : testHidGetRawInfo003
     * @tc.desc       : OH_Hid_GetRawInfo Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawInfo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawInfo003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawInfoThree(deviceId);
        console.info("Test Result testHidGetRawInfo003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawInfo003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2800
     * @tc.name       : testHidGetRawName001
     * @tc.desc       : OH_Hid_GetRawName Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawName001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawName001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawNameOne(deviceId);
        console.info("Test Result testHidGetRawName001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawName001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_2900
     * @tc.name       : testHidGetRawName002
     * @tc.desc       : OH_Hid_GetRawName Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawName002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawName002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawNameTwo(deviceId);
        console.info("Test Result testHidGetRawName002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawName002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3000
     * @tc.name       : testHidGetRawName003
     * @tc.desc       : OH_Hid_GetRawName Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawName003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawName003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawNameThree(deviceId);
        console.info("Test Result testHidGetRawName003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawName003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3100
     * @tc.name       : testHidGetPhysicalAddress001
     * @tc.desc       : OH_Hid_GetPhysicalAddress Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetPhysicalAddress001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetPhysicalAddress001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetPhysicalAddressOne(deviceId);
        console.info("Test Result testHidGetPhysicalAddress001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetPhysicalAddress001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3200
     * @tc.name       : testHidGetPhysicalAddress002
     * @tc.desc       : OH_Hid_GetPhysicalAddress Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetPhysicalAddress002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetPhysicalAddress002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetPhysicalAddressTwo(deviceId);
        console.info("Test Result testHidGetPhysicalAddress002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetPhysicalAddress002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3300
     * @tc.name       : testHidGetPhysicalAddress003
     * @tc.desc       : OH_Hid_GetPhysicalAddress Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetPhysicalAddress003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetPhysicalAddress003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetPhysicalAddressThree(deviceId);
        console.info("Test Result testHidGetPhysicalAddress003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetPhysicalAddress003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3400
     * @tc.name       : testHidGetRawUniqueId001
     * @tc.desc       : OH_Hid_GetRawUniqueId Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawUniqueId001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawUniqueId001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawUniqueIdOne(deviceId);
        console.info("Test Result testHidGetRawUniqueId001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawUniqueId001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3500
     * @tc.name       : testHidGetRawUniqueId002
     * @tc.desc       : OH_Hid_GetRawUniqueId Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawUniqueId002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawUniqueId002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawUniqueIdTwo(deviceId);
        console.info("Test Result testHidGetRawUniqueId002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawUniqueId002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3600
     * @tc.name       : testHidGetRawUniqueId003
     * @tc.desc       : OH_Hid_GetRawUniqueId Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetRawUniqueId003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetRawUniqueId003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetRawUniqueIdThree(deviceId);
        console.info("Test Result testHidGetRawUniqueId003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetRawUniqueId003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3700
     * @tc.name       : testHidSendReport001
     * @tc.desc       : OH_Hid_SendReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSendReport001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSendReport001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSendReportOne(deviceId);
        console.info("Test Result testHidSendReport001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidSendReport001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3800
     * @tc.name       : testHidSendReport002
     * @tc.desc       : OH_Hid_SendReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSendReport002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSendReport002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSendReportTwo(deviceId);
        console.info("Test Result testHidSendReport002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidSendReport002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_3900
     * @tc.name       : testHidSendReport003
     * @tc.desc       : OH_Hid_SendReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSendReport003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSendReport003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSendReportThree(deviceId);
        console.info("Test Result testHidSendReport003 : " + ret);
        done();
      } catch (err) {
        console.error(TAG, `testHidSendReport003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4000
     * @tc.name       : testHidSendReport004
     * @tc.desc       : OH_Hid_SendReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSendReport004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSendReport004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSendReportFour(deviceId);
        console.info("Test Result testHidSendReport004 : " + ret);
        done();
      } catch (err) {
        console.error(TAG, `testHidSendReport004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4100
     * @tc.name       : testHidSendReport005
     * @tc.desc       : OH_Hid_SendReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidSendReport005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidSendReport005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidSendReportFive(deviceId);
        console.info("Test Result testHidSendReport005 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidSendReport005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4200
     * @tc.name       : testHidGetReport001
     * @tc.desc       : OH_Hid_GetReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReport001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReport001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportOne(deviceId);
        console.info("Test Result testHidGetReport001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReport001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4300
     * @tc.name       : testHidGetReport002
     * @tc.desc       : OH_Hid_GetReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReport002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReport002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportTwo(deviceId);
        console.info("Test Result testHidGetReport002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReport002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4400
     * @tc.name       : testHidGetReport003
     * @tc.desc       : OH_Hid_GetReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReport003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReport003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportThree(deviceId);
        console.info("Test Result testHidGetReport003 : " + ret);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReport003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4500
     * @tc.name       : testHidGetReport004
     * @tc.desc       : OH_Hid_GetReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReport004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReport004---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportFour(deviceId);
        console.info("Test Result testHidGetReport004 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReport004 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4600
     * @tc.name       : testHidGetReport005
     * @tc.desc       : OH_Hid_GetReport Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReport005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReport005---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportFive(deviceId);
        console.info("Test Result testHidGetReport005 : " + ret);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReport005 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4700
     * @tc.name       : testHidGetReportDescriptor001
     * @tc.desc       : OH_Hid_GetReportDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReportDescriptor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReportDescriptor001---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportDescriptorOne(deviceId);
        console.info("Test Result testHidGetReportDescriptor001 : " + ret);
        expect(ret).assertEqual(HID_DDK_INIT_ERROR);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReportDescriptor001 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4800
     * @tc.name       : testHidGetReportDescriptor002
     * @tc.desc       : OH_Hid_GetReportDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReportDescriptor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReportDescriptor002---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportDescriptorTwo(deviceId);
        console.info("Test Result testHidGetReportDescriptor002 : " + ret);
        expect(ret).assertEqual(HID_DDK_INVALID_PARAMETER);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReportDescriptor002 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number     : SUB_Driver_Ext_HID_DDK_4900
     * @tc.name       : testHidGetReportDescriptor003
     * @tc.desc       : OH_Hid_GetReportDescriptor Interface testing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testHidGetReportDescriptor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('----------------------testHidGetReportDescriptor003---------------------------');
      try {
        if (deviceId < 0) {
          console.info("Test HID device not connected");
          expect(true).assertTrue();
          done();
          return;
        }
        console.info("Test HID deviceId = " + deviceId);
        const ret = hidEmitEvent.hidGetReportDescriptorThree(deviceId);
        console.info("Test Result testHidGetReportDescriptor003 : " + ret);
        expect(ret).assertEqual(HID_DDK_SUCCESS);
        done();
      } catch (err) {
        console.error(TAG, `testHidGetReportDescriptor003 failed, message is ${err.message}`);
        expect(false).assertTrue();
        done();
      }
    });
  })
}
