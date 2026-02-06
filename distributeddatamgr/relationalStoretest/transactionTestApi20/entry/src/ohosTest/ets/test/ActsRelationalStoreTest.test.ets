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
const RDB_ERR = -1;
const RDB_E_INVALID_ARGS = 14800001;
const RDB_E_NOT_SUPPORTED = 801;
const RDB_E_ERROR = 14800000;

export default function ActsRelationalStoreTest() {
  describe('ActsRelationalStoreTest', () => {
    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetDbType_0100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetDbType_0100
     * @tc.desc    : Test OH_Rdb_SetDbType Test RDB Does Not Have This Capability Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetDbType_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetDbType_0100 start====");
          let result: number = testNapi.testSetDbType();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetDbType_0100 result====", result);
          expect([0, 801]).assertContain(result);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetDbType_0100 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetCryptoParam_0200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetCryptoParam_0200
     * @tc.desc    : Test OH_Rdb_SetCryptoParam Test Normal Scene.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetCryptoParam_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetCryptoParam_0200 start====");
          let result: number = testNapi.testSetCryptoParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetCryptoParam_0200 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetCryptoParam_0200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0300
     * @tc.desc    : test OH_Rdb_SetTokenizer Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0300 start====");
          let result: number = testNapi.testSetTokenizerInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0400
     * @tc.desc    : test OH_Rdb_SetTokenizer Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0400 start====");
          let result: number = testNapi.testSetTokenizerSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0400 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_0400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0500
     * @tc.desc    : test OH_Rdb_SetPersistent Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0500 start====");
          let result: number = testNapi.testSetPersistentInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0600
     * @tc.desc    : test OH_Rdb_SetPersistent Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0600 start====");
          let result: number = testNapi.testSetPersistentSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0600 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetPersistent_0600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_IsTokenizerSupported_0700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_IsTokenizerSupported_0700
     * @tc.desc    : test OH_Rdb_IsTokenizerSupported Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_IsTokenizerSupported_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_IsTokenizerSupported_0700 start====");
          let result: number = testNapi.testIsTokenizerSupportedInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_IsTokenizerSupported_0700 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_IsTokenizerSupported_0700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0800
     * @tc.desc    : test OH_Rdb_DeleteStore Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0800 start====");
          let result: number = testNapi.testDeleteStoreInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0900
     * @tc.desc    : test OH_Rdb_DeleteStore Test OK Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0900 start====");
          let result: number = testNapi.testDeleteStoreSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0900 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_DeleteStore_0900 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Insert_1000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Insert_1000
     * @tc.desc    : test OH_Rdb_Insert Test Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Insert_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Insert_1000 start====");
          let result: number = testNapi.testInsertError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Insert_1000 result====", result);
          expect(result).assertEqual(RDB_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Insert_1000 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1100
     * @tc.desc    : test OH_Rdb_InsertWithConflictResolution Test Ok Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1100 start====");
          let result: number = testNapi.testInsertWithConflictResolutionSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1100 result====",
            result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1200
     * @tc.desc    : test OH_Rdb_InsertWithConflictResolution Test Error Codes For Common Exceptions Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1200 start====");
          let result: number = testNapi.testInsertWithConflictResolutionAbnormalError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1200 result====",
            result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_InsertWithConflictResolution_1200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1300
     * @tc.desc    : test OH_Rdb_BatchInsert Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1300 start====");
          let result: number = testNapi.testBatchInsertInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1400
     * @tc.desc    : test OH_Rdb_BatchInsert Test Database Common Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1400 start====");
          let result: number = testNapi.testBatchInsertError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1400 result====", result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BatchInsert_1400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Update_1500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Update_1500
     * @tc.desc    : test OH_Rdb_Update Test Update Failure Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Update_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Update_1500 start====");
          let result: number = testNapi.testUpdateFailed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Update_1500 result====", result);
          expect(result).assertEqual(RDB_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Update_1500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })


    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1600
     * @tc.desc    : test OH_Rdb_UpdateWithConflictResolution Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1600 start====");
          let result: number = testNapi.testUpdateWithConflictResolutionSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1600 result====",
            result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1700
     * @tc.desc    : test OH_Rdb_UpdateWithConflictResolution Test Common Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1700 start====");
          let result: number = testNapi.testUpdateWithConflictResolutionError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1700 result====",
            result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UpdateWithConflictResolution_1700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1800
     * @tc.desc    : test OH_Rdb_Delete Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1800 start====");
          let result: number = testNapi.testDeleteInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1900
     * @tc.desc    : test OH_Rdb_Delete Test Delete Failure Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1900 start====");
          let result: number = testNapi.testDeleteFailed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1900 result====", result);
          expect(result).assertEqual(RDB_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Delete_1900 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Execute_2000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Execute_2000
     * @tc.desc    : test OH_Rdb_Execute Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Execute_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Execute_2000 start====");
          let result: number = testNapi.testExecuteInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Execute_2000 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Execute_2000 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2100
     * @tc.desc    : test OH_Rdb_ExecuteV2 Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2100 start====");
          let result: number = testNapi.testExecuteV2InvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2100 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2100 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2200
     * @tc.desc    : test OH_Rdb_ExecuteV2 Test Common Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2200 start====");
          let result: number = testNapi.testExecuteV2Error();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2200 result====", result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_ExecuteV2_2200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2300
     * @tc.desc    : test OH_Rdb_BeginTransaction Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2300 start====");
          let result: number = testNapi.testBeginTransactionInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2400
     * @tc.desc    : test OH_Rdb_BeginTransaction Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2400 start====");
          let result: number = testNapi.testBeginTransactionSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2400 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_BeginTransaction_2400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2500
     * @tc.desc    : test OH_Rdb_RollBack Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2500 start====");
          let result: number = testNapi.testRollBackInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2600
     * @tc.desc    : test OH_Rdb_RollBack Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2600 start====");
          let result: number = testNapi.testRollBackSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2600 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBack_2600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2700
     * @tc.desc    : test OH_Rdb_Commit Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2700 start====");
          let result: number = testNapi.testCommitInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2700 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2700 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2800
     * @tc.desc    : test OH_Rdb_Commit Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2800 start====");
          let result: number = testNapi.testCommitSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2800 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Commit_2800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_2900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_2900
     * @tc.desc    : test OH_Rdb_Backup Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_2900 start====");
          let result: number = testNapi.testBackupInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_2900 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_2900 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_3000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_3000
     * @tc.desc    : test OH_Rdb_Backup Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_3000 start====");
          let result: number = testNapi.testBackupSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_3000 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Backup_3000 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3100
     * @tc.desc    : test OH_Rdb_Restore Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3100 start====");
          let result: number = testNapi.testRestoreInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3100 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3100 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3200
     * @tc.desc    : test OH_Rdb_Restore Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3200 start====");
          let result: number = testNapi.testRestoreSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3200 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Restore_3200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3300
     * @tc.desc    : test OH_Rdb_GetVersion Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3300 start====");
          let result: number = testNapi.testGetVersionInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3400
     * @tc.desc    : test OH_Rdb_GetVersion Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3400 start====");
          let result: number = testNapi.testGetVersionSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3400 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_GetVersion_3400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3500
     * @tc.desc    : test OH_Rdb_SetVersion Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3500 start====");
          let result: number = testNapi.testSetVersionInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3600
     * @tc.desc    : test OH_Rdb_SetVersion Test Execution Success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3600 start====");
          let result: number = testNapi.testSetVersionSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3600 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetVersion_3600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_LockRow_3700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_LockRow_3700
     * @tc.desc    : test OH_Rdb_LockRow Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_LockRow_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_LockRow_3700 start====");
          let result: number = testNapi.testLockRowInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_LockRow_3700 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_LockRow_3700 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UnlockRow_3800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UnlockRow_3800
     * @tc.desc    : test OH_Rdb_UnlockRow Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UnlockRow_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UnlockRow_3800 start====");
          let result: number = testNapi.testUnlockRowInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UnlockRow_3800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_UnlockRow_3800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CreateTransaction_3900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CreateTransaction_3900
     * @tc.desc    : test OH_Rdb_CreateTransaction Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CreateTransaction_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CreateTransaction_3900 start====");
          let result: number = testNapi.testCreateTransactionInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CreateTransaction_3900 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CreateTransaction_3900 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetLocale_4000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetLocale_4000
     * @tc.desc    : test OH_Rdb_SetLocale Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetLocale_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetLocale_4000 start====");
          let result: number = testNapi.testSetLocaleSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetLocale_4000 result====", result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetLocale_4000 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4100
     * @tc.desc    : Test the fault scenario that the database file of OH_Rdb_Attach interface is locked.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4100 start====");
          let result = testNapi.testOHRdbAttachBusy();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4100 result: " + result);
          expect(result).assertEqual(0);
          done()
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4100 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4200
     * @tc.desc    : Test the fault scenario of the error code of the common exception of the OH_Rdb_Attach interface.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4200 start====");
          let result = testNapi.testOHRdbAttachError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4200 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Attach_4200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4300
     * @tc.desc    : Test the successful execution of the OH_Rdb_Detach interface.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4300 start====");
          let result = testNapi.testOHRdbDetachOk();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4300 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4400
     * @tc.desc    : Test the error code of the common exception of the OH_Rdb_Detach interface.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4400 start====");
          let result = testNapi.testOHRdbDetachError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4400 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_Detach_4400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4500
     * @tc.desc    : Test the scenario of enumeration value RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4500 start====");
          let result = testNapi.testOHRdbSubscribeDetails();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4500 result: " +
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_4600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_4600
     * @tc.desc    : Test OH_Rdb_SetTokenizer test RDB does not have this ability.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_4600 start====");
          let result: number = testNapi.testSetTokenizerNotSupported();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_4600 result====", result);
          expect([0, 801]).assertContain(result);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_SetTokenizer_4600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBackByTrxId_4700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBackByTrxId_4700
     * @tc.desc    : test OH_Rdb_RollBackByTrxId Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBackByTrxId_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBackByTrxId_4700 start====");
          let result: number = testNapi.testRollBackByTrxIdSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBackByTrxId_4700 result====", result);
          expect([0, 801]).assertContain(result);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_RollBackByTrxId_4700 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CommitByTrxId_4800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CommitByTrxId_4800
     * @tc.desc    : test OH_Rdb_CommitByTrxId Test Normal Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CommitByTrxId_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CommitByTrxId_4800 start====");
          let result: number = testNapi.testCommitByTrxIdSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CommitByTrxId_4800 result====", result);
          expect([0, 801]).assertContain(result);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_Rdb_CommitByTrxId_4800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4900
     * @tc.desc    : Scenario for testing enumeration value RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4900 start====");
          let result: number = testNapi.testSubscribeSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4900 result====",
            result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_SUBSCRIBE_TYPE_LOCAL_DETAILS_4900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}
