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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium";
import factory from '@ohos.data.distributedKVStore'


import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';

import Utils from './Util.test';
import hilog from '@ohos.hilog';
const domain = 0xFF00;
const tag = "TestTag";

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';
const TEST_STORE_ID = 'storeId';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.SingleKVStore | null = null;
let resultSet: factory.KVStoreResultSet | null = null;
let context: common.UIAbilityContext;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();


export default function KvStoreResultSetTest(){
  describe('KvStoreResultSetTest', () => {
    let TAG = '';
    const options: factory.Options = {
      createIfMissing : true,
      encrypt : false,
      backup : false,
      autoSync : true,
      kvStoreType : factory.KVStoreType.SINGLE_VERSION,
      schema : undefined,
      securityLevel : factory.SecurityLevel.S2,
    }

    beforeAll(async (done: () => void) => {

      try {
        hilog.info(domain, tag, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        // await abilityDelegator.startAbility({
        //   bundleName: 'com.example.kvstoreetstest.static',
        //   abilityName: 'EntryAbility'
        // });
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
      }

      const config : factory.KVManagerConfig = {
        bundleName : TEST_BUNDLE_NAME,
        context: context
      }

      console.info('beforeAll');
      console.info('beforeAll config:' + JSON.stringify(config));
      kvManager = factory.createKVManager(config);
      if (kvManager) {
        await kvManager!.getAllKVStoreId(TEST_BUNDLE_NAME).then(async (data: string[]) => {
          console.info('beforeAll getAllKVStoreId size = ' + data.length);
          if (data.length === 0) {
            console.info('beforeAll end, data.length: 0');
            done();
          } else {
            console.info('beforeAll end, data.length: !0');
            for (let i = 0; i < data.length; i++) {
              await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, data[i]).then(() => {
                console.info('beforeAll deleteKVStore success ' + data[i]);
                console.info('beforeAll end');
                done();
              }).catch((err: Error) => {
                console.info('beforeAll deleteKVStore store: ' + data[i]);
                console.error('beforeAll deleteKVStore error ' +
                  `, error code is ${err.code}, message is ${err.message}`);
                done();
              });
            }
          }
        }).catch((err: Error) => {
          console.error('beforeAll getAllKVStoreId err ' + `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      }
    })

    afterAll(async (done: () => void) => {
      console.info('afterAll');
      kvManager = null;
      kvStore = null;
      done();
    })

    beforeEach(async (done: () => void) => {
      console.info('beforeEach');

        let store: factory.SingleKVStore | null = null;
      if (kvManager) {
        await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
          hilog.info(domain, tag, TAG + '============ beforeEach kv is' + JSON.stringify(store));
          kvStore = store;

          console.info('beforeEach getKVStore success');
        }).catch((err: Error) => {
          console.error('beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });
      }
        let entries: factory.Entry[] = [];
        for (let i = 0; i < 10; i++) {
          let key = 'batch_test_string_key';
          let entry: factory.Entry = {
            key: key + i,
            value: {
              type: factory.ValueType.STRING,
              value: 'batch_test_string_value'
            }
          }
          entries.push(entry);
        }
        if (kvStore) {

        await kvStore!.putBatch(entries).then((err) => {
          console.info('beforeEach putBatch success');
        }).catch((err: Error) => {
          console.error('beforeEach putBatch fail ' + `, error code is ${err.code}, message is ${err.message}`);
        });
        await kvStore!.getResultSet('batch_test_string_key').then((result) => {
          console.info('beforeEach getResultSet success');
          resultSet = result;
          console.info('beforeEach end');
          done();
        }).catch((err: Error) => {
          console.error('beforeEach getResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
        }
    })

    afterEach(async (done: () => void) : Promise<void> => {
      console.info('afterEach');
      if (kvStore) {
        await kvStore!.closeResultSet(resultSet!).then((err) => {
          console.info('afterEach closeResultSet success');
        }).catch((err: Error) => {
          console.error('afterEach closeResultSet fail ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      }
        if (kvManager) {
          await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info('afterEach closeKVStore success');
            await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
              console.info('afterEach deleteKVStore success');
              kvStore = null;
              resultSet = null;
              done();
            }).catch((err: Error) => {
              console.error('afterEach deleteKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
              done();
            });
          }).catch((err: Error) => {
            console.error('afterEach closeKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
            done();
          });
        }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0100
     * @tc.desc   Test Js Api KvStoreResultSet.GetCount() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) : Promise<void> => {
      try {
        let count = resultSet!.getCount();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0100 getCount " + count);
        expect(count == 10).assertTrue();
        done();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0200
     * @tc.desc   Test Js Api KvStoreResultSet.GetCount() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) : Promise<void> => {
      TAG = 'SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        let rs: factory.KVStoreResultSet;
        hilog.info(domain, tag, TAG + 'SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 getResultSet start');
        hilog.info(domain, tag, TAG + 'SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 getResultSet start,' + JSON.stringify(kvStore));
        if (kvStore == null) {
          hilog.info(domain, tag, TAG + 'SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 kvStore == null');
        }
        await kvStore!.getResultSet('test').then((result) => {
          hilog.info(domain, tag, TAG + 'SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 getResultSet success');
          rs = result;
            expect(rs!.getCount() == 0).assertTrue();
          hilog.info(domain, tag, TAG + ' getCount 0 ');
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 getResultSet fail ' +
            `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
        await kvStore!.closeResultSet(rs!).then((err) => {
          console.info('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 closeResultSet success');
          done();
        }).catch((err: Error) => {
          console.error('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 closeResultSet fail ' +
            `, error code is ${err.code}, message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e: Error) {
        console.error('SUB_DDM_DKV_KVSTORERESULTSET_GETCOUNT_0200 e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0900
     * @tc.desc   Test Js Api KvStoreResultSet.GetPosition() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      TAG = 'SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100';
      hilog.info(domain, tag, TAG + ' start ');
      try {
        hilog.info(domain, tag, TAG + ' resultSet ');
        if (!resultSet) {
          hilog.info(domain, tag, TAG + 'SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100 resultSet is not initialized');
          expect(null).assertFail();
        }
        hilog.info(domain, tag, TAG + ' resultSet11111 ');
        let position = resultSet!.getPosition();
        hilog.info(domain, tag, TAG + "SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100 getPosition " + position);
        expect(position == -1).assertTrue();
        console.info("Assertion passed");
        done();
      } catch (e: Error) {
        hilog.info(domain, tag, TAG + ' catch ');
        hilog.info(domain, tag, TAG + "SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1000
     * @tc.desc   Test Js Api KvStoreResultSet.GetPosition() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let position = resultSet!.getPosition();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0200 getPosition " + position);
        expect(position).assertEqual(-1);
        let flag = resultSet!.moveToLast();
        expect(flag).assertTrue();
        position = resultSet!.getPosition();
        expect(position).assertEqual(9);
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETPOSITION_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3200
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0100 moveToFirst " + moved);
        expect(moved).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3300
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200 moveToFirst " + moved);
        expect(moved).assertTrue();
        let pos = resultSet!.getPosition();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200 getPosition " + pos);
        expect(pos == 0).assertTrue();
      } catch (e: Error) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3600
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToFirst() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0500 moveToFirst " + moved);
        expect(moved && (resultSet!.getPosition() == 9)).assertTrue();
        moved = resultSet!.moveToFirst();
        expect(moved && (resultSet!.getPosition() == 0)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOFIRST_0500 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3700
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToLast() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0100 moveToLast " + moved);
        expect(moved).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3800
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToLast() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0200 moveToLast " + moved);
        expect(moved && (resultSet!.getPosition() == 9)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOLAST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4100
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToNext() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0100 moveToNext " + moved);
        expect(moved && (resultSet!.getPosition() == 0)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4200
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToNext() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0200 moveToNext " + moved);
        expect(moved && (resultSet!.getPosition() == 0)).assertTrue();
        moved = resultSet!.moveToNext();
        expect(moved && (resultSet!.getPosition() == 1)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETONEXT_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4800
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToPrevious();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0100 moveToPrevious " + moved);
        expect(!moved).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4900
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToFirst();
        expect(moved && (resultSet!.getPosition() == 0)).assertTrue();
        moved = resultSet!.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200 moveToNext " + moved);
        expect(moved && (resultSet!.getPosition() == 1)).assertTrue();
        moved = resultSet!.moveToPrevious();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200 moveToPrevious " + moved);
        expect(moved && (resultSet!.getPosition() == 0)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })


    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_5200
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPrevious() testcase 005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToFirst();
        expect(moved && (resultSet!.getPosition() == 0)).assertTrue();
        moved = resultSet!.moveToPrevious();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500 from 0 to -1 return" + moved);
        expect(moved == false).assertTrue();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500 from 0 to " + resultSet!.getPosition());
        expect(-1).assertEqual(resultSet!.getPosition());
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVETOPREVIOUS_0500 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })


    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3000
     * @tc.desc   Test Js Api KvStoreResultSet.Move() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        resultSet!.moveToFirst();
        expect(resultSet!.getPosition() == 0).assertTrue();
        let moved = resultSet!.move(3);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0200 move " + moved);
        expect(moved).assertTrue();
        expect(3).assertEqual(resultSet!.getPosition());
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_3100
     * @tc.desc   Test Js Api KvStoreResultSet.Move() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        expect(resultSet!.getPosition() == -1).assertTrue();
        let moved = resultSet!.move(3);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300 move " + moved);
        expect(moved && (resultSet!.getPosition() == 2)).assertTrue();
        moved = resultSet!.move(2);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300 move " + moved);
        expect(moved && (resultSet!.getPosition() == 4)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_SETMOVE_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })


    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4600
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPosition() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToPosition(5);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0200 moveToPosition " + moved);
        expect(moved && (resultSet!.getPosition() == 5)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_4700
     * @tc.desc   Test Js Api KvStoreResultSet.MoveToPosition() testcase 003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.move(3);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300 moveToPosition " + moved);
        expect(moved && (resultSet!.getPosition() == 2)).assertTrue();
        moved = resultSet!.moveToPosition(5);
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300 moveToPosition " + moved);
        expect(moved && (resultSet!.getPosition() == 5)).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_MOVETOPOSITION_0300 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2100
     * @tc.desc   Test Js Api KvStoreResultSet.IsFirst() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let flag = resultSet!.isFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0100 isFirst " + flag);
        expect(!flag).assertTrue();
      } catch (e: Error) {
        expect(null).assertFail();
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2200
     * @tc.desc   Test Js Api KvStoreResultSet.IsFirst() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let flag = resultSet!.isFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200 isFirst " + flag);
        expect(!flag).assertTrue();
        resultSet!.move(3);
        flag = resultSet!.isFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200 isFirst " + flag);
        expect(!flag).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2500
     * @tc.desc   Test Js Api KvStoreResultSet.IsLast() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let flag = resultSet!.isLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0100 isLast " + flag);
        expect(!flag).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISFIRST_0400 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_2600
     * @tc.desc   Test Js Api KvStoreResultSet.IsLast() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        resultSet!.moveToLast();
        let flag = resultSet!.isLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0200 isLast " + flag);
        expect(flag).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISLAST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1700
     * @tc.desc   Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let flag = resultSet!.isBeforeFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0100 isBeforeFirst " + flag);
        expect(flag).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1800
     * @tc.desc   Test Js Api KvStoreResultSet.IsBeforeFirst() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToPrevious();
        expect(!moved).assertTrue();
        let flag = resultSet!.isBeforeFirst();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0200 isBeforeFirst " + flag);
        expect(flag).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISBEFOREFIRST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1300
     * @tc.desc   Test Js Api KvStoreResultSet.IsAfterLast() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let flag = resultSet!.isAfterLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100 isAfterLast " + flag);
        expect(!flag).assertTrue();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100 assertTrue ");
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_1400
     * @tc.desc   Test Js Api KvStoreResultSet.IsAfterLast() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200  moveToLast  moved=" + moved);
        expect(moved).assertTrue();
        moved = resultSet!.moveToNext();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200  moveToNext  moved=" + moved);
        expect(moved == false).assertTrue();
        let flag = resultSet!.isAfterLast();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200  isAfterLast true=" + flag);
        expect(flag).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_ISAFTERLAST_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0500
     * @tc.desc   Test Js Api KvStoreResultSet.GetEntry() testcase 001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToNext();
        let entry = resultSet!.getEntry();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0100 getEntry " + entry);
        expect(moved && (entry.key == 'batch_test_string_key0')).assertTrue();
        expect(moved && (entry.value.value == 'batch_test_string_value')).assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0100 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_DisKVResultEtsApiTest_0600
     * @tc.desc   Test Js Api KvStoreResultSet.GetEntry() testcase 002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        if (!resultSet) {
          console.error('resultSet is not initialized');
          expect(null).assertFail();
        }
        let moved = resultSet!.moveToNext();
        let entry = resultSet!.getEntry();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200 getEntry " + entry);
        expect(entry.key == 'batch_test_string_key0').assertTrue();
        expect(entry.value.value == 'batch_test_string_value').assertTrue();
        moved = resultSet!.moveToNext();
        expect(moved).assertTrue();
        entry = resultSet!.getEntry();
        console.info("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200 getEntry " + entry);
        expect(entry.key == 'batch_test_string_key1').assertTrue();
        expect(entry.value.value == 'batch_test_string_value').assertTrue();
      } catch (e: Error) {
        console.error("SUB_DDM_DKV_KVSTORERESULTSET_GETENTRY_0200 fail " + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
      }
      done();
    })

  })
}