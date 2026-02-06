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
const RDB_E_ERROR = 14800000;
const RDB_E_ALREADY_CLOSED = 14800050;

export default function ActsTransactionTest() {
  describe('ActsTransactionTest', () => {
    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0100
     * @tc.desc    : test OH_RdbTrans_DestroyOptions Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0100 start====");
          let result: number = testNapi.testDestroyOptionsInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0100 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0200
     * @tc.desc    : test OH_RdbTrans_DestroyOptions Test Normal scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0200 start====");
          let result: number = testNapi.testDestroyOptionsSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0200 result====",
            result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_DestroyOptions_0200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0300
     * @tc.desc    : test OH_RdbTrans_Commit Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0300 start====");
          let result: number = testNapi.testCommitInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0400
     * @tc.desc    : test OH_RdbTrans_Commit Test database is closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0400 start====");
          let result: number = testNapi.testCommitTransDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0400 result====", result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Commit_0400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0500
     * @tc.desc    : test OH_RdbTrans_Rollback Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0500 start====");
          let result: number = testNapi.testTransRollbackInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0600
     * @tc.desc    : test OH_RdbTrans_Rollback Test DataBase Closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0600 start====");
          let result: number = testNapi.testTransRollbackDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0600 result====", result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Rollback_0600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0700
     * @tc.desc    : test OH_RdbTrans_Insert Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0700 start====");
          let result: number = testNapi.testInsertInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0700 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0700 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0800
     * @tc.desc    : test OH_RdbTrans_Insert Test database closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0800 start====");
          let result: number = testNapi.testInsertDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0800 result====", result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0900
     * @tc.desc    : test OH_RdbTrans_Insert Test Insert Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0900 start====");
          let result: number = testNapi.testTransInsertError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0900 result====", result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Insert_0900 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1000
     * @tc.desc    : test OH_RdbTrans_InsertWithConflictResolution Test success Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1000 start====");
          let result: number = testNapi.testTransInsertWithConflictResolutionSuccess();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1000 result====",
            result);
          expect(result).assertEqual(RDB_OK);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1100
     * @tc.desc    : test OH_RdbTrans_InsertWithConflictResolution Test error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1100 start====");
          let result: number = testNapi.testInsertWithConflictResolutionError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1100 result====",
            result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1200
     * @tc.desc    : test OH_RdbTrans_InsertWithConflictResolution Test DataBase Close Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1200 start====");
          let result: number = testNapi.testInsertWithConflictResolutionDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1200 result====",
            result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_InsertWithConflictResolution_1200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1300
     * @tc.desc    : test OH_RdbTrans_BatchInsert Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1300 start====");
          let result: number = testNapi.testTransBatchInsertInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1400
     * @tc.desc    : test OH_RdbTrans_BatchInsert Test Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1400 start====");
          let result: number = testNapi.testTransBatchInsertError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1400 result====", result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1500
     * @tc.desc    : test OH_RdbTrans_BatchInsert Test DataBase Closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1500 start====");
          let result: number = testNapi.testTransBatchInsertDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1500 result====", result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_BatchInsert_1500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1600
     * @tc.desc    : test OH_RdbTrans_Update Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1600 start====");
          let result: number = testNapi.testUpdateInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1600 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1700
     * @tc.desc    : test OH_RdbTrans_Update Test Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1700 start====");
          let result: number = testNapi.testTransUpdateError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1700 result====", result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1700 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1800
     * @tc.desc    : test OH_RdbTrans_Update Test DataBase Closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1800 start====");
          let result: number = testNapi.testTransUpdateDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1800 result====", result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Update_1800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_1900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_1900
     * @tc.desc    : test OH_RdbTrans_UpdateWithConflictResolution Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_1900 start====");
          let result: number = testNapi.testUpdateWithConflictResolutionInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_1900 result====",
            result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_1900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2000
     * @tc.desc    : test OH_RdbTrans_UpdateWithConflictResolution Test Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2000 start====");
          let result: number = testNapi.testTransUpdateWithConflictResolutionError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2000 result====",
            result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2100
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2100
     * @tc.desc    : test OH_RdbTrans_UpdateWithConflictResolution Test DataBase Closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2100 start====");
          let result: number = testNapi.testTransUpdateWithConflictResolutionDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2100 result====",
            result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_UpdateWithConflictResolution_2100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2200
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2200
     * @tc.desc    : test OH_RdbTrans_Delete Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2200 start====");
          let result: number = testNapi.testTransDeleteInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2200 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2300
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2300
     * @tc.desc    : test OH_RdbTrans_Delete Test Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2300 start====");
          let result: number = testNapi.testTransDeleteError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2300 result====", result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2400
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2400
     * @tc.desc    : test OH_RdbTrans_Delete Test DataBase Closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2400 start====");
          let result: number = testNapi.testTransDeleteDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2400 result====", result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Delete_2400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2500
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2500
     * @tc.desc    : test OH_RdbTrans_Execute Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2500 start====");
          let result: number = testNapi.testTransExecuteInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2500 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2600
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2600
     * @tc.desc    : test OH_RdbTrans_Execute Test Error Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2600 start====");
          let result: number = testNapi.testTransExecuteError();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2600 result====", result);
          expect(result).assertEqual(RDB_E_ERROR);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2700
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2700
     * @tc.desc    : test OH_RdbTrans_Execute Test DataBase Closed Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2700 start====");
          let result: number = testNapi.testTransExecuteDatabaseClosed();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2700 result====", result);
          expect(result).assertEqual(RDB_E_ALREADY_CLOSED);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Execute_2700 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Destroy_2800
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Destroy_2800
     * @tc.desc    : test OH_RdbTrans_Destroy Test Illegal Parameter Scene
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Destroy_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Destroy_2800 start====");
          let result: number = testNapi.testDestroyInvalidParam();
          console.info("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Destroy_2800 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_ARGS);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_OH_RdbTrans_Destroy_2800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_IMMEDIATE_2900
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_IMMEDIATE_2900
     * @tc.desc    : Test the scenario of enumeration value RDB_TRANS_IMMEDIATE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_IMMEDIATE_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_IMMEDIATE_2900 start====");
          let result = testNapi.testOHRdbTransOptionSetTypeImmediate();
          expect(result).assertEqual(0);
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_IMMEDIATE_2900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_IMMEDIATE_2900 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_EXCLUSIVE_3000
     * @tc.name    : SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_EXCLUSIVE_3000
     * @tc.desc    : Test the scenario of enumeration value RDB_TRANS_EXCLUSIVE.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_EXCLUSIVE_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_EXCLUSIVE_3000 start====");
          let result = testNapi.testOHRdbTransOptionSetTypeExclusive();
          expect(result).assertEqual(0);
          console.info("====>SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_EXCLUSIVE_3000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DistributedData_RelationalStore_SDK_RDB_TRANS_EXCLUSIVE_3000 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })
  })
}
