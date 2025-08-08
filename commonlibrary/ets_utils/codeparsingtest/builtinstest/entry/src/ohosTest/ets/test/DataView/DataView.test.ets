/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

export default function DataViewTest() {
  describe('dataViewTest', () => {
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0100
     * @tc.name       : testDataViewSetuint320001
     * @tc.desc       : Test the function of the Interface setUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint320001";
      try {
        const buffer = new ArrayBuffer(16);
        const dView = new DataView(buffer);
        dView.setUint32(0, 3);
        let value = dView.getUint32(1);
        expect(value.toString()).assertEqual('768');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0200
     * @tc.name       : testDataViewSetuint320002
     * @tc.desc       : Test the function of the Interface setUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint320002";
      try {
        const buffer = new ArrayBuffer(16);
        const dView = new DataView(buffer);
        dView.setUint32(5, 3);
        let value = dView.getUint32(1);
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0300
     * @tc.name       : testDataViewSetuint320003
     * @tc.desc       : Test the function of the Interface setUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint320003";
      try {
        const buffer = new ArrayBuffer(16);
        const dView = new DataView(buffer);
        dView.setUint32(5.5, 3);
        let value = dView.getUint32(1);
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0400
     * @tc.name       : testDataViewSetuint320004
     * @tc.desc       : Test the function of the Interface setUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint320004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint320004";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint32(65535, 3);
        let value = dView.getUint32(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0500
     * @tc.name       : testDataViewSetuint320005
     * @tc.desc       : Test the function of the Interface setUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint320005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint320005";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint32(-1, 3);
        let value = dView.getUint32(0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0600
     * @tc.name       : testDataViewSetuint160001
     * @tc.desc       : Test the function of the Interface setUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint160001";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint16(0, 3);
        let value = dView.getUint16(0);
        expect(value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0700
     * @tc.name       : testDataViewSetuint160002
     * @tc.desc       : Test the function of the Interface setUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint160002";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint16(5, 3);
        let value = dView.getUint16(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0800
     * @tc.name       : testDataViewSetuint160003
     * @tc.desc       : Test the function of the Interface setUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint160003";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint16(5.5, 3);
        let value = dView.getUint16(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_0900
     * @tc.name       : testDataViewSetuint160004
     * @tc.desc       : Test the function of the Interface setUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetuint160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetuint160004";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint16(65535, 3);
        let value = dView.getUint16(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1000
     * @tc.name       : testDataViewSetUint160005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetUint160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetUint160005";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint16(-1, 3);
        let value = dView.getUint16(0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1100
     * @tc.name       : testDataViewSetUint80001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetUint80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetUint80001";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setUint8(0, 3);
        let value = dView.getUint8(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1200
     * @tc.name       : testDataViewSetUint80002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetUint80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetUint80002";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setUint8(5, 3);
        let value = dView.getUint8(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1300
     * @tc.name       : testDataViewSetUint80003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetUint80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetUint80003";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setUint8(5.5, 3);
        let value = dView.getUint8(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1400
     * @tc.name       : testDataViewSetUint80004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetUint80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetUint80004";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setUint8(65535, 3);
        let value = dView.getUint8(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1500
     * @tc.name       : testDataViewSetUint80005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetUint80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetUint80005";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setUint8(-1, 3);
        let value = dView.getUint8(0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1600
     * @tc.name       : testDataViewSetInt320001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt320001";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setInt32(0, 3);
        let value = dView.getInt32(1);
        expect(value).assertEqual(768);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1700
     * @tc.name       : testDataViewSetInt320002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt320002";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setInt32(5, 3);
        let value = dView.getInt32(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1800
     * @tc.name       : testDataViewSetInt320003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt320003";
      try {
        const buffer = new ArrayBuffer(64);
        const dView = new DataView(buffer);
        dView.setInt32(5.5, 3);
        let value = dView.getInt32(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_1900
     * @tc.name       : testDataViewSetInt320004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt320004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt320004";
      try {
        const buffer = new ArrayBuffer(10);
        const dView = new DataView(buffer);
        dView.setInt32(65535, 3);
        let value = dView.getInt32(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2000
     * @tc.name       : testDataViewSetInt320005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt320005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt320005";
      try {
        const buffer = new ArrayBuffer(10);
        const dView = new DataView(buffer);
        dView.setInt32(-1, 3);
        let value = dView.getInt32(0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex < 0");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2100
     * @tc.name       : testDataViewSetInt320001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt160001";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint16(0, 3);
        let value = dView.getUint16(1);
        expect(value.toString()).assertEqual('768');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2200
     * @tc.name       : testDataViewSetInt320002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt160002";
      try {
        const buffer = new ArrayBuffer(10);
        const dView = new DataView(buffer);
        dView.setUint16(5, 3);
        let value = dView.getUint16(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2300
     * @tc.name       : testDataViewSetInt320003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt320003";
      try {
        const buffer = new ArrayBuffer(10);
        const dView = new DataView(buffer);
        dView.setUint16(5.5, 3);
        let value = dView.getUint16(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2400
     * @tc.name       : testDataViewSetInt320004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt160004";
      try {
        const buffer = new ArrayBuffer(10);
        const dView = new DataView(buffer);
        dView.setUint16(65535, 3);
        let value = dView.getUint16(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2500
     * @tc.name       : testDataViewSetInt320005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt160005";
      try {
        const buffer = new ArrayBuffer(10);
        const dView = new DataView(buffer);
        dView.setInt16(-1, 3);
        let value = dView.getUint16(0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex < 0");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2600
     * @tc.name       : testDataViewSetInt80001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt80001";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint8(0, 3);
        let value = dView.getUint8(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2700
     * @tc.name       : testDataViewSetInt80002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt80002";
      try {
        const buffer = new ArrayBuffer(8);
        const dView = new DataView(buffer);
        dView.setUint8(5, 3);
        let value = dView.getUint8(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err).assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2800
     * @tc.name       : testDataViewSetInt80003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt80003";
      try {
        let buffer = new ArrayBuffer(8);
        let dView = new DataView(buffer);
        dView.setInt8(5.5, 3);
        let value = dView.getUint8(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_2900
     * @tc.name       : testDataViewSetInt80004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt80004";
      try {
        let value = new ArrayBuffer(8);
        let dView = new DataView(value);
        dView.setInt8(65535, 3);
        dView.getInt8(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3000
     * @tc.name       : testDataViewSetInt80005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetInt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetInt80005";
      try {
        let value = new ArrayBuffer(8);
        let dView = new DataView(value);
        dView.setInt8(-1, 3);
        dView.getInt8(0);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("getIndex < 0");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3100
     * @tc.name       : testDataViewFloat640001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetFloat640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat640001";
      try {
        let value = new ArrayBuffer(16);
        let dView = new DataView(value);
        dView.setFloat64(0, 3);
        let result = dView.getFloat64(1);
        expect(result.toString()).assertEqual('3.785766995733679e-270');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3200
     * @tc.name       : testDataViewFloat640002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetFloat640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat640002";
      try {
        let value = new ArrayBuffer(8);
        let dView = new DataView(value);
        dView.setFloat64(5, 3);
        let result = dView.getFloat64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3300
     * @tc.name       : testDataViewFloat640003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetFloat640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat640003";
      try {
        let value = new ArrayBuffer(8);
        let dView = new DataView(value);
        dView.setFloat64(5.5, 3);
        let result = dView.getFloat64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3400
     * @tc.name       : testDataViewFloat640004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetFloat640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat640004";
      try {
        let value = new ArrayBuffer(8);
        let dView = new DataView(value);
        dView.setFloat64(65535, 3);
        let result = dView.getFloat64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3500
     * @tc.name       : testDataViewFloat640005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetFloat640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat640005";
      try {
        let value = new ArrayBuffer(8);
        let dView = new DataView(value);
        dView.setFloat64(-1, 3);
        let result = dView.getFloat64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("getIndex < 0");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3600
     * @tc.name       : testDataViewFloat320001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetFloat320001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat320001";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setFloat32(0, 3);
        let value = dView.getFloat32(1);
        expect(value).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3700
     * @tc.name       : testDataViewSetFloat320002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetFloat320002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat320002";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setFloat32(1, 3);
        let value = dView.getFloat32(1);
        expect(value).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3800
     * @tc.name       : testDataViewSetFloat320003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetFloat320003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat320003";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setFloat32(5.5, 3);
        let value = dView.getFloat32(1);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_3900
     * @tc.name       : testDataViewSetFloat320004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetFloat320004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat320004";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setFloat32(65535, 3);
        let value = dView.getFloat32(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4000
     * @tc.name       : testDataViewSetFloat320005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetFloat320005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetFloat320005";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setFloat32(-1, 3);
        let value = dView.getFloat32(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex < 0");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4100
     * @tc.name       : testDataViewSetBigUint640001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetBigUint640001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetBigUint640001"
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setBigUint64(1, 4n);
        let value = dView.getBigUint64(1);
        expect(value).assertEqual(4n);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4200
     * @tc.name       : testDataViewSetBigUint640002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetBigUint640002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetBigUint640002";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setBigUint64(5, 4n);
        let value = dView.getBigUint64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4300
     * @tc.name       : testDataViewSetBigUint640003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetBigUint640003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetBigUint640003";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setBigUint64(5.5, 4n);
        let value = dView.getBigUint64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4400
     * @tc.name       : testDataViewSetBigUint640004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetBigUint640004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetBigUint640004";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setBigUint64(65535, 4n);
        let value = dView.getBigUint64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4500
     * @tc.name       : testDataViewSetBigUint640005
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testDataViewSetBigUint640005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewSetBigUint640005";
      try {
        const buffer = new ArrayBuffer(10);
        let dView = new DataView(buffer);
        dView.setBigUint64(-1, 4n);
        let value = dView.getBigUint64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex < 0");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4600
     * @tc.name       : testDataViewSetBigint640001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetBigint640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewSetBigint640001'
      try {
        let buffer = new ArrayBuffer(16);
        let dView = new DataView(buffer);
        dView.setBigInt64(0, 4n);
        let value = dView.getBigInt64(1);
        expect(value.toString()).assertEqual('1024')
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4700
     * @tc.name       : testDataViewSetBigint640002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetBigint640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewSetBigint640002'
      try {
        let buffer = new ArrayBuffer(8);
        let dView = new DataView(buffer);
        dView.setBigInt64(0, 4n);
        let value = dView.getBigInt64(1);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4800
     * @tc.name       : testDataViewSetBigint640003
     * @tc.desc       : Test the function of the Inerface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetBigint640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewSetBigint640003'
      try {
        let buffer = new ArrayBuffer(8);
        let dView = new DataView(buffer);
        dView.setBigInt64(0, 4n);
        let value = dView.getBigInt64(1);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_4900
     * @tc.name       : testDataViewSetBigint640004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetBigint640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewSetBigint640004'
      try {
        let buffer = new ArrayBuffer(8);
        let dView = new DataView(buffer);
        dView.setBigInt64(0, 4n);
        let value = dView.getBigInt64(1);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5000
     * @tc.name       : testDataViewByteOffset0001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewSetBigint640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewSetBigint640005'
      try {
        let buffer = new ArrayBuffer(8);
        let dView = new DataView(buffer);
        dView.setBigInt64(0, 4n);
        let value = dView.getBigInt64(1);
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual("getIndex +elementSize > viewSize")
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5100
     * @tc.name       : testDataViewByteOffset0001
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewByteOffset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewByteOffset0001'
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        let value = dataview.byteOffset;
        expect(value).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5200
     * @tc.name       : testDataViewByteOffset0002
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewByteOffset0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewByteOffset0002'
      try {
        const buffer = new ArrayBuffer(5.5);
        const dataview = new DataView(buffer);
        let value = dataview.byteOffset;
        expect(value).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5300
     * @tc.name       : testDataViewByteOffset0003
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewByteOffset0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewByteOffset0003'
      try {
        const buffer = new ArrayBuffer(65536);
        const dataview = new DataView(buffer);
        let value = dataview.byteOffset;
        expect(value).assertEqual(0)
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5400
     * @tc.name       : testDataViewByteOffset0004
     * @tc.desc       : Test the function of the Interface toExponential().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewByteOffset0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewByteOffset0004'
      try {
        const buffer = new ArrayBuffer(-1);
        const dataview = new DataView(buffer);
        let value = dataview.byteOffset;
        expect().assertFail()
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("integerIndex < 0 or integerIndex > SAFE_NUMBER");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5500
     * @tc.name       : testDataViewGetBigInt640001
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigInt640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetBigInt640001";
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigInt64(0);
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5600
     * @tc.name       : testDataViewGetBigInt640002
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigInt640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigInt640002';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigInt64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5700
     * @tc.name       : testDataViewGetBigInt640003
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigInt640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigInt640003';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigInt64(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5800
     * @tc.name       : testDataViewGetBigInt640004
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigInt640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigInt640004';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigInt64(5.5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_5900
     * @tc.name       : testDataViewGetBigInt640005
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigInt640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigInt640005';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigInt64(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6000
     * @tc.name       : testDataViewGetBigUint640001
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigUint640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigUint640001';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigUint64(0);
        expect(value.toString()).assertEqual('0');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6100
     * @tc.name       : testDataViewGetBigUint640002
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigUint640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigUint640002';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigUint64(5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6200
     * @tc.name       : testDataViewGetBigUint640003
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigUint640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigUint640003';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigUint64(5.5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6300
     * @tc.name       : testDataViewGetBigUint640004
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigUint640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigUint640004';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigUint64(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6400
     * @tc.name       : testDataViewGetBigUint640005
     * @tc.desc       : Test the function of the Interface getBigInt64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetBigUint640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetBigUint640005';
      try {
        const dataView = new DataView(new ArrayBuffer(8));
        const value = dataView.getBigUint64(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6500
     * @tc.name       : testDataViewGetFloat320001
     * @tc.desc       : Test the function of the Interface getFloat32.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat320001';
      try {
        const dataView = new DataView(new ArrayBuffer(4));
        const value = dataView.getFloat32(0);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6600
     * @tc.name       : testDataViewGetFloat320002
     * @tc.desc       : Test the function of the Interface getFloat32.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat320002';
      try {
        const dataView = new DataView(new ArrayBuffer(4));
        const value = dataView.getFloat32(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual("getIndex +elementSize > viewSize");
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6700
     * @tc.name       : testDataViewGetFloat320003
     * @tc.desc       : Test the function of the Interface getFloat32.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat320003';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat32(5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6800
     * @tc.name       : testDataViewGetFloat320004
     * @tc.desc       : Test the function of the Interface getFloat32.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat320004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat320004';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat32(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_6900
     * @tc.name       : testDataViewGetFloat320005
     * @tc.desc       : Test the function of the Interface getFloat32.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataView0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataView0069';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat32(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7000
     * @tc.name       : testDataViewGetFloat320006
     * @tc.desc       : Test the function of the Interface getFloat32.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat320006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat320006';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat32(5.5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7100
     * @tc.name       : testDataViewGetFloat640001
     * @tc.desc       : Test the function of the Interface getFloat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat640001';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        let res = dataview.getFloat64(0);
        expect(res).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7200
     * @tc.name       : testDataViewGetFloat640002
     * @tc.desc       : Test the function of the Interface getFloat64
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat640002';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat64(1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7300
     * @tc.name       : testDataViewGetFloat640003
     * @tc.desc       : Test the function of the Interface getFloat64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat640003';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat64(5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7400
     * @tc.name       : testDataViewGetFloat640004
     * @tc.desc       : Test the function of the Interface getFloat64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat640004';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat64(-1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7500
     * @tc.name       : testDataViewGetFloat640005
     * @tc.desc       : Test the function of the Interface getFloat64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat640005';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat64(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7600
     * @tc.name       : testDataViewGetFloat640006
     * @tc.desc       : Test the function of the Interface getFloat64.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetFloat640006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetFloat640006';
      try {
        const buffer = new ArrayBuffer(8);
        const dataview = new DataView(buffer);
        dataview.getFloat64(5.5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7700
     * @tc.name       : testDataViewGetInt80001
     * @tc.desc       : Test the function of the Interface getInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt80001';
      try {
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        view.setInt8(1, 0);
        const result = view.getInt8(0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7800
     * @tc.name       : testDataViewGetInt80002
     * @tc.desc       : Test the function of the Interface getInt8.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt80002';
      try {
        const buffer = new ArrayBuffer(16);
        const view = new DataView(buffer);
        const result = view.getInt8(1);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_7900
     * @tc.name       : testDataViewGetInt80003
     * @tc.desc       : Test the function of the interface getInt8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt80003';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        expect(dataView.getInt8(5)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8000
     * @tc.name       : testDataViewGetInt80004
     * @tc.desc       : Test the function of the interface getInt8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt80004';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt8(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8100
     * @tc.name       : testDataViewGetInt80005
     * @tc.desc       : Test the function of the interface getInt8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt80005';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt8(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8200
     * @tc.name       : testDataViewGetInt160001
     * @tc.desc       : Test the function of the interface getInt16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt160001';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        expect(dataView.getInt16(0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8300
     * @tc.name       : testDataViewGetInt160002
     * @tc.desc       : Test the function of the interface getInt16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt160002';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        expect(dataView.getInt16(1)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8400
     * @tc.name       : testDataViewGetInt160003
     * @tc.desc       : Test the function of the interface getInt16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt160003';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        expect(dataView.getInt16(5)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8500
     * @tc.name       : testDataViewGetInt160004
     * @tc.desc       : Test the function of the interface getInt16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt160004';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt16(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8600
     * @tc.name       : testDataViewGetInt160005
     * @tc.desc       : Test the function of the interface getInt16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt160005';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt16(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(`${err.message}`).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8700
     * @tc.name       : testDataViewGetInt320001
     * @tc.desc       : Test the function of the interface getInt32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt320001';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        expect(dataView.getInt32(0)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8800
     * @tc.name       : testDataViewGetInt320002
     * @tc.desc       : Test the function of the interface getInt32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = 'testDataViewGetInt320002';
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        expect(dataView.getInt32(1)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_8900
     * @tc.name       : testDataViewGetInt320003
     * @tc.desc       : Test the function of the interface getInt32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetInt320003";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt32(5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9000
     * @tc.name       : testDataViewGetInt320004
     * @tc.desc       : Test the function of the interface getInt32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt320004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetInt320004";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt32(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9100
     * @tc.name       : testDataViewGetInt320005
     * @tc.desc       : Test the function of the interface getInt32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt320005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetInt320005";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt32(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9200
     * @tc.name       : testDataViewGetInt320006
     * @tc.desc       : Test the function of the interface getInt32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetInt320006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetInt320006";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getInt32(5.5);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9300
     * @tc.name       : testDataViewGetUint80001
     * @tc.desc       : Test the function of the interface getUint8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint80001";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint8(0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9400
     * @tc.name       : testDataViewGetUint80002
     * @tc.desc       : Test the function of the interface getUint8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint80002";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint8(1);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9500
     * @tc.name       : testDataViewGetUint80003
     * @tc.desc       : Test the function of the interface getUint8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint80003";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint8(5);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9600
     * @tc.name       : testDataViewGetUint80004
     * @tc.desc       : Test the function of the interface getUint8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint80004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint80004";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getUint8(65535);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9700
     * @tc.name       : testDataViewGetUint80005
     * @tc.desc       : Test the function of the interface getUint8().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint80005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint80005";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        dataView.getUint8(-1);
        expect().assertFail();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect(err.message).assertEqual('getIndex < 0');
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9800
     * @tc.name       : testDataViewGetUint160001
     * @tc.desc       : Test the function of the interface getUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint160001";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint16(0);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_9900
     * @tc.name       : testDataViewGetUint160002
     * @tc.desc       : Test the function of the interface getUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint160002";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint16(1);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10000
     * @tc.name       : testDataViewGetUint160003
     * @tc.desc       : Test the function of the interface getUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint160003";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint16(5);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10100
     * @tc.name       : testDataViewGetUint160004
     * @tc.desc       : Test the function of the interface getUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint160004";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint16(5.5);
        // 断言结果应为0
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10200
     * @tc.name       : testDataViewGetUint160005
     * @tc.desc       : Test the function of the interface getUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint160005";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint16(65535);
        expect().assertFail();
      } catch (err) {
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10300
     * @tc.name       : testDataViewGetUint160006
     * @tc.desc       : Test the function of the interface getUint16().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint160006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint160006";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint16(-1);
        expect().assertFail();
      } catch (err) {
        expect(err.message).assertEqual('getIndex < 0');
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10400
     * @tc.name       : testDataViewGetUint320001
     * @tc.desc       : Test the function of the interface getUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint320001";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint32(0);
        // 断言结果应为0
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10500
     * @tc.name       : testDataViewGetUint320002
     * @tc.desc       : Test the function of the interface getUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint320002";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint32(1);
        console.info('Result of getUint32(1): ' + result);
        expect(result).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10600
     * @tc.name       : testDataViewGetUint320003
     * @tc.desc       : Test the function of the interface getUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint320003";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint32(5);
        expect().assertFail();
      } catch (err) {
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10700
     * @tc.name       : testDataViewGetUint320004
     * @tc.desc       : Test the function of the interface getUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint320004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint320004";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint32(5.5);
        expect().assertFail();
      } catch (err) {
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10800
     * @tc.name       : testDataViewGetUint160005
     * @tc.desc       : Test the function of the interface getUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint320005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint320005";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint32(65535);
        expect().assertFail();
      } catch (err) {
        expect(err.message).assertEqual('getIndex +elementSize > viewSize');
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_10900
     * @tc.name       : testDataViewGetUint320006
     * @tc.desc       : Test the function of the interface getUint32().
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewGetUint320006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewGetUint320006";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        const result = dataView.getUint32(-1);
        expect().assertFail();
      } catch (err) {
        expect(err.message).assertEqual('getIndex < 0');
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_11000
     * @tc.name       : testDataViewDataViewPrototypeByteLength0001
     * @tc.desc       : Test the function of the interface DataViewPrototypeByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewDataViewPrototypeByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewDataViewPrototypeByteLength0001";
      try {
        const buffer = new ArrayBuffer(8);
        const dataView = new DataView(buffer);
        let len = dataView.buffer.byteLength;
        expect(len).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_11100
     * @tc.name       : testDataViewDataViewPrototypeByteLength0002
     * @tc.desc       : Test the function of the interface DataViewPrototypeByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewDataViewPrototypeByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewDataViewPrototypeByteLength0002";
      try {
        const buffer = new ArrayBuffer(65536);
        const dataView = new DataView(buffer);
        let len = dataView.buffer.byteLength;
        expect(len).assertEqual(65536);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_11200
     * @tc.name       : testDataViewDataViewPrototypeByteLength0003
     * @tc.desc       : Test the function of the interface DataViewPrototypeByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewDataViewPrototypeByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewDataViewPrototypeByteLength0003";
      try {
        const buffer = new ArrayBuffer(-1);
        const dataView = new DataView(buffer);
        let len = dataView.buffer.byteLength;
        expect().assertFail();
      } catch (err) {
        expect(err.message).assertEqual('integerIndex < 0 or integerIndex > SAFE_NUMBER');
        console.error(`${TAG} failed, error: ${err.message}`);
      }
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_DATAVIEW_11300
     * @tc.name       : testDataViewDataViewPrototypeByteLength0004
     * @tc.desc       : Test the function of the interface DataViewPrototypeByteLength.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testDataViewDataViewPrototypeByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const TAG = "testDataViewDataViewPrototypeByteLength0004";
      try {
        const buffer = new ArrayBuffer(5.5);
        const dataView = new DataView(buffer);
        let len = dataView.buffer.byteLength;
        expect(len).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err.message}`);
        expect().assertFail();
      }
    })
  })
}