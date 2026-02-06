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
import testNapi from 'librelationNdk.so'

const RDB_OK = 0;
const RDB_E_INVALID_ARGS = 14800001;
const RDB_E_DATA_TYPE_NULL = 14800063;
const RDB_E_TYPE_MISMATCH = 14800064;

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
    it('SUB_DistributedData_RelationalStore_SDK_GetPath_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetPath_0200 start====");
          let result: number = testNapi.getPathSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetPath_0200 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_GetPath_0200 catch err: " + err);
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
    it('SUB_DistributedData_RelationalStore_SDK_GetSize_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0500 start====");
          let result: number = testNapi.getSizeSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0500 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_GetSize_0500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_GetStatus_0600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_GetStatus_0600
     * @tc.desc    : test OH_Data_Asset_GetStatus Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_GetStatus_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetStatus_0600 start====");
          let result: number = testNapi.getStatusSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_GetStatus_0600 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_GetStatus_0600 catch err: " + err);
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
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_Destroy_0900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_Destroy_0900
     * @tc.desc    : test OH_VBuckets_Destroy Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_Destroy_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_Destroy_0900 start====");
          let result: number = testNapi.testDestroyInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_Destroy_0900 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_Destroy_0900 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRow_1000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRow_1000
     * @tc.desc    : test OH_VBuckets_PutRow Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRow_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRow_1000 start====");
          let result: number = testNapi.testPutRowInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRow_1000 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRow_1000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRows_1100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRows_1100
     * @tc.desc    : test OH_VBuckets_PutRows Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRows_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRows_1100 start====");
          let result: number = testNapi.testPutRowsInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRows_1100 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_PutRows_1100 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_RowCount_1200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_RowCount_1200
     * @tc.desc    : test OH_VBuckets_RowCount Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_RowCount_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_RowCount_1200 start====");
          let result: number = testNapi.testRowCountInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_RowCount_1200 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_VBuckets_RowCount_1200 catch err: " + err);
        }
      })


    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_Destroy_1300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_Destroy_1300
     * @tc.desc    : test OH_Values_Destroy Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_Destroy_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Destroy_1300 start====");
          let result: number = testNapi.testDestroyInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Destroy_1300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Destroy_1300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutNull_1400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutNull_1400
     * @tc.desc    : test OH_Values_PutNull Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutNull_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutNull_1400 start====");
          let result: number = testNapi.testPutNullInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutNull_1400 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutNull_1400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutInt_1500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutInt_1500
     * @tc.desc    : test OH_Values_PutInt Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutInt_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutInt_1500 start====");
          let result: number = testNapi.testPutIntInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutInt_1500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutInt_1500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutReal_1600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutReal_1600
     * @tc.desc    : test OH_Values_PutReal Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutReal_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutReal_1600 start====");
          let result: number = testNapi.testPutRealInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutReal_1600 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutReal_1600 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutText_1700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutText_1700
     * @tc.desc    : test OH_Values_PutText Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutText_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutText_1700 start====");
          let result: number = testNapi.testPutTextInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutText_1700 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutText_1700 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutBlob_1800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutBlob_1800
     * @tc.desc    : test OH_Values_PutBlob Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutBlob_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutBlob_1800 start====");
          let result: number = testNapi.testPutBlobInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutBlob_1800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutBlob_1800 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAsset_1900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAsset_1900
     * @tc.desc    : test OH_Values_PutAsset Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAsset_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAsset_1900 start====");
          let result: number = testNapi.testPutAssetInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAsset_1900 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAsset_1900 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAssets_2000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAssets_2000
     * @tc.desc    : test OH_Values_PutAssets Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAssets_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAssets_2000 start====");
          let result: number = testNapi.testPutAssetsInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAssets_2000 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutAssets_2000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutUnlimitedInt_2100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_PutUnlimitedInt_2100
     * @tc.desc    : test OH_Values_PutUnlimitedInt Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_PutUnlimitedInt_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutUnlimitedInt_2100 start====");
          let result: number = testNapi.testPutUnlimitedIntInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutUnlimitedInt_2100 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_PutUnlimitedInt_2100 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_Count_2200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_Count_2200
     * @tc.desc    : test OH_Values_Count Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_Count_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Count_2200 start====");
          let result: number = testNapi.testCountInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Count_2200 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Count_2200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetType_2300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetType_2300
     * @tc.desc    : test OH_Values_GetType Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetType_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetType_2300 start====");
          let result: number = testNapi.testGetTypeInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetType_2300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetType_2300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_Get_2400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_Get_2400
     * @tc.desc    : test OH_Values_Get Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_Get_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Get_2400 start====");
          let result: number = testNapi.testGetInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Get_2400 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_Get_2400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_IsNull_2500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_IsNull_2500
     * @tc.desc    : test OH_Values_IsNull Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_IsNull_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_IsNull_2500 start====");
          let result: number = testNapi.testIsNullInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_IsNull_2500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_IsNull_2500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2600
     * @tc.desc    : test OH_Values_GetInt Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2600 start====");
          let result: number = testNapi.testGetIntInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2600 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2600 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2700
     * @tc.desc    : test OH_Values_GetInt Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2700 start====");
          let result: number = testNapi.testGetIntTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2700 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2700 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2800
     * @tc.desc    : test OH_Values_GetInt Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2800 start====");
          let result: number = testNapi.testGetIntTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2800 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetInt_2800 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_2900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_2900
     * @tc.desc    : test OH_Values_GetReal Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_2900 start====");
          let result: number = testNapi.testGetRealInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_2900 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_2900 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3000
     * @tc.desc    : test OH_Values_GetReal Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3000 start====");
          let result: number = testNapi.testGetRealTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3000 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3100
     * @tc.desc    : test OH_Values_GetReal Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3100 start====");
          let result: number = testNapi.testGetRealTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3100 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetReal_3100 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3200
     * @tc.desc    : test OH_Values_GetText Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3200 start====");
          let result: number = testNapi.testGetTextInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3200 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3300
     * @tc.desc    : test OH_Values_GetText Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3300 start====");
          let result: number = testNapi.testGetTextTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3300 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3400
     * @tc.desc    : test OH_Values_GetText Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3400 start====");
          let result: number = testNapi.testGetTextTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3400 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetText_3400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3500
     * @tc.desc    : test OH_Values_GetBlob Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3500 start====");
          let result: number = testNapi.testGetBlobInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3600
     * @tc.desc    : test OH_Values_GetBlob Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3600 start====");
          let result: number = testNapi.testGetBlobTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3600 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3600 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3700
     * @tc.desc    : test OH_Values_GetBlob Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3700 start====");
          let result: number = testNapi.testGetBlobTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3700 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetBlob_3700 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3800
     * @tc.desc    : test OH_Values_GetAsset Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3800 start====");
          let result: number = testNapi.testGetAssetInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3800 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3900
     * @tc.desc    : test OH_Values_GetAsset Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3900 start====");
          let result: number = testNapi.testGetAssetTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3900 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_3900 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_4000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_4000
     * @tc.desc    : test OH_Values_GetAsset Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_4000 start====");
          let result: number = testNapi.testGetAssetTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_4000 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAsset_4000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4100
     * @tc.desc    : test OH_Values_GetAssetsCount Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4100 start====");
          let result: number = testNapi.testGetAssetsCountInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4100 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4100 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4200
     * @tc.desc    : test OH_Values_GetAssetsCount Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4200 start====");
          let result: number = testNapi.testGetAssetsCountTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4200 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4300
     * @tc.desc    : test OH_Values_GetAssetsCount Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4300 start====");
          let result: number = testNapi.testGetAssetsCountTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4300 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssetsCount_4300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4400
     * @tc.desc    : test OH_Values_GetAssets Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4400 start====");
          let result: number = testNapi.testGetAssetsInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4400 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4500
     * @tc.desc    : test OH_Values_GetAssets Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4500 start====");
          let result: number = testNapi.testGetAssetsTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4500 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4600
     * @tc.desc    : test OH_Values_GetAssets Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4600 start====");
          let result: number = testNapi.testGetAssetsTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4600 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetAssets_4600 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4700
     * @tc.desc    : test OH_Values_GetFloatVectorCount Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4700 start====");
          let result: number = testNapi.testGetFloatVectorCountInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4700 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4700 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4800
     * @tc.desc    : test OH_Values_GetFloatVectorCount Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4800 start====");
          let result: number = testNapi.testGetFloatVectorCountTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4800 result====",
            result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4800 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4900
     * @tc.desc    : test OH_Values_GetFloatVectorCount Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4900 start====");
          let result: number = testNapi.testGetFloatVectorCountTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4900 result====",
            result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVectorCount_4900 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5000
     * @tc.desc    : test OH_Values_GetFloatVector Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5000 start====");
          let result: number = testNapi.testGetFloatVectorInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5000 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5100
     * @tc.desc    : test OH_Values_GetFloatVector Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5100 start====");
          let result: number = testNapi.testGetFloatVectorTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5100 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5100 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5200
     * @tc.desc    : test OH_Values_GetFloatVector Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5200 start====");
          let result: number = testNapi.testGetFloatVectorTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5200 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetFloatVector_5200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5300
     * @tc.desc    : test OH_Values_GetUnlimitedIntBand Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5300 start====");
          let result: number = testNapi.testGetUnlimitedIntBandInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5300 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5300 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5400
     * @tc.desc    : test OH_Values_GetUnlimitedIntBand Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5400 start====");
          let result: number = testNapi.testGetUnlimitedIntBandTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5400 result====",
            result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5400 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5500
     * @tc.desc    : test OH_Values_GetUnlimitedIntBand Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5500 start====");
          let result: number = testNapi.testGetUnlimitedIntBandTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5500 result====",
            result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedIntBand_5500 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5600
     * @tc.desc    : test OH_Values_GetUnlimitedInt Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5600 start====");
          let result: number = testNapi.testGetUnlimitedIntInvalidParamA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5600 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5600 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5700
     * @tc.desc    : test OH_Values_GetUnlimitedInt Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5700 start====");
          let result: number = testNapi.testGetUnlimitedIntTypeMismatchA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5700 result====",
            result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5700 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5800
     * @tc.desc    : test OH_Values_GetUnlimitedInt Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5800 start====");
          let result: number = testNapi.testGetUnlimitedIntTypeNullA();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5800 result====",
            result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Values_GetUnlimitedInt_5800 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_Destroy_6000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_Destroy_6000
     * @tc.desc    : test OH_Value_Destroy Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_Destroy_6000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_Destroy_6000 start====");
          let result: number = testNapi.destroy();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_Destroy_6000 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_Destroy_6000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutNull_6100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutNull_6100
     * @tc.desc    : test OH_Value_PutNull Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_PutNull_6100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutNull_6100 start====");
          let result: number = testNapi.putNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutNull_6100 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutNull_6100 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutReal_6200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutReal_6200
     * @tc.desc    : test OH_Value_PutReal Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_PutReal_6200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutReal_6200 start====");
          let result: number = testNapi.putReal();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutReal_6200 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutReal_6200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutText_6300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutText_6300
     * @tc.desc    : test OH_Value_PutText Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_PutText_6300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutText_6300 start====");
          let result: number = testNapi.putText();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutText_6300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutText_6300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutBlob_6400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutBlob_6400
     * @tc.desc    : test OH_Value_PutBlob Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_PutBlob_6400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutBlob_6400 start====");
          let result: number = testNapi.putBlob();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutBlob_6400 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutBlob_6400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAsset_6500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAsset_6500
     * @tc.desc    : test OH_Value_PutAsset Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAsset_6500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAsset_6500 start====");
          let result: number = testNapi.putAsset();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAsset_6500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAsset_6500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAssets_6600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAssets_6600
     * @tc.desc    : test OH_Value_PutAssets Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAssets_6600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAssets_6600 start====");
          let result: number = testNapi.putAssets();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAssets_6600 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutAssets_6600 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutUnlimitedInt_6700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_PutUnlimitedInt_6700
     * @tc.desc    : test OH_Value_PutUnlimitedInt Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_PutUnlimitedInt_6700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutUnlimitedInt_6700 start====");
          let result: number = testNapi.putUnlimitedInt();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutUnlimitedInt_6700 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_PutUnlimitedInt_6700 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetType_6800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetType_6800
     * @tc.desc    : test OH_Value_GetType Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetType_6800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetType_6800 start====");
          let result: number = testNapi.getType();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetType_6800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetType_6800 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_IsNull_6900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_IsNull_6900
     * @tc.desc    : test OH_Value_IsNull Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_IsNull_6900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_IsNull_6900 start====");
          let result: number = testNapi.isNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_IsNull_6900 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_IsNull_6900 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7000
     * @tc.desc    : test OH_Value_GetInt Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7000 start====");
          let result: number = testNapi.testGetIntInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7000 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7100
     * @tc.desc    : test OH_Value_GetInt Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7100 start====");
          let result: number = testNapi.testGetIntTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7100 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7100 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7200
     * @tc.desc    : test OH_Value_GetInt Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7200 start====");
          let result: number = testNapi.testGetIntDataTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7200 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetInt_7200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetReal_7300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetReal_7300
     * @tc.desc    : test OH_Value_GetReal Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetReal_7300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetReal_7300 start====");
          let result: number = testNapi.testGetRealInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetReal_7300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetReal_7300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7400
     * @tc.desc    : test OH_Value_GetText Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7400 start====");
          let result: number = testNapi.testGetTextInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7400 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7500
     * @tc.desc    : test OH_Value_GetText Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7500 start====");
          let result: number = testNapi.testGetTextTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7500 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7600
     * @tc.desc    : test OH_Value_GetText Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7600 start====");
          let result: number = testNapi.testGetTextDataTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7600 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetText_7600 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7700
     * @tc.desc    : test OH_Value_GetBlob Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7700 start====");
          let result: number = testNapi.testGetBlobInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7700 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7700 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7800
     * @tc.desc    : test OH_Value_GetBlob Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7800 start====");
          let result: number = testNapi.testGetBlobTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7800 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7800 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7900
     * @tc.desc    : test OH_Value_GetBlob Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7900 start====");
          let result: number = testNapi.testGetBlobDataTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7900 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetBlob_7900 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8000
     * @tc.desc    : test OH_Value_GetAsset Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8000 start====");
          let result: number = testNapi.testGetAssetInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8000 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8000 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8100
     * @tc.desc    : test OH_Value_GetAsset Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8100 start====");
          let result: number = testNapi.testGetAssetTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8100 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8100 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8200
     * @tc.desc    : test OH_Value_GetAsset Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8200 start====");
          let result: number = testNapi.testGetAssetDataTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8200 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAsset_8200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8300
     * @tc.desc    : test OH_Value_GetAssetsCount Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8300 start====");
          let result: number = testNapi.testGetAssetsCountInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8400
     * @tc.desc    : test OH_Value_GetAssetsCount Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8400 start====");
          let result: number = testNapi.testGetAssetsCountTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8400 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8500
     * @tc.desc    : test OH_Value_GetAssetsCount Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8500 start====");
          let result: number = testNapi.testGetAssetsCountDataTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8500 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssetsCount_8500 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8600
     * @tc.desc    : test OH_Value_GetAssets Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8600 start====");
          let result: number = testNapi.testGetAssetsInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8600 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8600 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8700
     * @tc.desc    : test OH_Value_GetAssets Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8700 start====");
          let result: number = testNapi.testGetAssetsTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8700 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8700 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8800
     * @tc.desc    : test OH_Value_GetAssets Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8800 start====");
          let result: number = testNapi.testGetAssetsDataTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8800 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetAssets_8800 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_8900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_8900
     * @tc.desc    : test OH_Value_GetFloatVectorCount Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_8900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_8900 start====");
          let result: number = testNapi.testGetFloatVectorCountInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_8900 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_8900 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9000
     * @tc.desc    : test OH_Value_GetFloatVectorCount Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9000 start====");
          let result: number = testNapi.testGetFloatVectorCountTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9000 result====",
            result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9000 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9100
     * @tc.desc    : test OH_Value_GetFloatVectorCount Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9100 start====");
          let result: number = testNapi.testGetFloatVectorCountTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9100 result====",
            result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVectorCount_9100 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9200
     * @tc.desc    : test OH_Value_GetFloatVector Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9200 start====");
          let result: number = testNapi.testGetFloatVectorInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9200 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9200 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9300
     * @tc.desc    : test OH_Value_GetFloatVector Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9300 start====");
          let result: number = testNapi.testGetFloatVectorTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9300 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9300 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9400
     * @tc.desc    : test OH_Value_GetFloatVector Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9400 start====");
          let result: number = testNapi.testGetFloatVectorTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9400 result====", result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetFloatVector_9400 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9500
     * @tc.desc    : test OH_Value_GetUnlimitedIntBand Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9500 start====");
          let result: number = testNapi.testGetUnlimitedIntBandInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9500 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9500 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9600
     * @tc.desc    : test OH_Value_GetUnlimitedIntBand Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9600 start====");
          let result: number = testNapi.testGetUnlimitedIntBandTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9600 result====",
            result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9600 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9700
     * @tc.desc    : test OH_Value_GetUnlimitedIntBand Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9700 start====");
          let result: number = testNapi.testGetUnlimitedIntBandTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9700 result====",
            result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedIntBand_9700 catch err: " +
            err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9800
     * @tc.desc    : test OH_Value_GetUnlimitedInt Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9800 start====");
          let result: number = testNapi.testGetUnlimitedIntInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9800 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9900
     * @tc.desc    : test OH_Value_GetUnlimitedInt Test Data Types Do Not Match Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9900 start====");
          let result: number = testNapi.testGetUnlimitedIntTypeMismatch();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9900 result====", result);
          expect(result).assertEqual(RDB_E_TYPE_MISMATCH);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_9900 catch err: " + err);
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_10000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_10000
     * @tc.desc    : test OH_Value_GetUnlimitedInt Test Storage Data Is Empty Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_10000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_10000 start====");
          let result: number = testNapi.testGetUnlimitedIntTypeNull();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_10000 result====",
            result);
          expect(result).assertEqual(RDB_E_DATA_TYPE_NULL);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Value_GetUnlimitedInt_10000 catch err: " +
            err);
        }
      })
  })
}