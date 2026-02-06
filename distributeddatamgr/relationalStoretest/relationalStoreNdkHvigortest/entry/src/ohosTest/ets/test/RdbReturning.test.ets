/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import testndk from 'libreturningtest.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

let TAG = '[testLog-returningets]';
export default function rdbReturningNdkTest() {
  describe('rdbReturningNdkTest', async (done: Function) => {
    beforeAll(() => {
      console.info(TAG + "beforeAll");
    })
    beforeEach(() => {
      console.info(TAG + "beforeEach");
    })
    afterEach(() => {
      console.info(TAG + "afterEach");
    })
    afterAll(() => {
      console.info(TAG + "afterAll");
    })

    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ReturningTest_0100
     * @tc.name OH_Rdb_Returning0100
     * @tc.desc OH_Rdb_Returning0100
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('OH_Rdb_Returning0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res:number = testndk.OH_Rdb_BatchInsertWithReturning0100();
      console.info(TAG + "OH_Rdb_Returning0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ReturningTest_0200
     * @tc.name OH_Rdb_Returning0200
     * @tc.desc OH_Rdb_Returning0200
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('OH_Rdb_Returning0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res:number = testndk.OH_Rdb_UpdateWithReturning0100();
      console.info(TAG + "OH_Rdb_Returning0200 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ReturningTest_0300
     * @tc.name OH_Rdb_Returning0300
     * @tc.desc OH_Rdb_Returning0300
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('OH_Rdb_Returning0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res:number = testndk.OH_Rdb_DeleteWithReturning0100();
      console.info(TAG + "OH_Rdb_Returning0300 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ReturningTest_0400
     * @tc.name OH_Rdb_Returning0400
     * @tc.desc OH_Rdb_Returning0400
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('OH_Rdb_Returning0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res:number = testndk.OH_RdbTrans_BatchInsertWithReturning0100();
      console.info(TAG + "OH_Rdb_Returning0400 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ReturningTest_0500
     * @tc.name OH_Rdb_Returning0500
     * @tc.desc OH_Rdb_Returning0500
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('OH_Rdb_Returning0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res:number = testndk.OH_RdbTrans_UpdateWithReturning0100();
      console.info(TAG + "OH_Rdb_Returning0500 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ReturningTest_0600
     * @tc.name OH_Rdb_Returning0600
     * @tc.desc OH_Rdb_Returning0600
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('OH_Rdb_Returning0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res:number = testndk.OH_RdbTrans_DeleteWithReturning0100();
      console.info(TAG + "OH_Rdb_Returning0600 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_ReturningTest_0700
     * @tc.name OH_Rdb_Returning0700
     * @tc.desc OH_Rdb_Returning0700
     * @tc.level Level 2
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('OH_Rdb_Returning0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res:number = testndk.OH_RDB_SetReturningFields0100();
      console.info(TAG + "OH_Rdb_Returning0700 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
  })
}