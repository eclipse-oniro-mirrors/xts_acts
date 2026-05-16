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

import testndk from 'libinterfacetest.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";

let TAG = '[testLog-ets]';
export default function rdbInterfaceNdkTest() {
  describe('rdbInterfaceNdkTest', async (done: Function) => {
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
     * @tc.name   OH_Rdb_Predicates_NotLike0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0100
     * @tc.desc   OH_Rdb_Predicates_NotLike0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_Predicates_NotLike0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_Predicates_NotLike0100();
      console.info(TAG + "OH_Rdb_Predicates_NotLike0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_Predicates_Glob0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0200
     * @tc.desc   OH_Rdb_Predicates_Glob0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_Predicates_Glob0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_Predicates_Glob0100();
      console.info(TAG + "OH_Rdb_Predicates_Glob0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_Predicates_NotGlob0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0300
     * @tc.desc   OH_Rdb_Predicates_NotGlob0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_Predicates_NotGlob0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_Predicates_NotGlob0100();
      console.info(TAG + "OH_Rdb_Predicates_NotGlob0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_Predicates_Having0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0400
     * @tc.desc   OH_Rdb_Predicates_Having0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_Predicates_Having0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_Predicates_Having0100();
      console.info(TAG + "OH_Rdb_Predicates_Having0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_SetCryptoParam0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0500
     * @tc.desc   OH_Rdb_SetCryptoParam0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_SetCryptoParam0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_SetCryptoParam0100();
      console.info(TAG + "OH_Rdb_SetCryptoParam0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_InsertWithConflictResolution0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0600
     * @tc.desc   OH_Rdb_InsertWithConflictResolution0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_InsertWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_InsertWithConflictResolution0100();
      console.info(TAG + "OH_Rdb_InsertWithConflictResolution0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });


    /**
     * @tc.name   OH_Rdb_UpdateWithConflictResolution0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0700
     * @tc.desc   OH_Rdb_UpdateWithConflictResolution0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_UpdateWithConflictResolution0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_UpdateWithConflictResolution0100();
      console.info(TAG + "OH_Rdb_UpdateWithConflictResolution0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_Attach0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0800
     * @tc.desc   OH_Rdb_Attach0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_Attach0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_Attach0100();
      console.info(TAG + "OH_Rdb_Attach0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   OH_Rdb_Detach0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_0900
     * @tc.desc   OH_Rdb_Detach0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_Detach0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_Detach0100();
      console.info(TAG + "OH_Rdb_Detach0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_Setlocale0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_1000
     * @tc.desc   OH_Rdb_Setlocale0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_Setlocale0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_Setlocale0100();
      console.info(TAG + "OH_Rdb_Setlocale0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_LockRow_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_1200
     * @tc.desc   OH_Rdb_LockRow_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_LockRow_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_LockRow_0100();
      console.info(TAG + "OH_Rdb_LockRow_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
    /**
     * @tc.name   OH_Rdb_CreateTransaction_0100
     * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_1300
     * @tc.desc   OH_Rdb_CreateTransaction_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OH_Rdb_CreateTransaction_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let res = testndk.OH_Rdb_CreateTransaction_0100();
      console.info(TAG + "OH_Rdb_CreateTransaction_0100 res=" + res );
      expect(res).assertEqual(0);
      done();
    });
      /**
       * @tc.name   OH_Rdb_NotSupport0100
       * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_1100
       * @tc.desc   OH_Rdb_NotSupport0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('OH_Rdb_NotSupport0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let res = testndk.OH_Rdb_NotSupport0100();
        console.info(TAG + "OH_Rdb_NotSupport0100 res=" + res );
        if(res == 0)
        {
          expect(res).assertEqual(0);
          done();
        }
        else{
          expect(res).assertEqual(1);
          done();
        }
      });
      /**
       * @tc.name   OH_Rdb_ColumnType_0100
       * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_1400
       * @tc.desc   OH_Rdb_ColumnType_0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('OH_Rdb_ColumnType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let res = testndk.OH_Rdb_ColumnType_0100();
        console.info(TAG + "OH_Rdb_ColumnType_0100 res=" + res );
        if(res == 0)
        {
          expect(res).assertEqual(0);
          done();
        }
        else{
          expect(res).assertEqual(1);
          done();
        }
      });
      /**
       * @tc.name   OH_Rdb_ErrCode_0100
       * @tc.number SUB_DistributedData_Rdb_SDK_NdkAPITest_InterfaceTest_1500
       * @tc.desc   OH_Rdb_ErrCode_0100
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('OH_Rdb_ErrCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let res = testndk.OH_Rdb_ErrCode_0100();
        console.info(TAG + "OH_Rdb_ErrCode_0100 res=" + res );
        if(res == 0)
        {
          expect(res).assertEqual(0);
          done();
        }
        else{
          expect(res).assertEqual(1);
          done();
        }
      });
  })
}