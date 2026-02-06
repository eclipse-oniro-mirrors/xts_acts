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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import serial from '@ohos.usbManager.serial';

const TAG: string = "[SerialAddApiTest]";

export default function SerialAddApiTest() {
  describe('SerialAddApiTest', () => {

    /**
     * @tc.name   testHasSerialRightNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0100
     * @tc.desc   hasSerialRight input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasSerialRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testHasSerialRightNull begin');
      try {
        let ret = serial.hasSerialRight(null);
        console.info(TAG, 'usb testHasSerialRightNull ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testHasSerialRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testHasSerialRightNull end');
    })

    /**
     * @tc.name   testHasSerialRightUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0200
     * @tc.desc   hasSerialRight input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testHasSerialRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testHasSerialRightUndefined begin');
      try {
        let ret = serial.hasSerialRight(undefined);
        console.info(TAG, 'usb testHasSerialRightUndefined ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testHasSerialRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testHasSerialRightUndefined end');
    })

    /**
     * @tc.name   testRequestSerialRightNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0300
     * @tc.desc   requestSerialRight input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestSerialRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testRequestSerialRightNull begin');
      try {
        let ret = serial.requestSerialRight(null);
        console.info(TAG, 'usb testRequestSerialRightNull ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testRequestSerialRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testRequestSerialRightNull end');
    })

    /**
     * @tc.name   testRequestSerialRightUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0400
     * @tc.desc   requestSerialRight input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testRequestSerialRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testRequestSerialRightUndefined begin');
      try {
        let ret = serial.requestSerialRight(undefined);
        console.info(TAG, 'usb testRequestSerialRightUndefined ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testRequestSerialRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testRequestSerialRightUndefined end');
    })

    /**
     * @tc.name   testCancelSerialRightNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0500
     * @tc.desc   cancelSerialRight input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRightNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testCancelSerialRightNull begin');
      try {
        serial.cancelSerialRight(null);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCancelSerialRightNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testCancelSerialRightNull end');
    })

    /**
     * @tc.name   testCancelSerialRightUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0600
     * @tc.desc   cancelSerialRight input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCancelSerialRightUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testCancelSerialRightUndefined begin');
      try {
        serial.cancelSerialRight(undefined);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCancelSerialRightUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testCancelSerialRightUndefined end');
    })

    /**
     * @tc.name   testOpenNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0700
     * @tc.desc   open input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpenNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testOpenNull begin');
      try {
        serial.open(null);
        done();
      } catch (err) {
        console.info(TAG, 'usb testOpenNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testOpenNull end');
    })

    /**
     * @tc.name   testOpenUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0800
     * @tc.desc   open input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpenUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testOpenUndefined begin');
      try {
        serial.open(undefined);
        done();
      } catch (err) {
        console.info(TAG, 'usb testOpenUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testOpenUndefined end');
    })

    /**
     * @tc.name   testCloseNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_0900
     * @tc.desc   close input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCloseNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testCloseNull begin');
      try {
        serial.close(null);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCloseNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testCloseNull end');
    })

    /**
     * @tc.name   testCloseUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1000
     * @tc.desc   close input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCloseUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testCloseUndefined begin');
      try {
        serial.close(undefined);
        done();
      } catch (err) {
        console.info(TAG, 'usb testCloseUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testCloseUndefined end');
    })

    /**
     * @tc.name   testGetAttributeNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1100
     * @tc.desc   getAttribute input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAttributeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testGetAttributeNull begin');
      try {
        let ret = serial.getAttribute(null);
        console.info(TAG, 'usb testGetAttributeNull ret:' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testGetAttributeNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testGetAttributeNull end');
    })

    /**
     * @tc.name   testGetAttributeUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1200
     * @tc.desc   getAttribute input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAttributeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testGetAttributeUndefined begin');
      try {
        let ret = serial.getAttribute(undefined);
        console.info(TAG, 'usb testGetAttributeUndefined ret:' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testGetAttributeUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testGetAttributeUndefined end');
    })

    /**
     * @tc.name   testSetAttributeNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1300
     * @tc.desc   setAttribute input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttributeNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testSetAttributeNull begin');
      try {
        let ret = serial.setAttribute(null, null);
        console.info(TAG, 'usb testSetAttributeNull ret:' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetAttributeNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testSetAttributeNull end');
    })

    /**
     * @tc.name   testSetAttributeUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1400
     * @tc.desc   setAttribute input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetAttributeUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testSetAttributeUndefined begin');
      try {
        let ret = serial.setAttribute(undefined, undefined);
        console.info(TAG, 'usb testSetAttributeUndefined ret:' + JSON.stringify(ret));
        done();
      } catch (err) {
        console.info(TAG, 'usb testSetAttributeUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testSetAttributeUndefined end');
    })

    /**
     * @tc.name   testReadNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1500
     * @tc.desc   read input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testReadNull begin');
      try {
        let ret = serial.read(null, null, null);
        console.info(TAG, 'usb testReadNull ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReadNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testReadNull end');
    })

    /**
     * @tc.name   testReadUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1600
     * @tc.desc   read input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testReadUndefined begin');
      try {
        let ret = serial.read(undefined, undefined, undefined);
        console.info(TAG, 'usb testReadUndefined ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReadUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testReadUndefined end');
    })

    /**
     * @tc.name   testReadSyncNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1700
     * @tc.desc   readSync input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadSyncNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testReadSyncNull begin');
      try {
        let ret = serial.readSync(null, null, null);
        console.info(TAG, 'usb testReadSyncNull ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReadSyncNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testReadSyncNull end');
    })

    /**
     * @tc.name   testReadSyncUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1800
     * @tc.desc   readSync input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReadSyncUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testReadSyncUndefined begin');
      try {
        let ret = serial.readSync(undefined, undefined, undefined);
        console.info(TAG, 'usb testReadSyncUndefined ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testReadSyncUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testReadSyncUndefined end');
    })

    /**
     * @tc.name   testWriteNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_1900
     * @tc.desc   write input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testWriteNull begin');
      try {
        let ret = serial.write(null, null, null);
        console.info(TAG, 'usb testWriteNull ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testWriteNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testWriteNull end');
    })

    /**
     * @tc.name   testWriteUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_2000
     * @tc.desc   write input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testWriteUndefined begin');
      try {
        let ret = serial.write(undefined, undefined, undefined);
        console.info(TAG, 'usb testWriteUndefined ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testWriteUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testWriteUndefined end');
    })

    /**
     * @tc.name   testWriteSyncNull
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_2100
     * @tc.desc   writeSync input parameter null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteSyncNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testWriteSyncNull begin');
      try {
        let ret = serial.writeSync(null, null, null);
        console.info(TAG, 'usb testWriteSyncNull ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testWriteSyncNull fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testWriteSyncNull end');
    })

    /**
     * @tc.name   testWriteSyncUndefined
     * @tc.number SUB_USB_HostMgr_Serial_AddFunc_2200
     * @tc.desc   writeSync input parameter undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWriteSyncUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info(TAG, 'testWriteSyncUndefined begin');
      try {
        let ret = serial.writeSync(undefined, undefined, undefined);
        console.info(TAG, 'usb testWriteSyncUndefined ret:' + ret);
        done();
      } catch (err) {
        console.info(TAG, 'usb testWriteSyncUndefined fail:' + JSON.stringify(err));
        expect(err.code).assertEqual(401);
        done();
      }
      console.info(TAG, 'testWriteSyncUndefined end');
    })
  })
}