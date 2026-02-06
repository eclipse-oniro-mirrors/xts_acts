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
import baskddkerror from 'libbaskddkerrorcode.so'
import deviceManager from "@ohos.driver.deviceManager";

const Success = 0;
const USB_DDK_INVALID_PARAMETER = 401;
const TAG: string = "[HidEmitEventTest]";
export default function ActsUsbDDkTest() {
  let deviceId: number = -1;
  let dev: number = -1;
  describe('ActsUsbDDkTest', () => {

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
     * @tc.number  : SUB_Driver_Ext_UsbDdkAshmemAshmemFd_0100
     * @tc.name    : SUB_Driver_Ext_UsbDdkAshmemAshmemFd_0100
     * @tc.desc    : Test UsbDdkAshmemAshmemFd.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkAshmemAshmemFd_0100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemAshmemFd_0100 start====");
        let result:number = baskddkerror.UsbDdkAshmemAshmemFd();
        expect(result).assertEqual(USB_DDK_INVALID_PARAMETER);
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemAshmemFd_0100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkAshmemAshmemFd_0100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  :
     * @tc.name    : SUB_Driver_Ext_UsbDdkAshmemSize_0200
     * @tc.desc    : Test UsbDdkAshmemSize.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkAshmemSize_0200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemSize_0200 start====");
        let result:number = baskddkerror.UsbDdkAshmemSize();
        expect(result).assertEqual(USB_DDK_INVALID_PARAMETER);
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemSize_0200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkAshmemSize_0200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkAshmemAddress_0300
     * @tc.name    : SUB_Driver_Ext_UsbDdkAshmemAddress_0300
     * @tc.desc    : Test UsbDdkAshmemAddress.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkAshmemAddress_0300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemAddress_0300 start====");
        let result:number = baskddkerror.UsbDdkAshmemAddress();
        expect(result).assertEqual(USB_DDK_INVALID_PARAMETER);
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemAddress_0300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkAshmemAddress_0300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkAshmemOffset_0400
     * @tc.name    : SUB_Driver_Ext_UsbDdkAshmemOffset_0400
     * @tc.desc    : Test UsbDdkAshmemOffset.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkAshmemOffset_0400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemOffset_0400 start====");
        let result:number = baskddkerror.UsbDdkAshmemOffset();
        expect(result).assertEqual(USB_DDK_INVALID_PARAMETER);
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemOffset_0400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkAshmemOffset_0400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkAshmemBufferLength_0500
     * @tc.name    : SUB_Driver_Ext_UsbDdkAshmemBufferLength_0500
     * @tc.desc    : Test UsbDdkAshmemBufferLength.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkAshmemBufferLength_0500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemBufferLength_0500 start====");
        let result:number = baskddkerror.UsbDdkAshmemBufferLength();
        expect(result).assertEqual(USB_DDK_INVALID_PARAMETER);
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemBufferLength_0500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkAshmemBufferLength_0500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkAshmemTransferredLength_0600
     * @tc.name    : SUB_Driver_Ext_UsbDdkAshmemTransferredLength_0600
     * @tc.desc    : Test UsbDdkAshmemTransferredLength.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkAshmemTransferredLength_0600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemTransferredLength_0600 start====");
        let result:number = baskddkerror.UsbDdkAshmemTransferredLength();
        expect(result).assertEqual(USB_DDK_INVALID_PARAMETER);
        console.info("====>SUB_Driver_Ext_UsbDdkAshmemTransferredLength_0600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkAshmemTransferredLength_0600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkSuccess_0700
     * @tc.name    : SUB_Driver_Ext_UsbDdkSuccess_0700
     * @tc.desc    : Test UsbDdkSuccess.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkSuccess_0700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkSuccess_0700 start====");
        let result:number = baskddkerror.UsbDdkSuccess();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbDdkSuccess_0700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkSuccess_0700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkFailure_0800
     * @tc.name    : SUB_Driver_Ext_UsbDdkFailure_0800
     * @tc.desc    : Test UsbDdkFailure.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkFailure_0800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkFailure_0800 start====");
        let result:number = baskddkerror.UsbDdkFailure();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbDdkFailure_0800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkFailure_0800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkInvalidParameter_0900
     * @tc.name    : SUB_Driver_Ext_UsbDdkInvalidParameter_0900
     * @tc.desc    : Test UsbDdkInvalidParameter.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkInvalidParameter_0900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkInvalidParameter_0900 start====");
        let result:number = baskddkerror.UsbDdkInvalidParameter();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbDdkInvalidParameter_0900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkInvalidParameter_0900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkInvalidOperation_1000
     * @tc.name    : SUB_Driver_Ext_UsbDdkInvalidOperation_1000
     * @tc.desc    : Test UsbDdkInvalidOperation.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkInvalidOperation_1000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkInvalidOperation_1000 start====");
        let result:number = baskddkerror.UsbDdkInvalidOperation();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbDdkInvalidOperation_1000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkInvalidOperation_1000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbDdkNullPTR_1100
     * @tc.name    : SUB_Driver_Ext_UsbDdkNullPTR_1100
     * @tc.desc    : Test UsbDdkNullPTR.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbDdkNullPTR_1100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbDdkNullPTR_1100 start====");
        let result:number = baskddkerror.UsbDdkNullPTR();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbDdkNullPTR_1100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbDdkNullPTR_1100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralDdkInit_1200
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralDdkInit_1200
     * @tc.desc    : Test ScsiPeripheralDdkInit.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralDdkInit_1200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralDdkInit_1200 start====");
        let result:number = baskddkerror.ScsiPeripheralDdkInit();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralDdkInit_1200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralDdkInit_1200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralRelease_1300
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralRelease_1300
     * @tc.desc    : Test ScsiPeripheralRelease.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralRelease_1300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralRelease_1300 start====");
        let result:number = baskddkerror.ScsiPeripheralRelease();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralRelease_1300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralRelease_1300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralOpen_1400
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralOpen_1400
     * @tc.desc    : Test ScsiPeripheralOpen.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralOpen_1400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralOpen_1400 start====");
        let result:number = baskddkerror.ScsiPeripheralOpen(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralOpen_1400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralOpen_1400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralClose_1500
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralClose_1500
     * @tc.desc    : Test ScsiPeripheralClose.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralClose_1500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralClose_1500 start====");
        let result:number = baskddkerror.ScsiPeripheralClose(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralClose_1500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralClose_1500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralTestUnitReady_1600
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralTestUnitReady_1600
     * @tc.desc    : Test ScsiPeripheralTestUnitReady.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralTestUnitReady_1600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralTestUnitReady_1600 start====");
        let result:number = baskddkerror.ScsiPeripheralTestUnitReady(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralTestUnitReady_1600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralTestUnitReady_1600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralInquiry_1700
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralInquiry_1700
     * @tc.desc    : Test ScsiPeripheralClose.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralInquiry_1700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralInquiry_1700 start====");
        let result:number = baskddkerror.ScsiPeripheralInquiry(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralInquiry_1700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralInquiry_1700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralReadCapacity10_1800
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralReadCapacity10_1800
     * @tc.desc    : Test ScsiPeripheralReadCapacity10.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralReadCapacity10_1800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralReadCapacity10_1800 start====");
        let result:number = baskddkerror.ScsiPeripheralReadCapacity10(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralReadCapacity10_1800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralReadCapacity10_1800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralRequestSense_1900
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralRequestSense_1900
     * @tc.desc    : Test ScsiPeripheralRequestSense.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralRequestSense_1900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralRequestSense_1900 start====");
        let result:number = baskddkerror.ScsiPeripheralRequestSense(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralRequestSense_1900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralRequestSense_1900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralRead_2000
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralRead_2000
     * @tc.desc    : Test ScsiPeripheralRead.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralRead_2000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralRead_2000 start====");
        let result:number = baskddkerror.ScsiPeripheralRead(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralRead_2000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralRead_2000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralWrite_2100
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralWrite_2100
     * @tc.desc    : Test ScsiPeripheralWrite.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralWrite_2100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralWrite_2100 start====");
        let result:number = baskddkerror.ScsiPeripheralWrite(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralWrite_2100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralWrite_2100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralSendRequestByCDB_2300
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralSendRequestByCDB_2300
     * @tc.desc    : Test ScsiPeripheralSendRequestByCDB.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralSendRequestByCDB_2300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralSendRequestByCDB_2300 start====");
        let result:number = baskddkerror.ScsiPeripheralSendRequestByCDB(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralSendRequestByCDB_2300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralSendRequestByCDB_2300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralVerify10CONDITIONMET_2500
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralVerify10CONDITIONMET_2500
     * @tc.desc    : Test ScsiPeripheralVerify10CONDITIONMET.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralVerify10CONDITIONMET_2500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10CONDITIONMET_2500 start====");
        let result:number = baskddkerror.ScsiPeripheralVerify10CONDITIONMET(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10CONDITIONMET_2500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralVerify10CONDITIONMET_2500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralVerify10BUSY_2600
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralVerify10BUSY_2600
     * @tc.desc    : Test ScsiPeripheralVerify10BUSY.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralVerify10BUSY_2600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10BUSY_2600 start====");
        let result:number = baskddkerror.ScsiPeripheralVerify10BUSY(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10BUSY_2600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralVerify10BUSY_2600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralVerify10RESERVATIONCONFLICT_2700
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralVerify10RESERVATIONCONFLICT_2700
     * @tc.desc    : Test ScsiPeripheralVerify10RESERVATIONCONFLICT.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralVerify10RESERVATIONCONFLICT_2700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10RESERVATIONCONFLICT_2700 start====");
        let result:number = baskddkerror.ScsiPeripheralVerify10RESERVATIONCONFLICT(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10RESERVATIONCONFLICT_2700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralVerify10RESERVATIONCONFLICT_2700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralVerify10TASKSETFULL_2800
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralVerify10TASKSETFULL_2800
     * @tc.desc    : Test ScsiPeripheralVerify10TASKSETFULL.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralVerify10TASKSETFULL_2800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10TASKSETFULL_2800 start====");
        let result:number = baskddkerror.ScsiPeripheralVerify10TASKSETFULL(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10TASKSETFULL_2800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralVerify10TASKSETFULL_2800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralVerify10ACAACTIVE_2900
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralVerify10ACAACTIVE_2900
     * @tc.desc    : Test ScsiPeripheralVerify10ACAACTIVE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralVerify10ACAACTIVE_2900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10ACAACTIVE_2900 start====");
        let result:number = baskddkerror.ScsiPeripheralVerify10ACAACTIVE(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10ACAACTIVE_2900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralVerify10ACAACTIVE_2900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_ScsiPeripheralVerify10TASKABORTED_3000
     * @tc.name    : SUB_Driver_Ext_ScsiPeripheralVerify10TASKABORTED_3000
     * @tc.desc    : Test ScsiPeripheralVerify10TASKABORTED.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_ScsiPeripheralVerify10TASKABORTED_3000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10TASKABORTED_3000 start====");
        let result:number = baskddkerror.ScsiPeripheralVerify10TASKABORTED(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_ScsiPeripheralVerify10TASKABORTED_3000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_ScsiPeripheralVerify10TASKABORTED_3000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialInit_3100
     * @tc.name    : SUB_Driver_Ext_UsbSerialInit_3100
     * @tc.desc    : Test UsbSerialInit.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialInit_3100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialInit_3100 start====");
        let result:number = baskddkerror.UsbSerialInit();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialInit_3100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialInit_3100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialReleaseInitError_3200
     * @tc.name    : SUB_Driver_Ext_UsbSerialReleaseInitError_3200
     * @tc.desc    : Test UsbSerialReleaseInitError.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialReleaseInitError_3200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialReleaseInitError_3200 start====");
        let result:number = baskddkerror.UsbSerialReleaseInitError();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialReleaseInitError_3200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialReleaseInitError_3200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialCloseInitError_3300
     * @tc.name    : SUB_Driver_Ext_UsbSerialCloseInitError_3300
     * @tc.desc    : Test UsbSerialCloseInitError.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialCloseInitError_3300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialCloseInitError_3300 start====");
        let result:number = baskddkerror.UsbSerialCloseInitError(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialCloseInitError_3300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialCloseInitError_3300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialOpen_3400
     * @tc.name    : SUB_Driver_Ext_UsbSerialOpen_3400
     * @tc.desc    : Test UsbSerialOpen.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialOpen_3400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialOpen_3400 start====");
        let result:number = baskddkerror.UsbSerialOpen(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialOpen_3400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialOpen_3400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialRead_3600
     * @tc.name    : SUB_Driver_Ext_UsbSerialRead_3600
     * @tc.desc    : Test UsbSerialRead.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialRead_3600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialRead_3600 start====");
        let result:number = baskddkerror.UsbSerialRead(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialRead_3600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialRead_3600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialWrite_3700
     * @tc.name    : SUB_Driver_Ext_UsbSerialWrite_3700
     * @tc.desc    : Test UsbSerialWrite.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialWrite_3700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialWrite_3700 start====");
        let result:number = baskddkerror.UsbSerialWrite(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialWrite_3700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialWrite_3700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialSetBaudRate_3800
     * @tc.name    : SUB_Driver_Ext_UsbSerialSetBaudRate_3800
     * @tc.desc    : Test UsbSerialSetBaudRate.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialSetBaudRate_3800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialSetBaudRate_3800 start====");
        let result:number = baskddkerror.UsbSerialSetBaudRate(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialSetBaudRate_3800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialSetBaudRate_3800 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialSetParams_3900
     * @tc.name    : SUB_Driver_Ext_UsbSerialSetParams_3900
     * @tc.desc    : Test UsbSerialSetParams.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialSetParams_3900', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialSetParams_3900 start====");
        let result:number = baskddkerror.UsbSerialSetParams(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialSetParams_3900 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialSetParams_3900 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialSetTimeout_4000
     * @tc.name    : SUB_Driver_Ext_UsbSerialSetTimeout_4000
     * @tc.desc    : Test UsbSerialSetTimeout.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialSetTimeout_4000', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialSetTimeout_4000 start====");
        let result:number = baskddkerror.UsbSerialSetTimeout(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialSetTimeout_4000 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialSetTimeout_4000 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialSetFlowControl_4100
     * @tc.name    : SUB_Driver_Ext_UsbSerialSetFlowControl_4100
     * @tc.desc    : Test UsbSerialSetFlowControl.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialSetFlowControl_4100', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialSetFlowControl_4100 start====");
        let result:number = baskddkerror.UsbSerialSetFlowControl(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialSetFlowControl_4100 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialSetFlowControl_4100 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialFlush_4200
     * @tc.name    : SUB_Driver_Ext_UsbSerialFlush_4200
     * @tc.desc    : Test UsbSerialFlush.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialFlush_4200', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialFlush_4200 start====");
        let result:number = baskddkerror.UsbSerialFlush(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialFlush_4200 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialFlush_4200 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialFlushInput_4300
     * @tc.name    : SUB_Driver_Ext_UsbSerialFlushInput_4300
     * @tc.desc    : Test UsbSerialFlushInput.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialFlushInput_4300', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialFlushInput_4300 start====");
        let result:number = baskddkerror.UsbSerialFlushInput(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialFlushInput_4300 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialFlushInput_4300 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialFlushOutput_4400
     * @tc.name    : SUB_Driver_Ext_UsbSerialFlushOutput_4400
     * @tc.desc    : Test UsbSerialFlushOutput.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialFlushOutput_4400', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialFlushOutput_4400 start====");
        let result:number = baskddkerror.UsbSerialFlushOutput(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialFlushOutput_4400 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialFlushOutput_4400 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialNoFlowControl_4500
     * @tc.name    : SUB_Driver_Ext_UsbSerialNoFlowControl_4500
     * @tc.desc    : Test UsbSerialNoFlowControl.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialNoFlowControl_4500', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialNoFlowControl_4500 start====");
        let result:number = baskddkerror.UsbSerialNoFlowControl(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialNoFlowControl_4500 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialNoFlowControl_4500 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialHardwareFlowControl_4600
     * @tc.name    : SUB_Driver_Ext_UsbSerialHardwareFlowControl_4600
     * @tc.desc    : Test UsbSerialHardwareFlowControl.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialHardwareFlowControl_4600', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialHardwareFlowControl_4600 start====");
        let result:number = baskddkerror.UsbSerialHardwareFlowControl(deviceId);
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialHardwareFlowControl_4600 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialHardwareFlowControl_4600 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialParityNone_4700
     * @tc.name    : SUB_Driver_Ext_UsbSerialParityNone_4700
     * @tc.desc    : Test UsbSerialParityNone.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialParityNone_4700', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialParityNone_4700 start====");
        let result:number = baskddkerror.UsbSerialParityNone();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialParityNone_4700 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialParityNone_4700 catch err: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.number  : SUB_Driver_Ext_UsbSerialParityEven_4800
     * @tc.name    : SUB_Driver_Ext_UsbSerialParityEven_4800
     * @tc.desc    : Test UsbSerialParityEven.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_Driver_Ext_UsbSerialParityEven_4800', Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>SUB_Driver_Ext_UsbSerialParityEven_4800 start====");
        let result:number = baskddkerror.UsbSerialParityEven();
        expect(result).assertEqual(Success);
        console.info("====>SUB_Driver_Ext_UsbSerialParityEven_4800 result: " + result);
        done()
      } catch (err) {
        console.error("====>SUB_Driver_Ext_UsbSerialParityEven_4800 catch err: " + err);
        expect().assertFail();
      }
    })

  })
}