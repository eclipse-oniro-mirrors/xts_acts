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
import testNapi from 'libentry.so'

const RDB_OK = 0;
const RDB_E_INVALID_ARGS = 14800001;

export default function ActsValuesBucketTest() {
  describe('ActsValuesBucketTest', () => {
    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0100
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0100
     * @tc.desc   test OH_VBucket_PutAsset Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0100 start====");
          let result: number = testNapi.testPutAssetInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0100 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0100 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0200
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0200
     * @tc.desc   test OH_VBucket_PutAsset Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0200 start====");
          let result: number = testNapi.testPutAssetSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0200 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAsset_0200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0300
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0300
     * @tc.desc   test OH_VBucket_PutAssets Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0300 start====");
          let result: number = testNapi.testPutAssetsInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0400
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0400
     * @tc.desc   test OH_VBucket_PutAssets Test Normal Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0400 start====");
          let result: number = testNapi.testPutAssetsSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0400 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutAssets_0400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutFloatVector_0500
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutFloatVector_0500
     * @tc.desc   test OH_VBucket_PutFloatVector Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutFloatVector_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutFloatVector_0500 start====");
          let result: number = testNapi.testPutFloatVectorInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutFloatVector_0500 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutFloatVector_0500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutUnlimitedInt_0600
     * @tc.number SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutUnlimitedInt_0600
     * @tc.desc   test OH_VBucket_PutUnlimitedInt Test Illegal Parameter Scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutUnlimitedInt_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutUnlimitedInt_0600 start====");
          let result: number = testNapi.testPutUnlimitedIntInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutUnlimitedInt_0600 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBucket_PutUnlimitedInt_0600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}
