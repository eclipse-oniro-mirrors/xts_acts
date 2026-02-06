/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium";
import factory from '@ohos.data.distributedKVStore';
import common from "@ohos.app.ability.common";

const TEST_BUNDLE_NAME = 'ohos.acts.kvStore';
const TEST_STORE_ID = 'storeId';
let kvManager = null;
let kvStore = null;
let resultSet = null;
let context: common.UIAbilityContext;

export default function kvStoreResultSetStageTest(){
  describe('kvStoreResultSetStageTest', function() {
    const options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : factory.KVStoreType.SINGLE_VERSION,
      schema : '',
      securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async function (done) {
      console.info('beforeAll');
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config = {
        bundleName : TEST_BUNDLE_NAME,
        context: context
      }
      console.info('beforeAll config:' + JSON.stringify(config));
      kvManager =  factory.createKVManager(config);
      await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then(async (data) => {
        console.info('beforeAll getAllKVStoreId size = ' + data.length);
        if (data.length === 0) {
          console.info('beforeAll end, data.length: 0');
          done();
          return;
        } else {
            console.info('beforeAll end, data.length: !0');
            for (var i = 0; i < data.length; i++) {
                await kvManager.deleteKVStore(TEST_BUNDLE_NAME, data[i]).then(() => {
                    console.info('beforeAll deleteKVStore success ' + data[i]);
                    console.info('beforeAll end');
                    done();
                }).catch((err) => {
                    console.info('beforeAll deleteKVStore store: ' + data[i]);
                    console.error('beforeAll deleteKVStore error ' + `, error code is ${err.code}, message is ${err.message}`);
                    done();
                });
            }
        }
      }).catch((err) => {
        console.info('beforeAll getAllKVStoreId err ' + err);
        done();
      });


    })

    afterAll(async function (done) {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async function (done) {
      console.info('beforeEach');
      await kvManager.getKVStore(TEST_STORE_ID, options).then((store) => {
        kvStore = store;
        console.info('beforeEach getKVStore success');
      }).catch((err) => {
        console.info('beforeEach getKVStore err ' + err);
      });
      let entries = [];
      for (let i = 0; i < 10; i++) {
        let key = 'batch_test_string_key';
        let entry = {
          key : key + i,
          value : {
            type : factory.ValueType.STRING,
            value : 'batch_test_string_value'
          }
        }
        entries.push(entry);
      }
      await kvStore.putBatch(entries).then(async (err) => {
        console.info('beforeEach putBatch success');
      }).catch((err) => {
        console.info('beforeEach putBatch fail ' + err);
      });
      await kvStore.getResultSet('batch_test_string_key').then((result) => {
        console.info('beforeEach getResultSet success');
        resultSet = result;
        done();
      }).catch((err) => {
        console.info('beforeEach getResultSet fail ' + err);
        done();
      });

    })

    afterEach(async function (done) {
      console.info('afterEach');
      await kvStore.closeResultSet(resultSet).then((err) => {
        console.info('afterEach closeResultSet success');
      }).catch((err) => {
        console.info('afterEach closeResultSet fail ' + err);
      });
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
          kvStore = null;
          resultSet = null;
          done();
        }).catch((err) => {
          console.info('afterEach deleteKVStore err ' + err);
          done();
        });
      }).catch((err) => {
        console.info('afterEach closeKVStore err ' + err);
        done();
      });

    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetCount001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0100
     * @tc.desc   Test Js Api KvStoreResultSet.GetCount()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetCount001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let count = resultSet.getCount();
        console.info("testKvStoreResultSetGetCount001 getCount " + count);
        expect(count == 10).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetGetCount001 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetCount002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0200
     * @tc.desc   Test Js Api KvStoreResultSet.GetCount()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetCount002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let rs;
        await kvStore.getResultSet('test').then((result) => {
          console.info('testKvStoreResultSetGetCount002 getResultSet success');
          rs = result;
          expect(rs.getCount() == 0).assertTrue();
        }).catch((err) => {
          console.info('testKvStoreResultSetGetCount002 getResultSet fail ' + err);
          expect(null).assertFail();
        });
        await kvStore.closeResultSet(rs).then((err) => {
          console.info('testKvStoreResultSetGetCount002 closeResultSet success');
        }).catch((err) => {
          console.info('testKvStoreResultSetGetCount002 closeResultSet fail ' + err);
          expect(null).assertFail();
        });
      } catch (e) {
        console.info('testKvStoreResultSetGetCount002 e ' + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetCount003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0300
     * @tc.desc   Test Js Api KvStoreResultSet.GetCount()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetCount003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let count = resultSet.getCount(123);
        console.info("testKvStoreResultSetGetCount003 getCount " + count);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetGetCount003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetCount004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0400
     * @tc.desc   Test Js Api KvStoreResultSet.GetCount()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetCount004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let count = resultSet.getCount(123, 'test_string');
        console.info("testKvStoreResultSetGetCount004 getCount " + count);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetGetCount004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetPosition001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0900
     * @tc.desc   Test Js Api KvStoreResultSet.GetPosition()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetPosition001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition();
        console.info("testKvStoreResultSetGetPosition001 getPosition " + position);
        expect(position == -1).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetGetPosition001 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetPosition002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1000
     * @tc.desc   Test Js Api KvStoreResultSet.GetPosition()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetPosition002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition();
        console.info("testKvStoreResultSetGetPosition002 getPosition " + position);
        expect(position).assertEqual(-1);
        let flag = resultSet.moveToLast();
        expect(flag).assertTrue();
        position = resultSet.getPosition();
        expect(position).assertEqual(9);
      } catch (e) {
        console.info("testKvStoreResultSetGetPosition002 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetPosition003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1100
     * @tc.desc   Test Js Api KvStoreResultSet.GetPosition()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetPosition003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition(123);
        console.info("testKvStoreResultSetGetPosition003 getPosition " + position);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetGetPosition003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetPosition004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1200
     * @tc.desc   Test Js Api KvStoreResultSet.GetPosition()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetPosition004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition(123, 'test_string');
        console.info("testKvStoreResultSetGetPosition004 getPosition " + position);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetGetPosition004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToFirst001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3300
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToFirst001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        console.info("testKvStoreResultSetMoveToFirst001 moveToFirst " + moved);
        expect(moved).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetMoveToFirst001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToFirst002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3400
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToFirst002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        console.info("testKvStoreResultSetMoveToFirst002 moveToFirst " + moved);
        expect(moved).assertTrue();
        let pos = resultSet.getPosition();
        console.info("testKvStoreResultSetMoveToFirst002 getPosition " + pos);
        expect(pos == 0).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetMoveToFirst002 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToFirst003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3500
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToFirst003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst(123);
        console.info("testKvStoreResultSetMoveToFirst003 moveToFirst " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToFirst003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToFirst004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3600
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToFirst004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst(123, 'test_string');
        console.info("testKvStoreResultSetMoveToFirst004 moveToFirst " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToFirst004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToFirst005
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3700
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst()testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToFirst005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("testKvStoreResultSetMoveToFirst004 moveToFirst " + moved);
        expect(moved && (resultSet.getPosition() == 9)).assertTrue();
        moved = resultSet.moveToFirst();
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToFirst004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToLast001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3800
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToLast()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("testKvStoreResultSetMoveToLast001 moveToLast " + moved);
        expect(moved).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetMoveToLast001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToLast002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3900
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToLast()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("testKvStoreResultSetMoveToLast002 moveToLast " + moved);
        expect(moved && (resultSet.getPosition() == 9)).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetMoveToLast002 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToLast003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4000
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToLast()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast(123);
        console.info("testKvStoreResultSetMoveToLast003 moveToLast " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToLast003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToLast004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4100
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToLast()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast(123, 'test_string');
        console.info("testKvStoreResultSetMoveToLast004 moveToLast " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToLast004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToNext001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4200
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToNext()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToNext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        console.info("testKvStoreResultSetMoveToNext001 moveToNext " + moved);
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetMoveToNext001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToNext002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4300
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToNext()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToNext002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        console.info("testKvStoreResultSetMoveToNext002 moveToNext " + moved);
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        moved = resultSet.moveToNext();
        expect(moved && (resultSet.getPosition() == 1)).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetMoveToNext002 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToNext003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4400
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToNext()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToNext003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext(123);
        console.info("testKvStoreResultSetMoveToNext003 moveToNext " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToNext003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToNext004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4500
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToNext()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToNext004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext(123, 'test_string');
        console.info("testKvStoreResultSetMoveToNext004 moveToNext " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToNext004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPrevious001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_5000
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPrevious001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious();
        console.info("testKvStoreResultSetMoveToPrevious001 moveToPrevious " + moved);
        expect(!moved).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetMoveToPrevious001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPrevious002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_5100
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPrevious002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        moved = resultSet.moveToNext();
        console.info("testKvStoreResultSetMoveToPrevious002 moveToNext " + moved);
        expect(moved && (resultSet.getPosition() == 1)).assertTrue();
        moved = resultSet.moveToPrevious();
        console.info("testKvStoreResultSetMoveToPrevious002 moveToPrevious " + moved);
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToPrevious002 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPrevious003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_5200
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPrevious003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious(123);
        console.info("testKvStoreResultSetMoveToPrevious003 moveToPrevious " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToPrevious003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPrevious004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_5300
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPrevious004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious(123, 'test_string');
        console.info("testKvStoreResultSetMoveToPrevious004 moveToPrevious " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToPrevious004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPrevious005
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_5400
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious()testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPrevious005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        moved = resultSet.moveToPrevious();
        console.info("testKvStoreResultSetMoveToPrevious005 from 0 to -1 return" + moved);
        expect(moved == false).assertTrue();
        console.info("testKvStoreResultSetMoveToPrevious005 from 0 to " + resultSet.getPosition());
        expect(-1).assertEqual(resultSet.getPosition());
      } catch (e) {
        console.info("testKvStoreResultSetMoveToPrevious005 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMove001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2900
     * @tc.desc   Test Js Api KvStoreResultSet.Move()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMove001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.move();
        console.info("testKvStoreResultSetMove001 move " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMove001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMove002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3000
     * @tc.desc   Test Js Api KvStoreResultSet.Move()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMove002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        resultSet.moveToFirst();
        expect(resultSet.getPosition() == 0).assertTrue();
        let moved = resultSet.move(3);
        console.info("testKvStoreResultSetMove002 move " + moved);
        expect(moved).assertTrue();
        expect(3).assertEqual(resultSet.getPosition());
      } catch (e) {
        console.info("testKvStoreResultSetMove002 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMove003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_3100
     * @tc.desc   Test Js Api KvStoreResultSet.Move()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMove003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        expect(resultSet.getPosition() == -1).assertTrue();
        let moved = resultSet.move(3);
        console.info("testKvStoreResultSetMove003 move " + moved);
        expect(moved && (resultSet.getPosition() == 2)).assertTrue();
        moved = resultSet.move(2);
        console.info("testKvStoreResultSetMove003 move " + moved);
        expect(moved && (resultSet.getPosition() == 4)).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetMove003 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPosition001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4600
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPosition()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPosition001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPosition();
        console.info("testKvStoreResultSetMoveToPosition001 moveToPosition " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToPosition001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPosition003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4600
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPosition()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPosition003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPosition(5);
        console.info("testKvStoreResultSetMoveToPosition003 moveToPosition " + moved);
        expect(moved && (resultSet.getPosition() == 5)).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToPosition003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetMoveToPosition004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_4900
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPosition()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetMoveToPosition004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.move(3);
        console.info("testKvStoreResultSetMoveToPosition004 moveToPosition " + moved);
        expect(moved && (resultSet.getPosition() == 2)).assertTrue();
        moved = resultSet.moveToPosition(5);
        console.info("testKvStoreResultSetMoveToPosition004 moveToPosition " + moved);
        expect(moved && (resultSet.getPosition() == 5)).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetMoveToPosition004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsFirst001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2100
     * @tc.desc   Test Js Api KvStoreResultSet.IsFirst()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsFirst001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst();
        console.info("testKvStoreResultSetIsFirst001 isFirst " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetIsFirst001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsFirst002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2200
     * @tc.desc   Test Js Api KvStoreResultSet.IsFirst()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsFirst002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst();
        console.info("testKvStoreResultSetIsFirst002 isFirst " + flag);
        expect(!flag).assertTrue();
        resultSet.move(3);
        flag = resultSet.isFirst();
        console.info("testKvStoreResultSetIsFirst002 isFirst " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetIsFirst002 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsFirst003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2300
     * @tc.desc   Test Js Api KvStoreResultSet.IsFirst()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsFirst003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst(1);
        console.info("testKvStoreResultSetIsFirst003 isFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsFirst003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsFirst004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2400
     * @tc.desc   Test Js Api KvStoreResultSet.IsFirst()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsFirst004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst(1, 'test_string');
        console.info("testKvStoreResultSetIsFirst004 isFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsFirst004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsLast001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2500
     * @tc.desc   Test Js Api KvStoreResultSet.IsLast()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isLast();
        console.info("testKvStoreResultSetIsLast001 isLast " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetIsFirst004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsLast002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2600
     * @tc.desc   Test Js Api KvStoreResultSet.IsLast()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        resultSet.moveToLast();
        let flag = resultSet.isLast();
        console.info("testKvStoreResultSetIsLast002 isLast " + flag);
        expect(flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetIsLast002 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsLast003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2700
     * @tc.desc   Test Js Api KvStoreResultSet.IsLast()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isLast(1);
        console.info("testKvStoreResultSetIsLast003 isLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsLast003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsLast004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2800
     * @tc.desc   Test Js Api KvStoreResultSet.IsLast()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isLast(1, 'test_string');
        console.info("testKvStoreResultSetIsLast004 isLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsLast004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsBeforeFirst001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1700
     * @tc.desc   Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsBeforeFirst001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isBeforeFirst();
        console.info("testKvStoreResultSetIsBeforeFirst001 isBeforeFirst " + flag);
        expect(flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetIsBeforeFirst001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsBeforeFirst002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1800
     * @tc.desc   Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsBeforeFirst002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious();
        expect(!moved).assertTrue();
        let flag = resultSet.isBeforeFirst();
        console.info("testKvStoreResultSetIsBeforeFirst002 isBeforeFirst " + flag);
        expect(flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetIsBeforeFirst002 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsBeforeFirst003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1900
     * @tc.desc   Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsBeforeFirst003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isBeforeFirst(1);
        console.info("testKvStoreResultSetIsBeforeFirst003 isBeforeFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsBeforeFirst003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsBeforeFirst004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_2000
     * @tc.desc   Test Js Api KvStoreResultSet.IsBeforeFirst()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsBeforeFirst004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isBeforeFirst(1, 'test_string');
        console.info("testKvStoreResultSetIsBeforeFirst004 isBeforeFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsBeforeFirst004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsAfterLast001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1300
     * @tc.desc   Test Js Api KvStoreResultSet.IsAfterLast()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsAfterLast001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isAfterLast();
        console.info("testKvStoreResultSetIsAfterLast001 isAfterLast " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetIsAfterLast001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsAfterLast002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1400
     * @tc.desc   Test Js Api KvStoreResultSet.IsAfterLast()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsAfterLast002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("testKvStoreResultSetIsAfterLast002  moveToLast  moved=" + moved);
        expect(moved).assertTrue();
        moved = resultSet.moveToNext();
        console.info("testKvStoreResultSetIsAfterLast002  moveToNext  moved=" + moved);
        expect(moved == false).assertTrue();
        let flag = resultSet.isAfterLast();
        console.info("testKvStoreResultSetIsAfterLast002  isAfterLast true=" + flag);
        expect(flag).assertTrue();
      } catch (e) {
        console.info("testKvStoreResultSetIsAfterLast002 fail " + e);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsAfterLast003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1500
     * @tc.desc   Test Js Api KvStoreResultSet.IsAfterLast()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsAfterLast003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isAfterLast(1);
        console.info("testKvStoreResultSetIsAfterLast003 isAfterLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsAfterLast003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetIsAfterLast004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_1600
     * @tc.desc   Test Js Api KvStoreResultSet.IsAfterLast()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetIsAfterLast004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isAfterLast(1, 'test_string');
        console.info("testKvStoreResultSetIsAfterLast004 isAfterLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetIsAfterLast004 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetEntry001
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0500
     * @tc.desc   Test Js Api KvStoreResultSet.GetEntry()testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetEntry001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        let entry = resultSet.getEntry();
        console.info("testKvStoreResultSetGetEntry001 getEntry " + entry);
        expect(moved && (entry.key == 'batch_test_string_key0')).assertTrue();
        expect(moved && (entry.value.value == 'batch_test_string_value')).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetGetEntry001 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetEntry002
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0600
     * @tc.desc   Test Js Api KvStoreResultSet.GetEntry()testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetEntry002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        let entry = resultSet.getEntry();
        console.info("testKvStoreResultSetGetEntry002 getEntry " + entry);
        expect(entry.key == 'batch_test_string_key0').assertTrue();
        expect(entry.value.value == 'batch_test_string_value').assertTrue();
        moved = resultSet.moveToNext();
        expect(moved).assertTrue();
        entry = resultSet.getEntry();
        console.info("testKvStoreResultSetGetEntry002 getEntry " + entry);
        expect(entry.key == 'batch_test_string_key1').assertTrue();
        expect(entry.value.value == 'batch_test_string_value').assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.info("testKvStoreResultSetGetEntry002 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetEntry003
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0700
     * @tc.desc   Test Js Api KvStoreResultSet.GetEntry()testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetEntry003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let entry = resultSet.getEntry(1);
        console.info("testKvStoreResultSetGetEntry003 getEntry " + entry);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetGetEntry003 fail " + e);
      }
      done();
    })

    /**
     * @tc.name   testEtsKvStoreResultSetGetEntry004
     * @tc.number SUB_DistributedData_KVStore_SDK_KvStoreResultSetEtsApiTest_0800
     * @tc.desc   Test Js Api KvStoreResultSet.GetEntry()testcase 004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEtsKvStoreResultSetGetEntry004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let entry = resultSet.getEntry(1, 'test_string');
        console.info("testKvStoreResultSetGetEntry004 getEntry " + entry);
        expect(null).assertFail();
      } catch (e) {
        console.info("testKvStoreResultSetGetEntry004 fail " + e);
      }
      done();
    })
  })
}