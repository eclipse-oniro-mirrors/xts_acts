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
import testNapi from 'librelationndk.so'

const RDB_OK = 0;
const RDB_E_INVALID_ARGS = 14800001;

export default function ActsRelationalStoreTest() {
  describe('ActsRelationalStoreTest', () => {
    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_GetUri_0100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_GetUri_0100
     * @tc.desc    : test OH_Data_Asset_GetUri Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_GetUri_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetUri_0100 start====");
          let result: number = testNapi.getURISuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetUri_0100 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_GetUri_0100 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_GetPath_0200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_GetPath_0200
     * @tc.desc    : test OH_Data_Asset_GetPath Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_GetPath_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_DistributedData_RelationalStore_SDK_GetPath_0200 start====");
        let result: number = testNapi.getPathSuccess();
        console.info("====>SUB_DistributedData_RelationalStore_SDK_GetPath_0200 result====", result);
        expect(result).assertEqual(RDB_OK);
        done();
      } catch (err) {
        console.error("====>SUB_DistributedData_RelationalStore_SDK_GetPath_0200 catch err: " + err);
        done();
      }
    })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_GetCreateTime_0300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_GetCreateTime_0300
     * @tc.desc    : test OH_Data_Asset_GetCreateTime Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_GetCreateTime_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetCreateTime_0300 start====");
          let result: number = testNapi.getCreateTimeSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetCreateTime_0300 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_GetCreateTime_0300 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_GetModifyTime_0400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_GetModifyTime_0400
     * @tc.desc    : test OH_Data_Asset_GetModifyTime Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_GetModifyTime_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetModifyTime_0400 start====");
          let result: number = testNapi.getModifyTimeSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetModifyTime_0400 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_GetModifyTime_0400 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_GetSize_0500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_GetSize_0500
     * @tc.desc    : test OH_Data_Asset_GetSize Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_GetSize_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0500 start====");
        let result: number = testNapi.getSizeSuccess();
        console.info("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0500 result====", result);
        expect(result).assertEqual(RDB_OK);
        done();
      } catch (err) {
        console.error("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0500 catch err: " + err);
        done();
      }
    })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_GetSize_0600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_GetSize_0600
     * @tc.desc    : test OH_Data_Asset_GetStatus Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_GetSize_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0600 start====");
          let result: number = testNapi.getStatusSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0600 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0600 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_DestroyOne_0700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_DestroyOne_0700
     * @tc.desc    : test OH_Data_Asset_DestroyOne Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_DestroyOne_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_DestroyOne_0700 start====");
          let result: number = testNapi.getDestroyOneSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_DestroyOne_0700 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_DestroyOne_0700 catch err: " + err);
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_DestroyMultiple_0800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_DestroyMultiple_0800
     * @tc.desc    : test OH_Data_Asset_DestroyMultiple Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_DestroyMultiple_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_DestroyMultiple_0800 start====");
          let result: number = testNapi.testDestroyMultipleInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_DestroyMultiple_0800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_DestroyMultiple_0800 catch err: " + err);
          done();
        }
      })
  })
}
