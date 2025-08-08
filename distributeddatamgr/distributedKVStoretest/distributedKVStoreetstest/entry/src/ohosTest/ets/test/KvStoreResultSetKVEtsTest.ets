/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import factory from '@ohos.data.distributedKVStore'
import abilityFeatureAbility from '@ohos.ability.featureAbility';
import common from "@ohos.app.ability.common";


let context: common.UIAbilityContext;
const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'storeId';
let kvManager = null;
let kvStore = null;
let resultSet = null;
export default function KvStoreResultSetTest(){
  describe('KvStoreResultSetTest', function() {
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
      context = AppStorage.Get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      const config = {
        bundleName : TEST_BUNDLE_NAME,
        context: context
      }
     
      console.info('beforeAll');
      console.info('beforeAll config:' + JSON.stringify(config));
      kvManager = factory.createKVManager(config);
      await kvManager.getAllKVStoreId(TEST_BUNDLE_NAME).then(async (data) => {
        console.info('beforeAll getAllKVStoreId size = ' + data.length);
        for (let i = 0; i < data.length; i++) {
          await kvManager.deleteKVStore(TEST_BUNDLE_NAME, data[i]).then(() => {
            console.info('beforeAll deleteKVStore success ' + data[i]);
          }).catch((err) => {
            console.info('beforeAll deleteKVStore store: ' + data[i]);
            console.error('beforeAll deleteKVStore error ' + `, error code is ${err.code}, message is ${err.message}`);
          });
        }
      }).catch((err) => {
        console.error('beforeAll getAllKVStoreId err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      console.info('beforeAll end');
      done();
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
        console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
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
        console.error('beforeEach putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      await kvStore.getResultSet('batch_test_string_key').then((result) => {
        console.info('beforeEach getResultSet success');
        resultSet = result;
      }).catch((err) => {
        console.error('beforeEach getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      console.info('beforeEach end');
      done();
    })

    afterEach(async function (done) {
      console.info('afterEach');
      await kvStore.closeResultSet(resultSet).then((err) => {
        console.info('afterEach closeResultSet success');
      }).catch((err) => {
        console.error('afterEach closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID, kvStore).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
        }).catch((err) => {
          console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }).catch((err) => {
        console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      kvStore = null;
      resultSet = null;
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0100
     * @tc.desc Test Js Api KvStoreResultSet.GetCount() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetCount() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let count = resultSet.getCount();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0100 getCount " + count);
        expect(count == 10).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0200
     * @tc.desc Test Js Api KvStoreResultSet.GetCount() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetCount() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let rs;
        await kvStore.getResultSet('test').then((result) => {
          console.info('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 getResultSet success');
          rs = result;
          expect(rs.getCount() == 0).assertTrue();
        }).catch((err) => {
          console.error('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
        await kvStore.closeResultSet(rs).then((err) => {
          console.info('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 closeResultSet success');
        }).catch((err) => {
          console.error('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
        });
      } catch (e) {
        console.error('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0300
     * @tc.desc Test Js Api KvStoreResultSet.GetCount() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetCount() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let count = resultSet.getCount(123);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0300 getCount " + count);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0400
     * @tc.desc Test Js Api KvStoreResultSet.GetCount() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetCount() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let count = resultSet.getCount(123, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0400 getCount " + count);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0900
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetPosition() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100 getPosition " + position);
        expect(position == -1).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1000
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetPosition() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0200 getPosition " + position);
        expect(position).assertEqual(-1);
        let flag = resultSet.moveToLast();
        expect(flag).assertTrue();
        position = resultSet.getPosition();
        expect(position).assertEqual(9);
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1100
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetPosition() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition(123);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0300 getPosition " + position);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1200
     * @tc.desc Test Js Api KvStoreResultSet.GetPosition() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetPosition() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let position = resultSet.getPosition(123, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0400 getPosition " + position);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3200
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToFirst() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0100 moveToFirst " + moved);
        expect(moved).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3300
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToFirst() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200 moveToFirst " + moved);
        expect(moved).assertTrue();
        let pos = resultSet.getPosition();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200 getPosition " + pos);
        expect(pos == 0).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3400
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToFirst() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst(123);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0300 moveToFirst " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3500
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToFirst() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst(123, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0400 moveToFirst " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3600
     * @tc.desc Test Js Api KvStoreResultSet.MoveToFirst() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToFirst() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0500 moveToFirst " + moved);
        expect(moved && (resultSet.getPosition() == 9)).assertTrue();
        moved = resultSet.moveToFirst();
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0500 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3700
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToLast() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0100 moveToLast " + moved);
        expect(moved).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3800
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToLast() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0200 moveToLast " + moved);
        expect(moved && (resultSet.getPosition() == 9)).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3900
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToLast() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast(123);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0300 moveToLast " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4000
     * @tc.desc Test Js Api KvStoreResultSet.MoveToLast() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToLast() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast(123, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0400 moveToLast " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4100
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToNext() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0100 moveToNext " + moved);
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4200
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToNext() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0200 moveToNext " + moved);
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        moved = resultSet.moveToNext();
        expect(moved && (resultSet.getPosition() == 1)).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4300
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToNext() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext(123);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0300 moveToNext " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4400
     * @tc.desc Test Js Api KvStoreResultSet.MoveToNext() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToNext() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext(123, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0400 moveToNext " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4800
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPrevious() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0100 moveToPrevious " + moved);
        expect(!moved).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4900
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPrevious() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        moved = resultSet.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200 moveToNext " + moved);
        expect(moved && (resultSet.getPosition() == 1)).assertTrue();
        moved = resultSet.moveToPrevious();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200 moveToPrevious " + moved);
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_5000
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPrevious() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious(123);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0300 moveToPrevious " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_5100
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPrevious() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious(123, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0400 moveToPrevious " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_5200
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPrevious() testcase 005
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPrevious() testcase 005
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToFirst();
        expect(moved && (resultSet.getPosition() == 0)).assertTrue();
        moved = resultSet.moveToPrevious();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500 from 0 to -1 return" + moved);
        expect(moved == false).assertTrue();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500 from 0 to " + resultSet.getPosition());
        expect(-1).assertEqual(resultSet.getPosition());
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2900
     * @tc.desc Test Js Api KvStoreResultSet.Move() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.Move() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.move();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0100 move " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3000
     * @tc.desc Test Js Api KvStoreResultSet.Move() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.Move() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        resultSet.moveToFirst();
        expect(resultSet.getPosition() == 0).assertTrue();
        let moved = resultSet.move(3);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0200 move " + moved);
        expect(moved).assertTrue();
        expect(3).assertEqual(resultSet.getPosition());
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3100
     * @tc.desc Test Js Api KvStoreResultSet.Move() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.Move() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        expect(resultSet.getPosition() == -1).assertTrue();
        let moved = resultSet.move(3);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300 move " + moved);
        expect(moved && (resultSet.getPosition() == 2)).assertTrue();
        moved = resultSet.move(2);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300 move " + moved);
        expect(moved && (resultSet.getPosition() == 4)).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4500
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPosition() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPosition() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPosition();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0100 moveToPosition " + moved);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4600
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPosition() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPosition() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPosition(5);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0200 moveToPosition " + moved);
        expect(moved && (resultSet.getPosition() == 5)).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4700
     * @tc.desc Test Js Api KvStoreResultSet.MoveToPosition() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.MoveToPosition() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.move(3);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300 moveToPosition " + moved);
        expect(moved && (resultSet.getPosition() == 2)).assertTrue();
        moved = resultSet.moveToPosition(5);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300 moveToPosition " + moved);
        expect(moved && (resultSet.getPosition() == 5)).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2100
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsFirst() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0100 isFirst " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2200
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsFirst() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200 isFirst " + flag);
        expect(!flag).assertTrue();
        resultSet.move(3);
        flag = resultSet.isFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200 isFirst " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2300
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsFirst() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst(1);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0300 isFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2400
     * @tc.desc Test Js Api KvStoreResultSet.IsFirst() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsFirst() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isFirst(1, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0400 isFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2500
     * @tc.desc Test Js Api KvStoreResultSet.IsLast() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsLast() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0100 isLast " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2600
     * @tc.desc Test Js Api KvStoreResultSet.IsLast() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsLast() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        resultSet.moveToLast();
        let flag = resultSet.isLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0200 isLast " + flag);
        expect(flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2700
     * @tc.desc Test Js Api KvStoreResultSet.IsLast() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsLast() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isLast(1);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0300 isLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2800
     * @tc.desc Test Js Api KvStoreResultSet.IsLast() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsLast() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isLast(1, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0400 isLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1700
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isBeforeFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0100 isBeforeFirst " + flag);
        expect(flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1800
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToPrevious();
        expect(!moved).assertTrue();
        let flag = resultSet.isBeforeFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0200 isBeforeFirst " + flag);
        expect(flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1900
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isBeforeFirst(1);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0300 isBeforeFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2000
     * @tc.desc Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isBeforeFirst(1, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0400 isBeforeFirst " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1300
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsAfterLast() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isAfterLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100 isAfterLast " + flag);
        expect(!flag).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1400
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsAfterLast() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200  moveToLast  moved=" + moved);
        expect(moved).assertTrue();
        moved = resultSet.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200  moveToNext  moved=" + moved);
        expect(moved == false).assertTrue();
        let flag = resultSet.isAfterLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200  isAfterLast true=" + flag);
        expect(flag).assertTrue();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1500
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsAfterLast() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isAfterLast(1);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0300 isAfterLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1600
     * @tc.desc Test Js Api KvStoreResultSet.IsAfterLast() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.IsAfterLast() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let flag = resultSet.isAfterLast(1, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0400 isAfterLast " + flag);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0500
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry() testcase 001
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetEntry() testcase 001
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        let entry = resultSet.getEntry();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0100 getEntry " + entry);
        expect(moved && (entry.key == 'batch_test_string_key0')).assertTrue();
        expect(moved && (entry.value.value == 'batch_test_string_value')).assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0600
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry() testcase 002
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetEntry() testcase 002
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let moved = resultSet.moveToNext();
        let entry = resultSet.getEntry();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200 getEntry " + entry);
        expect(entry.key == 'batch_test_string_key0').assertTrue();
        expect(entry.value.value == 'batch_test_string_value').assertTrue();
        moved = resultSet.moveToNext();
        expect(moved).assertTrue();
        entry = resultSet.getEntry();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200 getEntry " + entry);
        expect(entry.key == 'batch_test_string_key1').assertTrue();
        expect(entry.value.value == 'batch_test_string_value').assertTrue();
      } catch (e) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0700
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry() testcase 003
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetEntry() testcase 003
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let entry = resultSet.getEntry(1);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0300 getEntry " + entry);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0800
     * @tc.desc Test Js Api KvStoreResultSet.GetEntry() testcase 004
     * @tc.type: FUNC
     * @tc.name Test Js Api KvStoreResultSet.GetEntry() testcase 004
     * @tc.size: MediumTest
     * @tc.level: Level 2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async function(done) {
      try {
        let entry = resultSet.getEntry(1, 'test_string');
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0400 getEntry " + entry);
        expect(null).assertFail();
      } catch (e) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })
  })
}