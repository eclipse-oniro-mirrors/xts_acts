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
} from "../../../hypium";
import factory from '@ohos.data.distributedKVStore';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';

let domain: int = 0x0000;
let tag: string = 'testTag';
const KEY_TEST_STRING_1 = 'key_test_string_1';
const KEY_TEST_STRING_2 = 'key_test_string_2';
const KEY_TEST_STRING_3 = 'key_test_string_3';
const KEY_TEST_STRING_4 = 'key_test_string_4';
const VALUE_TEST_STRING_1 = 'value_string_1';
const KEY_TEST_STRING_11 = 'key_test_string_11';
const VALUE_TEST_STRING_11 = 'value_string_11';
const VALUE_TEST_STRING_2 = 'value_string_2';

const TEST_BUNDLE_NAME = 'com.example.kvstoreetstest.static';

const TEST_STORE_ID = 'DataChangeStoreId';
let kvManager: factory.KVManager | null = null;
let kvStore: factory.SingleKVStore | null =null;
let kvStore2: factory.SingleKVStore | null = null;
let context: common.UIAbilityContext | undefined;
let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

function sleep(count: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0)
    }, count)
  })
}

const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]"
export default function SingleKvStoreDataChange() {
  describe('SingleKvStoreDataChange', () => {
    console.info(TAG + 'beforeAll end, kvManager=');
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
        hilog.info(domain, TAG, '%{public}s', '================ beforeAll start==========');
        await Utils.msSleep(2000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.kvstoreetstest.static")
        await Utils.msSleep(8000)
        context  = AppStorage.get<common.UIAbilityContext>("abilityContextMainAbility2") as common.UIAbilityContext;
        hilog.info(domain, TAG, '%{public}s', 'onAbilityCreate enddatabaseDir:' + context!.databaseDir);
      } catch (e) {
        hilog.info(domain, TAG, '%{public}s', "============beforeAll context e: " + e);
        hilog.info(domain, TAG, '%{public}s', '================ beforeAll context end==========');
      }
      const config: factory.KVManagerConfig = {
        bundleName: TEST_BUNDLE_NAME,
        context: context!
      };
      console.info(TAG + 'beforeAll context.databaseDir=' + context!.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
      done();
    });


    beforeEach(async (done: () => void) => {
      if (kvManager != null) {
        try {
          await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
            console.info(TAG + "Succeeded in getting KVStore");
            kvStore = store;
            console.info(TAG + 'beforeEach getKVStore success');
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get KVStore.code is ${err.code},message is ${err.message}`);
            done();
          });
          await kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
            console.info(TAG + "Succeeded in getting KVStore");
            kvStore2 = store;
            console.info(TAG + 'beforeEach getKVStore success');
            done();
          }).catch((err: Error) => {
            console.error(TAG + `Failed to get KVStore.code is ${err.code},message is ${err.message}`);
            done();
          });
        } catch (err) {
          console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        }
      }
    });

    afterEach(async (done: () => void) => {
      console.info(TAG + 'afterEach');
      if (kvManager != null) {
        await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
          console.info(TAG + ' afterEach Succeeded closeKVStore');
        }).catch((err: Error) => {
          console.error(TAG + `afterEach Failed closeKVStore.code is ${err.code},message is ${err.message}`);
        });

        await (kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
          console.info(TAG + ' afterEach Succeeded closeKVStore 2');
        }).catch((err: Error) => {
          console.error(TAG + `afterEach Failed closeKVStore 2 .code is ${err.code},message is ${err.message}`);
        });
        // await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        await (kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID) as Promise<void>).then(async () => {
          console.info(TAG + ' afterEach Succeeded deleteKVStore');
          kvStore = null;
          kvStore2 = null;
          done();
        }).catch((err: Error) => {
          console.error(TAG + `afterEach Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
          done();
        });
      }
    });

    afterAll(async (done: () => void): Promise<void> => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      kvStore2 = null;
      done();
    });

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0100
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvDataChangeEtsApiTest_0100
     * @tc.desc   对象1订阅5个不同回调, 对象2订阅3个不同回调, 对象1触发数据变更
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if ((kvStore != null) && (kvStore2 != null)) {
          try {
            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0100 begin---------  ');

            let status11 = 0;
            let status12 = 0;
            let status13 = 0;
            let status14 = 0;
            let status15 = 0;
            let status21 = 0;
            let status22 = 0;
            let status23 = 0;

            let func11 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange11' + JSON.stringify(data));
              status11 = 1;
            };
            let func12 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange12' + JSON.stringify(data));
              status12 = 1;
            };
            let func13 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange13' + JSON.stringify(data));
              status13 = 1;
            };
            let func14 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange14' + JSON.stringify(data));
              status14 = 1;
            };
            let func15 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange15' + JSON.stringify(data));
              status15 = 1;
            };

            let func21 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange21' + JSON.stringify(data));
              status21 = 1;
            };
            let func22 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange22' + JSON.stringify(data));
              status22 = 1;
            };
            let func23 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange23' + JSON.stringify(data));
              status23 = 1;
            };

            console.info(TAG + ' 1.1 ---------kvStore.on dataChange 5');
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

            console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 3');
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

            await sleep(500);

            console.info(TAG + ' 2. ---------kvStore.put1');
            await kvStore!.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
              expect(data == undefined).assertTrue();
              console.info(TAG + ' put1 success');
            }).catch((err: Error) => {
              console.error(TAG + ' put1 err ' + `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });

            await sleep(2000);

            expect(status11).assertEqual(1);
            expect(status12).assertEqual(1);
            expect(status13).assertEqual(1);
            expect(status14).assertEqual(1);
            expect(status15).assertEqual(1);
            expect(status21).assertEqual(1);
            expect(status22).assertEqual(1);
            expect(status23).assertEqual(1);

            console.info(TAG + ' 4. ---------off dataChange');
            kvStore!.offDataChange();
            kvStore2!.offDataChange();
            await sleep(2000);
            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0100 end--------- ');
            done();

          } catch (e) {
            console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }

      })
    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0200
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvDataChangeEtsApiTest_0200
     * @tc.desc   对象1订阅5个不同回调, 对象2订阅3个不同回调, 对象1取消订阅5个回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if ((kvStore != null) && (kvStore2 != null)) {
          try {
            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0200 begin---------  ');

            let status11 = 0;
            let status12 = 0;
            let status13 = 0;
            let status14 = 0;
            let status15 = 0;
            let status21 = 0;
            let status22 = 0;
            let status23 = 0;

            let func11 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange11' + JSON.stringify(data));
              status11 = 1;
            };
            let func12 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange12' + JSON.stringify(data));
              status12 = 1;
            };
            let func13 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange13' + JSON.stringify(data));
              status13 = 1;
            };
            let func14 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange14' + JSON.stringify(data));
              status14 = 1;
            };
            let func15 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange15' + JSON.stringify(data));
              status15 = 1;
            };

            let func21 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange21' + JSON.stringify(data));
              status21 = 1;
            };
            let func22 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange22' + JSON.stringify(data));
              status22 = 1;
            };
            let func23 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange23' + JSON.stringify(data));
              status23 = 1;
            };

            console.info(TAG + ' 1.1 ---------kvStore.on dataChange 5');
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

            console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 5');
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

            console.info(TAG + ' 2. ---------kvStore.off dataChange 5');
            kvStore!.offDataChange();
            await sleep(2000);

            console.info(TAG + ' 3. ---------kvStore.put1');
            await kvStore!.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
              expect(data == undefined).assertTrue();
              console.info(TAG + ' put1 success');
            }).catch((err: Error) => {
              console.error(TAG + ' put1 err ' + `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });

            await sleep(2000);

            console.info(TAG + '--------- status11=' + status11 + ' ' + status12 + ' ' + status13 + ' ' + status14 +
              ' ' + status15);
            console.info(TAG + '--------- status21=' + status21 + ' ' + status22 + ' ' + status23);
            expect(status11).assertEqual(0);
            expect(status12).assertEqual(0);
            expect(status13).assertEqual(0);
            expect(status14).assertEqual(0);
            expect(status15).assertEqual(0);
            expect(status21).assertEqual(1);
            expect(status22).assertEqual(1);
            expect(status23).assertEqual(1);

            console.info(TAG + ' 4. ---------off dataChange');
            kvStore2!.offDataChange();
            await sleep(2000);
            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0200 end--------- ');
            done();

          } catch (e) {
            console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0300
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvDataChangeEtsApiTest_0300
     * @tc.desc   对象1订阅5个不同回调, 对象2订阅3个不同回调, closeKVStore 1次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if ((kvStore != null) && (kvStore2 != null) && (kvManager != null)) {
          try {
            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0300 begin---------  ');

            let status11 = 0;
            let status12 = 0;
            let status13 = 0;
            let status14 = 0;
            let status15 = 0;
            let status21 = 0;
            let status22 = 0;
            let status23 = 0;

            let func11 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange11' + JSON.stringify(data));
              status11 = 1;
            };
            let func12 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange12' + JSON.stringify(data));
              status12 = 1;
            };
            let func13 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange13' + JSON.stringify(data));
              status13 = 1;
            };
            let func14 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange14' + JSON.stringify(data));
              status14 = 1;
            };
            let func15 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange15' + JSON.stringify(data));
              status15 = 1;
            };

            let func21 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange21' + JSON.stringify(data));
              status21 = 1;
            };
            let func22 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange22' + JSON.stringify(data));
              status22 = 1;
            };
            let func23 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange23' + JSON.stringify(data));
              status23 = 1;
            };

            console.info(TAG + ' 1.1 ---------kvStore.on dataChange 5');
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

            console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 5');
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

            console.info(TAG + ' 2. ---------closeKVStore 1次');
            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

            await sleep(1000);

            console.info(TAG + ' 3. ---------kvStore.put1');
            await kvStore!.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
              expect(data == undefined).assertTrue();
              console.info(TAG + ' 3.put1 success');
            }).catch((err: Error) => {
              console.error(TAG + ' 3.put1 err ' + `, error code is ${err.code}, message is ${err.message}`);
              expect(null).assertFail();
              done();
            });

            await sleep(2000);

            expect(status11).assertEqual(1);
            expect(status12).assertEqual(1);
            expect(status13).assertEqual(1);
            expect(status14).assertEqual(1);
            expect(status15).assertEqual(1);
            expect(status21).assertEqual(1);
            expect(status22).assertEqual(1);
            expect(status23).assertEqual(1);

            console.info(TAG + ' 4. ---------off dataChange');
            kvStore!.offDataChange();
            kvStore2!.offDataChange();
            await sleep(2000);

            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0300 end--------- ');
            done();

          } catch (e) {
            console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0400
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvDataChangeEtsApiTest_0400
     * @tc.desc   对象1订阅5个不同回调, 对象2订阅3个不同回调, closeKVStore 2次
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        if ((kvStore != null) && (kvStore2 != null) && (kvManager != null)) {
          try {
            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0400 begin---------  ');

            let status11 = 0;
            let status12 = 0;
            let status13 = 0;
            let status14 = 0;
            let status15 = 0;
            let status21 = 0;
            let status22 = 0;
            let status23 = 0;

            let func11 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange11' + JSON.stringify(data));
              status11 = 1;
            };
            let func12 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange12' + JSON.stringify(data));
              status12 = 1;
            };
            let func13 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange13' + JSON.stringify(data));
              status13 = 1;
            };
            let func14 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange14' + JSON.stringify(data));
              status14 = 1;
            };
            let func15 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange15' + JSON.stringify(data));
              status15 = 1;
            };

            let func21 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange21' + JSON.stringify(data));
              status21 = 1;
            };
            let func22 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange22' + JSON.stringify(data));
              status22 = 1;
            };
            let func23 = (data: factory.ChangeNotification) => {
              console.info(TAG + ' dataChange23' + JSON.stringify(data));
              status23 = 1;
            };

            console.info(TAG + ' 1.1 ---------kvStore.on dataChange 5');
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
            kvStore!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

            console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 5');
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
            kvStore2!.onDataChange(factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

            console.info(TAG + ' 2. ---------closeKVStore 2次');
            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
            await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

            await sleep(2000);

            console.info(TAG + ' 3. ---------kvStore.put1');
            kvStore!.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
              console.info(TAG + ' 3.put1 success');
              expect(null).assertFail();
            }).catch((err:Error) => {
              console.error(TAG + ' 3.put1 err ' + `, error code is ${err.code}, message is ${err.message}`);
            });
            await sleep(2000);

            expect(status11).assertEqual(0);
            expect(status12).assertEqual(0);
            expect(status13).assertEqual(0);
            expect(status14).assertEqual(0);
            expect(status15).assertEqual(0);
            expect(status21).assertEqual(0);
            expect(status22).assertEqual(0);
            expect(status23).assertEqual(0);

            console.info(TAG + ' 4. ---------off dataChange');
            kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
              console.info(TAG + "Succeeded in getting KVStore");
              kvStore!.offDataChange();
              console.info(TAG + 'beforeEach getKVStore success');
            }).catch((err: Error) => {
              console.error(TAG + `Failed to get KVStore.code is ${err.code},message is ${err.message}`);
              done();
            });
            kvManager!.getKVStore<factory.SingleKVStore>(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
              console.info(TAG + "Succeeded in getting KVStore");
              kvStore2!.offDataChange();
              console.info(TAG + 'beforeEach getKVStore success');
            }).catch((err: Error) => {
              console.error(TAG + `Failed to get KVStore.code is ${err.code},message is ${err.message}`);
              done();
            });
            console.info(TAG + ' --------- SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0400 end--------- ');
            done();
          } catch (e) {
            console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
            expect(null).assertFail();
            done();
          }
        }
      })
  })
}

