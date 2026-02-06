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

const RDB_ERR = -1;
const RDB_E_INVALID_COLUMN_TYPE = 14800009;
const RDB_E_NO_TRANSACTION_IN_SESSION = 14800016;
const RDB_E_INVALID_OBJECT_TYPE = 14800020;

export default function ActsRdbErrorCodeTest() {
  describe('ActsRdbErrorCodeTest', () => {
    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_ERR_0100
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_ERR_0100
     * @tc.desc    : The execution error scene in the test error code information.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_ERR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_ERR_0100 start====");
          let result: number = testNapi.testRdbError();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_ERR_0100 result====", result);
          expect(result).assertEqual(RDB_ERR);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_ERR_0100 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_EMPTY_TABLE_NAME_0200
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_EMPTY_TABLE_NAME_0200
     * @tc.desc    : Failure scenario in which the table name in the test error code information is empty.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_EMPTY_TABLE_NAME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_EMPTY_TABLE_NAME_0200 start====");
          let result: number = testNapi.testEmptyTableName();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_EMPTY_TABLE_NAME_0200 result====", result);
          expect([801, 14800005]).assertContain(result);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_EMPTY_TABLE_NAME_0200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_TYPE_0300
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_TYPE_0300
     * @tc.desc    : Test the fault scenario where the column type in the error code information is illegal.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_TYPE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_TYPE_0300 start====");
          let result: number = testNapi.testInvalidColumnType();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_TYPE_0300 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_COLUMN_TYPE);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_TYPE_0300 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_NO_ROW_IN_QUERY_0400
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_NO_ROW_IN_QUERY_0400
     * @tc.desc    : There is no recorded fault scenario in the result set obtained by testing the query in the error code information.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_NO_ROW_IN_QUERY_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_NO_ROW_IN_QUERY_0400 start====");
          let result: number = testNapi.testNoRowInQuery();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_NO_ROW_IN_QUERY_0400 result====", result);
          expect([801, 14800018]).assertContain(result);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_NO_ROW_IN_QUERY_0400 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_NO_TRANSACTION_IN_SESSION_0500
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_NO_TRANSACTION_IN_SESSION_0500
     * @tc.desc    : Test the fault scenario in the error code information that there is no open transaction in the database session.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_NO_TRANSACTION_IN_SESSION_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_NO_TRANSACTION_IN_SESSION_0500 start====");
          let result: number = testNapi.testNoTransactionInSession();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_NO_TRANSACTION_IN_SESSION_0500 result====", result);
          expect(result).assertEqual(RDB_E_NO_TRANSACTION_IN_SESSION);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_NO_TRANSACTION_IN_SESSION_0500 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_INDEX_0600
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_INDEX_0600
     * @tc.desc    : Test the fault scenario that the column index in the error code information is illegal.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_INDEX_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_INDEX_0600 start====");
          let result = testNapi.testInvalidColumnIndex();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_INDEX_0600 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_COLUMN_INDEX_0600 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_ALREADY_CLOSED_0700
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_ALREADY_CLOSED_0700
     * @tc.desc    : Test the fault scenario in which the database in the error code information is closed.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_ALREADY_CLOSED_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_ALREADY_CLOSED_0700 start====");
          let result = testNapi.testAlreadyClosed();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_ALREADY_CLOSED_0700 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_ALREADY_CLOSED_0700 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_NOT_SUPPORTED_ATTACH_IN_WAL_MODE_0800
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_NOT_SUPPORTED_ATTACH_IN_WAL_MODE_0800
     * @tc.desc    : Test the fault scenario in the error code information that the ATTACH operation is not supported in the WAL log mode.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_NOT_SUPPORTED_ATTACH_IN_WAL_MODE_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_NOT_SUPPORTED_ATTACH_IN_WAL_MODE_0800 start====");
          let result = testNapi.testNotSupportedAttachInWalMode();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_NOT_SUPPORTED_ATTACH_IN_WAL_MODE_0800 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_NOT_SUPPORTED_ATTACH_IN_WAL_MODE_0800 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_DATABASE_BUSY_0900
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_DATABASE_BUSY_0900
     * @tc.desc    : Test the failure scenario in which the database in the error code information is unresponsive.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_DATABASE_BUSY_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_DATABASE_BUSY_0900 start====");
          let result = testNapi.testAttachDatabaseBusy();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_DATABASE_BUSY_0900 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_DATABASE_BUSY_0900 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_CLOSED_1000
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_CLOSED_1000
     * @tc.desc    : Test the fault scenario in which the result set in the error code information has been closed.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_CLOSED_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_CLOSED_1000 start====");
          let result = testNapi.testGoToNextRowResultClosed();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_CLOSED_1000 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_CLOSED_1000 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_IS_AFTER_LAST_1100
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_IS_AFTER_LAST_1100
     * @tc.desc    : The cursor of the result set in the test error code information is already in the fault scenario of the last line.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_IS_AFTER_LAST_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_IS_AFTER_LAST_1100 start====");
          let result = testNapi.testGoToNextRowAfterLast();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_IS_AFTER_LAST_1100 result: " + result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_STEP_RESULT_IS_AFTER_LAST_1100 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.number  : SUB_OH_Rdb_ErrCode_RDB_E_INVALID_OBJECT_TYPE_1200
     * @tc.name    : SUB_OH_Rdb_ErrCode_RDB_E_INVALID_OBJECT_TYPE_1200
     * @tc.desc    : In the fault scenario where the object type in the test error code information is illegal.
     * @tc.level   : Level1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('SUB_OH_Rdb_ErrCode_RDB_E_INVALID_OBJECT_TYPE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_OBJECT_TYPE_1200 start====");
          let result: number = testNapi.testInvalidObjectType();
          console.info("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_OBJECT_TYPE_1200 result====", result);
          expect(result).assertEqual(RDB_E_INVALID_OBJECT_TYPE);
          done();
        } catch (err) {
          console.error("====>SUB_OH_Rdb_ErrCode_RDB_E_INVALID_OBJECT_TYPE_1200 catch err: " + err);
          expect(err).assertFail();
          done();
        }
      })
  })
}
