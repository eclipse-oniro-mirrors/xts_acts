/*
* Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Level,
  Size
} from '../../../hypium';
import factory from '@ohos.data.distributedKVStore';

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
const TEST_STORE_ID = 'SingleKvStoreReturnValueId';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.SingleKVStore | null = null;
let resultSet: factory.KVStoreResultSet | null = null;

let entries: factory.Entry[] = [];
let context: common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

const TAG = "[testtag >>>>>> ]"

export default function SingleKvStoreReturnValue() {
  describe('SingleKvStoreReturnValue', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done: () => void): Promise<void> => {
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
        hilog.info(domain, tag, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, tag, '%{public}s', '================ beforeAll context end==========');
      }
      const config: factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context!
      };
      console.info(TAG + 'beforeAll context.databaseDir=' + context!.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
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
      console.info(TAG + `entries: ${entries}`);

      console.info(TAG + 'beforeAll end');
      done();

    });

    beforeEach(async (done: () => void) => {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));

      try {
        const store = await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options);
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
        done();
      } catch (err) {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      }
    });

    afterEach(async (done: () => void) => {
      console.info(TAG + 'afterEach');
      if (kvManager) {

        await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
          console.info('afterEach closeKVStore success');

          await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info('afterEach deleteKVStore success');
            kvStore = null;
            done();
          }).catch((err: Error) => {
            console.error(TAG + 'afterEach getKVStore err ' +
              `, error code is ${err.code}, message is ${err.message}`);
            done();
          });
        }).catch((err: Error) => {
          console.error(TAG + 'afterEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      };

    });

    afterAll(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0300
     * @tc.desc   getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0300 begin---------  ');
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
          console.info(TAG + `entries: ${entries}`);

          kvStore!.putBatch(entries, (err: BusinessError | null) => {
            console.info(TAG + 'Succeeded putBatch, err=' + err);
            kvStore!.getEntries('batch_test_string_key',
              (err: BusinessError | null, entries: factory.Entry[] | undefined) => {
                console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries?.length) +
                  ',err=' + err);
                expect(entries != null).assertTrue();
                expect(entries?.length).assertEqual(10);
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0300 end---------  ');
                done();
              });

          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0301
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0301
     * @tc.desc   getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0301 begin---------  ');
          kvStore!.getEntries('batch_test_string_key',
            (err: BusinessError | null, entries: factory.Entry[] | undefined) => {
              console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' +
                err);
              expect(entries != null).assertTrue();
              expect(entries?.length).assertEqual(0);
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0301 end---------  ');
              done();
            });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0400
     * @tc.desc   getEntries(keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0400 begin---------  ');
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

          await kvStore!.putBatch(entries);

          kvStore!.getEntries('batch_test_string_key').then((entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0400 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0401
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0401
     * @tc.desc   getEntries(keyPrefix: string): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0401 begin---------  ');

          kvStore!.getEntries('batch_test_string_key').then((entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(0);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0401 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0700
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0700
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0700 begin---------  ');
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
          console.info(TAG + `entries: ${entries}`);

          kvStore!.putBatch(entries, (err: BusinessError | null) => {
            console.info(TAG + 'Succeeded putBatch, err=' + err);
            kvStore!.getEntries('batch_test_string_key',
              (err: BusinessError | null, entries: factory.Entry[] | undefined) => {
                console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' +
                  err);
                expect(entries != null).assertTrue();
                expect(entries?.length).assertEqual(10);
                console.info(TAG + ' --------- SUB_DDM_DKV_ReturnValue_0300 end---------  ');
                done();
              });

          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0701
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0701
     * @tc.desc   getEntries(query: Query, callback: AsyncCallback<Entry[]>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0701', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0701 begin---------  ');
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getEntries('batch_test_string_key',
            (err: BusinessError | null, entries: factory.Entry[] | undefined) => {
              console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=' +
                err);
              expect(entries != null).assertTrue();
              expect(entries?.length).assertEqual(0);
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0701 end---------  ');
              done();
            });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0800
     * @tc.desc   getEntries(query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0800 begin---------  ');
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

          await kvStore!.putBatch(entries);
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getEntries(query).then((entries: factory.Entry[] | null) => {
            console.info(TAG + 'Succeeded getEntries,entries.length=' + JSON.stringify(entries?.length) + ',err=');
            expect(entries != null).assertTrue();
            expect(entries?.length).assertEqual(10);
            expect(entries?.length).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0800 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_0801
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_0801
     * @tc.desc   getEntries(query: Query): Promise<Entry[]>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_0801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0801 begin---------  ');
          const query = new factory.Query();
          query.prefixKey("batch_test");
          kvStore!.getEntries(query).then((entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded getEntries, entries.length=' + JSON.stringify(entries.length));
            expect(entries != null).assertTrue();
            expect(entries.length).assertEqual(0);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_0801 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1100
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1100 begin---------  ');
          kvStore!.put(KEY_TEST_BOOL_ELEMENT, true, (err: BusinessError | null) => {
            console.info(TAG + "Succeeded in putting");

            kvStore!.get(KEY_TEST_BOOL_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info(TAG + `Succeeded in getting data=${data}`);
                expect(data).assertEqual(true);
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1100 end---------  ');
                done();
              });
          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1101
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1101
     * @tc.desc   get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1101 begin---------  ');
          kvStore!.put(KEY_TEST_BOOL_ELEMENT, false, (err: BusinessError | null) => {
            console.info(TAG + "Succeeded in putting");

            kvStore!.get(KEY_TEST_BOOL_ELEMENT,
              (err: BusinessError | null, data: undefined | Boolean | String | Long | Double | Uint8Array) => {
                console.info(TAG + `Succeeded in getting data=${data}`);
                expect(data).assertEqual(false);
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1101 end---------  ');
                done();
              });
          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1200
     * @tc.desc   get(key: string): Promise<boolean | string | number | Uint8Array>---true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1200 begin---------  ');
          await kvStore!.put(KEY_TEST_BOOL_ELEMENT, true);

          kvStore!.get(KEY_TEST_BOOL_ELEMENT).then((data: Boolean | String | Long | Double | Uint8Array) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(true);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1200 end---------  ');
            done();

          }).catch((err: Error) => {
            console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1201
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1201
     * @tc.desc   get(key: string): Promise<boolean | string | number | Uint8Array>---false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          const KEY_TEST_BOOL_ELEMENT = 'key_test_string';
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1201 begin---------  ');
          await kvStore!.put(KEY_TEST_BOOL_ELEMENT, false);

          kvStore!.get(KEY_TEST_BOOL_ELEMENT).then((data: Boolean | String | Long | Double | Uint8Array) => {
            console.info(TAG + `Succeeded in getting data=${data}`);
            expect(data).assertEqual(false);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1201 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(`Failed to get.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1600
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<number>): void---number = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1600 begin---------  ');
          console.info(TAG + `entries: ${entries}`);
          kvStore!.putBatch(entries, (err: BusinessError | null) => {
            console.info(TAG + 'Succeeded putBatch, err=' + err);
            const query = new factory.Query();
            query.prefixKey("batch_test");
            kvStore!.getResultSize(query, (err: BusinessError | null, resultSize: int | undefined) => {
              console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' + err);
              expect(resultSize).assertEqual(10);
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1600 end---------  ');
              done();
            });

          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1601
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1601
     * @tc.desc   getResultSize(query: Query, callback: AsyncCallback<number>): void---number = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1601 begin---------  ');
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSize(query, (err: BusinessError | null, resultSize: int | undefined) => {
            console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize) + ',err=' +
              err?.code +
              err?.message);
            expect(resultSize).assertEqual(undefined);
            expect(err?.code).assertEqual(15100004);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1601 end---------  ');
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1800
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1800
     * @tc.desc   getResultSize(query: Query): Promise<Entry[]>---number = 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1800 begin---------  ');
          console.info(TAG + `entries: ${entries}`);
          await kvStore!.putBatch(entries);
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSize(query).then((resultSize: Int) => {
            console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
            expect(resultSize).assertEqual(10);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1800 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_1801
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_1801
     * @tc.desc   getResultSize(query: Query): Promise<Entry[]>---number = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_1801', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1801 begin---------  ');
          console.info(TAG + `entries: ${entries}`);
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSize(query).then((resultSize: Int) => {
            console.info(TAG + 'Succeeded getResultSize, resultSize=' + JSON.stringify(resultSize));
            expect(resultSize).assertEqual(undefined);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_1801 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get getResultSize.code is ${err.code},message is ${err.message}`);
            expect(err.code).assertEqual(15100004);
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2000
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2000
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result != null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2000 begin---------  ');
          console.info(TAG + `entries: ${entries}`);

          kvStore!.putBatch(entries, (err: BusinessError | null) => {
            console.info(TAG + 'Succeeded putBatch, err=' + err);
            kvStore!.getResultSet('batch_test_string_key',
              (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
                console.info(TAG + 'Succeeded getResultSet, result=' + result! + ',err=' + err);
                console.info(TAG + 'Succeeded getResultSet, result.getCount()=' + result!.getCount());
                expect(result != null).assertTrue();
                expect(result?.getCount() == 10).assertTrue();

                kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
                  console.info(TAG + 'Succeeded closeResultSet, err=' + err);
                  expect(err == null).assertTrue();
                })

                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2000 end---------  ');
                done();
              });
          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2001
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2001
     * @tc.desc   getResultSet(keyPrefix: string, callback: AsyncCallback<KVStoreResultSet>): void---result == null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2001 begin---------  ');
          // kvStore!.getResultSet('batch_test_string_key', (err: BusinessError, result: factory.KVStoreResultSet) => {
          kvStore!.getResultSet('batch_test_string_key',
            (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
              console.info(TAG + 'Succeeded getResultSet, result=' + JSON.stringify(result) + ',err=' + err);
              expect(result != null).assertTrue();

              expect(result!.getCount() == 0).assertTrue();

              kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
                console.info(TAG + 'Succeeded closeResultSet, err=' + err);
                expect(err == null).assertTrue();
              })

              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2001 end---------  ');
              done();
            });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2200
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2200 begin---------  ');
          await kvStore!.putBatch(entries);
          kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
            console.info(TAG + 'Succeeded getEntries, result=' + result);
            expect(result != null).assertTrue();
            expect(result.getCount()).assertEqual(10);

            await kvStore!.closeResultSet(result);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2200 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });


        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2201
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2201
     * @tc.desc   getResultSet(keyPrefix: string): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2201 begin---------  ');
          await kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
            console.info(TAG + 'Succeeded getEntries, result=' + result);
            expect(result != null).assertTrue();
            expect(result.getCount()).assertEqual(0);

            await kvStore!.closeResultSet(result);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2200 end---------  ');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2400
     * @tc.desc   getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2400 begin---------  ');

          kvStore!.putBatch(entries, (err: BusinessError | null) => {
            console.info(TAG + 'Succeeded putBatch, err=' + err);
            const query = new factory.Query();
            query.prefixKey("batch_test");

            kvStore!.getResultSet(query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
              console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
              expect(result != null).assertTrue();
              expect(result!.getCount()).assertEqual(10);

              kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
                console.info(TAG + 'Succeeded closeResultSet, err=' + err);
                expect(err == null).assertTrue();
              })
              console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2400 end---------  ');
              done();
            });

          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2401
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2401
     * @tc.desc   getResultSet(query: Query, callback:AsyncCallback<KVStoreResultSet>): void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2401 begin---------  ');
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSet(query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            expect(result != null).assertTrue();
            expect(result!.getCount()).assertEqual(0);

            kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2401 end---------  ');
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }

      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2600
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2600
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2600 begin---------  ');
          await kvStore!.putBatch(entries);
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSet(query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            expect(result != null).assertTrue();
            expect(result!.getCount()).assertEqual(10);

            kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2600 end---------  ');
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_2601
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_2601
     * @tc.desc   getResultSet(query: Query): Promise<KVStoreResultSet>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_2601', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2601 begin---------  ');
          const query = new factory.Query();
          query.prefixKey("batch_test");

          kvStore!.getResultSet(query, (err: BusinessError | null, result: factory.KVStoreResultSet | undefined) => {
            console.info(TAG + 'Succeeded getResultSet, result=' + result + ',err=' + err);
            expect(result != null).assertTrue();
            expect(result!.getCount()).assertEqual(0);

            kvStore!.closeResultSet(result!, (err: BusinessError | null) => {
              console.info(TAG + 'Succeeded closeResultSet, err=' + err);
              expect(err == null).assertTrue();
            })
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_2601 end---------  ');
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0100
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0100 begin---------  ');
          const optionsS1: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S1,
          };
          const TEST_STORE_S1_ID = 'DataChangeStoreS1Id';
          let store: factory.SingleKVStore | null = null;
          let kvStoreS1: factory.SingleKVStore | null = null;

          await kvManager!.getKVStore(TEST_STORE_S1_ID, optionsS1).then((store: factory.SingleKVStore) => {
            kvStoreS1 = store;
            console.info(TAG+' getKVStore success');
          }).catch((err: Error) => {
            console.error(TAG+' getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS1!.getSecurityLevel((err: BusinessError | null, data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data!) + ',err=' + err);
            expect(data).assertEqual(factory.SecurityLevel.S1);

            kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(async () => {
              console.info(TAG + '  Succeeded closeKVStore S1');
              kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S1');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0100 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S1 .code is ${err.code},message is ${err.message}`);
                done();
              });
            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
              done();
            });

          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0101
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0101
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0101 begin---------  ');
          const optionsS2: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S2,
          };
          const TEST_STORE_S2_ID = 'DataChangeStoreS2Id';


          let store: factory.SingleKVStore | null = null;
          let kvStoreS2: factory.SingleKVStore | null = null;

          await kvManager!.getKVStore(TEST_STORE_S2_ID, optionsS2).then((store: factory.SingleKVStore) => {
            kvStoreS2 = store;
            console.info(TAG+' getKVStore success');
          }).catch((err: Error) => {
            console.error(TAG+' getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS2!.getSecurityLevel((err: BusinessError | null, data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data!) + ',err=' + err);
            expect(data).assertEqual(factory.SecurityLevel.S2);

            kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
              console.info(TAG + '  Succeeded closeKVStore S2');

              kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S2');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0101 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S2 .code is ${err.code},message is ${err.message}`);
                done();
              });

            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S2 .code is ${err.code},message is ${err.message}`);
              done();
            });
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0102
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0102
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0102 begin---------  ');
          const optionsS3: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S3,
          };
          const TEST_STORE_S3_ID = 'DataChangeStoreS3Id';

          let store: factory.SingleKVStore | null = null;
          let kvStoreS3: factory.SingleKVStore | null = null;
          await kvManager!.getKVStore(TEST_STORE_S3_ID, optionsS3).then((store: factory.SingleKVStore) => {
            kvStoreS3 = store;
            console.info(TAG+' getKVStore success');
          }).catch((err: Error) => {
            console.error(TAG+' getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS3!.getSecurityLevel((err: BusinessError | null, data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data!) + ',err=' + err);
            expect(data).assertEqual(factory.SecurityLevel.S3);
            console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0102 data =factory.SecurityLevel.S3--------- ');

            kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
              console.info(TAG + '  Succeeded closeKVStore S3');
              kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S3');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0102 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S3 .code is ${err.code},message is ${err.message}`);
                done();
              });
            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S3 .code is ${err.code},message is ${err.message}`);
              done();
            });
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0103
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0103
     * @tc.desc   getSecurityLevel(callback: AsyncCallback<SecurityLevel>): void---S4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0103 begin---------  ');
          const optionsS4: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S4,
          };
          const TEST_STORE_S4_ID = 'DataChangeStoreS4Id';

          let store: factory.SingleKVStore | null = null;
          let kvStoreS4: factory.SingleKVStore | null = null;
          await kvManager!.getKVStore(TEST_STORE_S4_ID, optionsS4).then((store: factory.SingleKVStore) => {
            kvStoreS4 = store;
            console.info(TAG+' getKVStore success');
          }).catch((err: Error) => {
            console.error(TAG+' getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS4!.getSecurityLevel((err: BusinessError | null, data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel S4, data.=' + JSON.stringify(data!) + ',err=' + err);
            expect(data).assertEqual(factory.SecurityLevel.S4);

            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
              console.info(TAG + '  Succeeded closeKVStore S4');
              await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S4');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0103 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S4 .code is ${err.code},message is ${err.message}`);
                done();
              });
            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S4 .code is ${err.code},message is ${err.message}`);
              done();
            });
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0200
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0200 begin---------  ');
          const optionsS1: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S1,
          };
          const TEST_STORE_S1_ID = 'DataChangeStoreS1Id';

          let store: factory.SingleKVStore | null = null;
          let kvStoreS1: factory.SingleKVStore | null = null;
          await kvManager!.getKVStore(TEST_STORE_S1_ID, optionsS1).then((store: factory.SingleKVStore) => {
            kvStoreS1 = store;
            console.info('getKVStore success');
          }).catch((err: Error) => {
            console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS1!.getSecurityLevel().then(async (data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data!));
            expect(data).assertEqual(factory.SecurityLevel.S1);

            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(async () => {
              console.info(TAG + '  Succeeded closeKVStore S1');
              await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S1_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S1');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0200 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S1 .code is ${err.code},message is ${err.message}`);
                done();
              });
            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S1 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err: Error) => {
            console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0201
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0201
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0201 begin---------  ');
          const optionsS2: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S2,
          };
          const TEST_STORE_S2_ID = 'DataChangeStoreS2Id';

          let store: factory.SingleKVStore | null = null;
          let kvStoreS2: factory.SingleKVStore | null = null;
          await kvManager!.getKVStore(TEST_STORE_S2_ID, optionsS2).then((store: factory.SingleKVStore) => {
            kvStoreS2 = store;
            console.info('getKVStore success');
          }).catch((err: Error) => {
            console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS2!.getSecurityLevel().then(async (data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data!));
            expect(data).assertEqual(factory.SecurityLevel.S2);

            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(async () => {
              console.info(TAG + '  Succeeded closeKVStore S2');
              await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S2_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S2');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0201 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S2 .code is ${err.code},message is ${err.message}`);
                done();
              });
            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S2 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err: Error) => {
            console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0202
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0202
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0202 begin---------  ');
          const optionsS3: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S3,
          };
          const TEST_STORE_S3_ID = 'DataChangeStoreS3Id';

          let store: factory.SingleKVStore | null = null;
          let kvStoreS3: factory.SingleKVStore | null = null;
          await kvManager!.getKVStore(TEST_STORE_S3_ID, optionsS3).then((store: factory.SingleKVStore) => {
            kvStoreS3 = store;
            console.info('getKVStore success');
          }).catch((err: Error) => {
            console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS3!.getSecurityLevel().then(async (data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel, data.=' + JSON.stringify(data!));
            expect(data).assertEqual(factory.SecurityLevel.S3);

            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(async () => {
              console.info(TAG + '  Succeeded closeKVStore S3');
              await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S3_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S3');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0202 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S3 .code is ${err.code},message is ${err.message}`);
                done();
              });
            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S3 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err: Error) => {
            console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
            done();
          });

        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_DDM_SKV_ReturnValue_SL_0203
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvReturnValueTest_SL_0203
     * @tc.desc   getSecurityLevel(): Promise<SecurityLevel>---S4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_SKV_ReturnValue_SL_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        try {
          console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0203 begin---------  ');
          const optionsS4: factory.Options = {
            createIfMissing: true,
            encrypt: false,
            backup: false,
            autoSync: true,
            kvStoreType: factory.KVStoreType.SINGLE_VERSION,
            securityLevel: factory.SecurityLevel.S4,
          };
          const TEST_STORE_S4_ID = 'DataChangeStoreS4Id';

          let store: factory.SingleKVStore | null = null;
          let kvStoreS4: factory.SingleKVStore | null = null;
          await kvManager!.getKVStore(TEST_STORE_S4_ID, optionsS4).then((store: factory.SingleKVStore) => {
            kvStoreS4 = store;
            console.info('getKVStore success');
          }).catch((err: Error) => {
            console.error('getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          });
          kvStoreS4!.getSecurityLevel().then(async (data: factory.SecurityLevel | undefined) => {
            console.info(TAG + 'Succeeded getSecurityLevel S4, data.=' + JSON.stringify(data!));
            expect(data).assertEqual(factory.SecurityLevel.S4);
            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(async () => {
              console.info(TAG + '  Succeeded closeKVStore S4');
              await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_S4_ID).then(() => {
                console.info(TAG + '  Succeeded deleteKVStore S4');
                console.info(TAG + ' --------- SUB_DDM_SKV_ReturnValue_SL_0203 end--------- ');
                done();
              }).catch((err: Error) => {
                console.error(TAG + ` Failed deleteKVStore S4 .code is ${err.code},message is ${err.message}`);
                done();
              });
            }).catch((err: Error) => {
              console.error(TAG + ` Failed closeKVStore S4 .code is ${err.code},message is ${err.message}`);
              done();
            });
          }).catch((err: Error) => {
            console.error(`Failed to get SecurityLevel.code is ${err.code},message is ${err.message}`);
            done();
          });
        } catch (e) {
          console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
          expect(null).assertFail();
          done();
        }
      })


    console.info(TAG + '-------------------describe SingleKvStoreReturnValue  end-------------------');
  })

}