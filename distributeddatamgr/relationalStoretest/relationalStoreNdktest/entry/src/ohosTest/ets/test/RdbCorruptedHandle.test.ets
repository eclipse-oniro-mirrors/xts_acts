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

import { hilog } from '@kit.PerformanceAnalysisKit';
import testndk from 'libcorrupted.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

const TAG = ["Relational_Recovery"]

export default function reltioanlStoreCorruptedTest() {
  describe('reltioanlStoreCorruptedTest', () => {
    beforeAll(() => {
      console.info( TAG + "beforeAll" );
    })
    beforeEach(async () => {
      console.info( TAG + "beforeEach" );
      await testndk.async();
    })
    afterEach(() => {
      console.info( TAG + "afterEach" );
    })
    afterAll(() => {
      console.info( TAG + "afterAll" );
    })

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0100
     * @tc.name RdbStoreCorruptHandlerTest_0100
     * @tc.desc RdbStoreCorruptHandlerTest_0100
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0100();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0200
     * @tc.name RdbStoreCorruptHandlerTest_0200
     * @tc.desc RdbStoreCorruptHandlerTest_0200
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0200();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0300
     * @tc.name RdbStoreCorruptHandlerTest_0300
     * @tc.desc RdbStoreCorruptHandlerTest_0300
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0300();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0400
     * @tc.name RdbStoreCorruptHandlerTest_0400
     * @tc.desc RdbStoreCorruptHandlerTest_0400
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0400();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0500
     * @tc.name RdbStoreCorruptHandlerTest_0500
     * @tc.desc RdbStoreCorruptHandlerTest_0500
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0500();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0600
     * @tc.name RdbStoreCorruptHandlerTest_0600
     * @tc.desc RdbStoreCorruptHandlerTest_0600
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0600();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0700
     * @tc.name RdbStoreCorruptHandlerTest_0700
     * @tc.desc RdbStoreCorruptHandlerTest_0700
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0700();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0800
     * @tc.name RdbStoreCorruptHandlerTest_0800
     * @tc.desc RdbStoreCorruptHandlerTest_0800
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0800();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_0900
     * @tc.name RdbStoreCorruptHandlerTest_0900
     * @tc.desc RdbStoreCorruptHandlerTest_0900
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_0900();
      console.info(TAG + "RdbStoreCorruptHandlerTest_0900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1000
     * @tc.name RdbStoreCorruptHandlerTest_1000
     * @tc.desc RdbStoreCorruptHandlerTest_1000
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1000();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1100
     * @tc.name RdbStoreCorruptHandlerTest_1100
     * @tc.desc RdbStoreCorruptHandlerTest_1100
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1100();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1200
     * @tc.name RdbStoreCorruptHandlerTest_1200
     * @tc.desc RdbStoreCorruptHandlerTest_1200
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1200();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1300
     * @tc.name RdbStoreCorruptHandlerTest_1300
     * @tc.desc RdbStoreCorruptHandlerTest_1300
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1300();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1400
     * @tc.name RdbStoreCorruptHandlerTest_1400
     * @tc.desc RdbStoreCorruptHandlerTest_1400
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1400();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1500
     * @tc.name RdbStoreCorruptHandlerTest_1500
     * @tc.desc RdbStoreCorruptHandlerTest_1500
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1500();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1600
     * @tc.name RdbStoreCorruptHandlerTest_1600
     * @tc.desc RdbStoreCorruptHandlerTest_1600
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1600();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1700
     * @tc.name RdbStoreCorruptHandlerTest_1700
     * @tc.desc RdbStoreCorruptHandlerTest_1700
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1700();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1800
     * @tc.name RdbStoreCorruptHandlerTest_1800
     * @tc.desc RdbStoreCorruptHandlerTest_1800
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1800();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1800 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_1900
     * @tc.name RdbStoreCorruptHandlerTest_1900
     * @tc.desc RdbStoreCorruptHandlerTest_1900
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_1900();
      console.info(TAG + "RdbStoreCorruptHandlerTest_1900 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_2000
     * @tc.name RdbStoreCorruptHandlerTest_2000
     * @tc.desc RdbStoreCorruptHandlerTest_2000
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_2000();
      console.info(TAG + "RdbStoreCorruptHandlerTest_2000 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_DistributedData_RelationalStore_SDK_NdkAPITest_2100
     * @tc.name RdbStoreCorruptHandlerTest_2100
     * @tc.desc RdbStoreCorruptHandlerTest_2100
     * @tc.level: Level 0
     * @tc.type: Functiontion
     * @tc.size: MediumTest
     */
    it('RdbStoreCorruptHandlerTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let res = testndk.RdbStoreCorruptHandlerTest_2100();
      console.info(TAG + "RdbStoreCorruptHandlerTest_2100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
  })
}