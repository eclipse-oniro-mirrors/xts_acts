/*
* Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import factory from '@ohos.data.distributedKVStore';

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
const context = delegator.getAppContext().getApplicationContext();


const KEY_TEST_STRING_1 = 'key_test_string_1';
const VALUE_TEST_STRING_1 = 'value_string_1';
const KEY_TEST_STRING_11 = 'key_test_string_11';
const VALUE_TEST_STRING_11 = 'value_string_11';
const KEY_TEST_STRING_2 = 'key_test_string_2';
const VALUE_TEST_STRING_2 = 'value_string_2';

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore'; //'ohos.acts.kv2';
const TEST_STORE_ID = 'DataChangeStoreId';
let kvManager: factory.KVManager|null ;
let kvStore : factory.SingleKVStore|null;
let kvStore2 : factory.SingleKVStore|null;

function sleep(ms:number) {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]"

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};


export default function SingleKvStoreDataChange(){
  describe('SingleKvStoreDataChange', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.SINGLE_VERSION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done:Function) => {
      console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);
      done();
    });


    beforeEach(async (done:Function) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));

      if (kvManager != null) {
        await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
          kvStore = store;
          console.info(TAG + 'beforeEach getKVStore success');
        }).catch((err: BusinessError) => {
          console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        });

        await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
          kvStore2 = store;
          console.info(TAG + 'beforeEach getKVStore 222 success');
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + 'beforeEach getKVStore 222 err ' + `, error code is ${err.code}, message is ${err.message}`);
          done();
        });
      }

    });
    afterEach(async (done:Function) =>  {
      console.info(TAG + 'afterEach');
      if (kvManager != null) {
        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info(TAG + ' afterEach Succeeded closeKVStore');
        }).catch((err: BusinessError) => {
          console.error(TAG + `afterEach Failed closeKVStore.code is ${err.code},message is ${err.message}`);
        });

        await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info(TAG + ' afterEach Succeeded closeKVStore 2');
        }).catch((err: BusinessError) => {
          console.error(TAG + `afterEach Failed closeKVStore 2 .code is ${err.code},message is ${err.message}`);
        });

        await kvManager.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info(TAG + ' afterEach Succeeded deleteKVStore');
          kvStore = null;
          kvStore2 = null;
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `afterEach Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
          done();
        });
      }

    });

    afterAll(async (done:Function) => {
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
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if ((kvStore!=null ) && (kvStore2!=null )) {
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
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

          console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 3');
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

          await sleep(500);

          console.info(TAG + ' 2. ---------kvStore.put1');
          await kvStore.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
            expect(data == undefined).assertTrue();
            console.info(TAG + ' put1 success');
          }).catch((err: BusinessError) => {
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
          kvStore.off('dataChange');
          kvStore2.off('dataChange');
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
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if ((kvStore!=null ) && (kvStore2!=null )) {
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
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

          console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 5');
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

          console.info(TAG + ' 2. ---------kvStore.off dataChange 5');
          kvStore.off('dataChange');
          await sleep(2000);

          console.info(TAG + ' 3. ---------kvStore.put1');
          await kvStore.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
            expect(data == undefined).assertTrue();
            console.info(TAG + ' put1 success');
          }).catch((err: BusinessError) => {
            console.error(TAG + ' put1 err ' + `, error code is ${err.code}, message is ${err.message}`);
            expect(null).assertFail();
            done();
          });

          await sleep(2000);

          console.info(TAG + '--------- status11=' + status11 + ' ' + status12 + ' ' + status13 + ' ' + status14 + ' ' +
            status15);
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
          kvStore2.off('dataChange');
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
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if ((kvStore!=null) && (kvStore2!=null) && (kvManager!=null )) {
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
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

          console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 5');
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

          console.info(TAG + ' 2. ---------closeKVStore 1次');
          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

          await sleep(1000);

          console.info(TAG + ' 3. ---------kvStore.put1');
          await kvStore.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
            expect(data == undefined).assertTrue();
            console.info(TAG + ' 3.put1 success');
          }).catch((err: BusinessError) => {
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
          kvStore.off('dataChange');
          kvStore2.off('dataChange');
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
    it('SUB_DDM_DKV_SINGLEKVSTORE_DATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      if ((kvStore!=null ) && (kvStore2!=null ) && (kvManager!=null ) ) {
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
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func11);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func12);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func13);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func14);
          kvStore.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func15);

          console.info(TAG + ' 1.2 ---------kvStore2.on dataChange 5');
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func21);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func22);
          kvStore2.on('dataChange', factory.SubscribeType.SUBSCRIBE_TYPE_LOCAL, func23);

          console.info(TAG + ' 2. ---------closeKVStore 2次');
          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
          await kvManager.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);

          await sleep(2000);

          console.info(TAG + ' 3. ---------kvStore.put1');
          await kvStore.put(KEY_TEST_STRING_1, VALUE_TEST_STRING_1).then((data) => {
            console.info(TAG + ' 3.put1 success');
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
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
          kvStore = await kvManager.getKVStore(TEST_STORE_ID, options);
          kvStore2 = await kvManager.getKVStore(TEST_STORE_ID, options);

          if ((kvStore!=null ) && (kvStore2!=null ) ) {
            kvStore.off('dataChange');
            kvStore2.off('dataChange');
            await sleep(2000);
          }

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