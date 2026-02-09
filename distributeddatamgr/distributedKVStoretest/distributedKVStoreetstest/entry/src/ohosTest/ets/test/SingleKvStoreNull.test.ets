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

const TEST_BUNDLE_NAME = 'ohos.acts.distributedKvStore';
const TEST_STORE_ID = 'SingleKvStoreNull';
let kvManager: factory.KVManager|null ;
let kvStore : factory.SingleKVStore|null;
let entries: factory.Entry[] = [];

function sleep(ms:number) {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

const TAG = "[testtag >>>>>> ]"

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};

const USED_DEVICE_IDS =  ['A12C1F9261528B21F95778D2FDC0B2E33943E6251AC5487F4473D005758905DB'];
const UNUSED_DEVICE_IDS =  [];  /* add you test device-ids here */
let syncDeviceIds:string[] = USED_DEVICE_IDS.concat(UNUSED_DEVICE_IDS);


export default function SingleKvStoreNull(){
  describe('SingleKvStoreNull', () => {
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
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.SingleKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
        done();
      });

    });
    afterEach(async (done:Function) =>  {
      console.info(TAG + 'afterEach');
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(async () => {
        console.info('afterEach closeKVStore success');
        await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
          console.info('afterEach deleteKVStore success');
          kvStore = null;
          done();
        }).catch((err: BusinessError) => {
          console.info('afterEach deleteKVStore err ' + err);
          done();
        });
      }).catch((err: BusinessError) => {
        console.info('afterEach closeKVStore err ' + err);
        done();
      });


    });

    afterAll(async (done:Function) => {
      console.info(TAG + 'afterAll');
      kvManager = null;
      kvStore = null;
      done();
    });

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0101
     * @tc.name SUB_DDM_SKV_Null_Put_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0101 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        kvStore!.put('', TEST_VALUE, (err: BusinessError) => {
          console.info(TAG + "put 1, err=" + err.code + err.message);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0102
     * @tc.name SUB_DDM_SKV_Null_Put_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，key = null //""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0102 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        kvStore!.put(null, TEST_VALUE, (err: BusinessError) => {
          console.error(TAG + "put 1, err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0103
     * @tc.name SUB_DDM_SKV_Null_Put_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，key = null //""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0103 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        kvStore!.put(undefined, TEST_VALUE, (err: BusinessError) => {
          console.error(TAG + "put 1, err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0201
     * @tc.name SUB_DDM_SKV_Null_Put_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，value = "" //""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0201 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        kvStore!.put(TEST_KEY, "", (err: BusinessError) => {
          console.info(TAG + "put 1, err=" + err);
          expect(err).assertEqual(undefined);
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0202
     * @tc.name SUB_DDM_SKV_Null_Put_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，value = null //""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0202 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        kvStore!.put(TEST_KEY, null, (err: BusinessError) => {
          console.info(TAG + "put , err=" + err);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e , put' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0203
     * @tc.name SUB_DDM_SKV_Null_Put_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，value = undefined //""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0203 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        kvStore!.put(TEST_KEY, undefined, (err: BusinessError) => {
          console.info(TAG + "put , err=" + err);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e , put' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_0204
     * @tc.name SUB_DDM_SKV_Null_Put_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc put(key: string, value: Uint8Array | string | number | boolean, callback: AsyncCallback): void;
     * put callback，value = number
     */
    it('SUB_DDM_SKV_Null_Put_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_0204 begin---------  ');
      const TEST_KEY = 'Key_string';
      let value:number = 123
      try {
        kvStore!.put(TEST_KEY, value, (err: BusinessError) => {
          console.info(TAG + "put , err=" + err);
          expect(err).assertEqual(undefined);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e , put' + `, error code is ${e.code}, message is ${e.message}`);

        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>
     *put Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0101 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        await kvStore!.put('', TEST_VALUE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>
     *put Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0102 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        await kvStore!.put(null, TEST_VALUE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>
     *put Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0103 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        await kvStore!.put(undefined, TEST_VALUE);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0201
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>
     *put Promise，key = ""/null/undefined/number
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0201 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        await kvStore!.put(TEST_KEY, "");
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0202
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>
     *put Promise，key = ""/null/undefined/number
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0202 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        await kvStore!.put(TEST_KEY, null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0203
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>
     *put Promise，key = ""/null/undefined/number
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0203 begin---------  ');
      const TEST_KEY = 'Key_string';
      try {
        await kvStore!.put(TEST_KEY, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Put_Promise_0204
     * @tc.name SUB_DDM_SKV_Null_Put_Promise_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>
     *put Promise，key = ""/null/undefined/number
     */
    it('SUB_DDM_SKV_Null_Put_Promise_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Put_Promise_0204 begin---------  ');
      const TEST_KEY = 'Key_string';
      let value:number = 123
      try {
        await kvStore!.put(TEST_KEY, value);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_putBatch_0101
     * @tc.name SUB_DDM_SKV_Null_putBatch_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[], callback: AsyncCallback): void;
     * putBatch callback，entries = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_putBatch_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_putBatch_0101 begin---------  ');
      try {
        kvStore!.putBatch(null, (err: BusinessError) => {
          console.error(TAG + "put 1, err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_putBatch_0102
     * @tc.name SUB_DDM_SKV_Null_putBatch_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[], callback: AsyncCallback): void;
     * putBatch callback，entries = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_putBatch_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_putBatch_0102 begin---------  ');
      try {
        kvStore!.putBatch(undefined, (err: BusinessError) => {
          console.error(TAG + "put 1, err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_putBatch_0103
     * @tc.name SUB_DDM_SKV_Null_putBatch_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[], callback: AsyncCallback): void;
     * putBatch callback，entries = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_putBatch_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_putBatch_0103 begin---------  ');
      try {
        kvStore!.putBatch([], (err: BusinessError) => {
          console.error(TAG + "put 1, err=");
          expect(err).assertEqual(undefined);
          done();
        });
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_PutBatch_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_PutBatch_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[]): Promise;
     * putBatch Promise，entries = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_PutBatch_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_PutBatch_Promise_0101 begin---------  ');
      const TEST_VALUE = 'value_string';
      try {
        await kvStore!.putBatch(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_PutBatch_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_PutBatch_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[]): Promise;
     * putBatch Promise，entries = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_PutBatch_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_PutBatch_Promise_0102 begin---------  ');
      try {
        await kvStore!.putBatch(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_PutBatch_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_PutBatch_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc putBatch(entries: Entry[]): Promise;
     * putBatch Promise，entries = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_PutBatch_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_PutBatch_Promise_0103 begin---------  ');
      try {
        await kvStore!.putBatch([]);
        console.info(TAG + ' putBatch ');
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_0101
     * @tc.name SUB_DDM_SKV_Null_Delete_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string, callback: AsyncCallback): void;
     * delete callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Delete_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_0101 begin---------  ');
      try {
        kvStore!.delete('', (err: BusinessError) => {
          console.error(TAG + "delete err=" + err.code + err.message);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_0102
     * @tc.name SUB_DDM_SKV_Null_Delete_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string, callback: AsyncCallback): void;
     * delete callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Delete_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_0102 begin---------  ');
      try {
        kvStore!.delete(null, (err: BusinessError) => {
          console.error(TAG + "delete err=" + err.code + err.message);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_0103
     * @tc.name SUB_DDM_SKV_Null_Delete_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string, callback: AsyncCallback): void;
     * delete callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Delete_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_0103 begin---------  ');
      try {
        kvStore!.delete(undefined, (err: BusinessError) => {
          console.error(TAG + "delete err=" + err.code + err.message);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_Delete_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string): Promise;
     * delete Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Delete_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_Promise_0101 begin---------  ');
      try {
        await kvStore!.delete('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_Delete_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string): Promise;
     * delete Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Delete_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_Promise_0102 begin---------  ');
      try {
        await kvStore!.delete(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Delete_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_Delete_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc delete(key: string): Promise;
     * delete Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Delete_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Delete_Promise_0103 begin---------  ');
      try {
        await kvStore!.delete(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_0101
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[], callback: AsyncCallback): void;
     * deleteBatch callback，keys = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_0101 begin---------  ');
      try {
        kvStore!.deleteBatch(null, (err: BusinessError) => {
          console.error(TAG + "deleteBatch err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_0102
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[], callback: AsyncCallback): void;
     * deleteBatch callback，keys = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_0102 begin---------  ');
      try {
        kvStore!.deleteBatch(undefined, (err: BusinessError) => {
          console.error(TAG + "deleteBatch err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_0103
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[], callback: AsyncCallback): void;
     * deleteBatch callback，keys = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_0103 begin---------  ');
      try {
        kvStore!.deleteBatch([], (err: BusinessError) => {
          console.error(TAG + "deleteBatch err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[]): Promise;
     * deleteBatch Promise，keys = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_Promise_0101 begin---------  ');
      try {
        await kvStore!.deleteBatch(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[]): Promise;
     * deleteBatch Promise，keys = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_Promise_0102 begin---------  ');
      try {
        await kvStore!.deleteBatch(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_DeleteBatch_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_DeleteBatch_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBatch(keys: string[]): Promise;
     * deleteBatch Promise，keys = null/undefined/[]
     */
    it('SUB_DDM_SKV_Null_DeleteBatch_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_DeleteBatch_Promise_0103 begin---------  ');
      try {
        await kvStore!.deleteBatch([]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_0101
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string, callback: AsyncCallback): void;
     * removeDeviceData callback，deviceId = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_0101 begin---------  ');
      try {
        kvStore!.removeDeviceData('', (err: BusinessError) => {
          console.error(TAG + "delete err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_0102
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string, callback: AsyncCallback): void;
     * removeDeviceData callback，deviceId = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_0102 begin---------  ');
      try {
        kvStore!.removeDeviceData(null, (err: BusinessError) => {
          console.error(TAG + "delete err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_0103
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string, callback: AsyncCallback): void;
     * removeDeviceData callback，deviceId = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_0103 begin---------  ');
      try {
        kvStore!.removeDeviceData(undefined, (err: BusinessError) => {
          console.error(TAG + "delete err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string): Promise;
     * removeDeviceData Promise，deviceId = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_Promise_0101 begin---------  ');
      try {
        await kvStore!.removeDeviceData('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string): Promise;
     * removeDeviceData Promise，deviceId = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_Promise_0102 begin---------  ');
      try {
        await kvStore!.removeDeviceData(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_removeDeviceData_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_removeDeviceData_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc removeDeviceData(deviceId: string): Promise;
     * removeDeviceData Promise，deviceId = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_removeDeviceData_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_removeDeviceData_Promise_0103 begin---------  ');
      try {
        await kvStore!.removeDeviceData(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Get_0101
     * @tc.name SUB_DDM_SKV_Null_Get_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * get callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Get_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Get_0101 begin---------  ');
      try {
        kvStore!.get('', (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Get_0102
     * @tc.name SUB_DDM_SKV_Null_Get_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * get callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Get_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Get_0102 begin---------  ');
      try {
        kvStore!.get(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Get_0103
     * @tc.name SUB_DDM_SKV_Null_Get_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * get callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Get_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Get_0103 begin---------  ');
      try {
        kvStore!.get(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Get_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_Get_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>;
     * get Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Get_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Get_Promise_0101 begin---------  ');
      try {
        await kvStore!.get('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Get_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_Get_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>;
     * get Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Get_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Get_Promise_0102 begin---------  ');
      try {
        await kvStore!.get(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Get_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_Get_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc get(key: string): Promise<boolean | string | number | Uint8Array>;
     * get Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_Get_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Get_Promise_0103 begin---------  ');
      try {
        await kvStore!.get(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntries_0101
     * @tc.name SUB_DDM_SKV_Null_GetEntries_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(keyPrefix: string, callback: AsyncCallback<Entry[]>): void;
     * getEntries  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntries_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntries_0101 begin---------  ');
      try {
        kvStore!.getEntries('', (err: BusinessError, entries: factory.Entry[]) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntries_0102
     * @tc.name SUB_DDM_SKV_Null_GetEntries_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * getEntries  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntries_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntries_0102 begin---------  ');
      try {
        kvStore!.getEntries(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntries_0103
     * @tc.name SUB_DDM_SKV_Null_GetEntries_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(key: string, callback: AsyncCallback<boolean | string | number | Uint8Array>): void;
     * getEntries  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntries_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntries_0103 begin---------  ');
      try {
        kvStore!.getEntries(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntries_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_GetEntries_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(key: string): Promise<boolean | string | number | Uint8Array>;
     * getEntries  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntries_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntries_Promise_0101 begin---------  ');
      try {
        await kvStore!.getEntries('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntries_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_GetEntries_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(key: string): Promise<boolean | string | number | Uint8Array>;
     * getEntries  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntries_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntries_Promise_0102 begin---------  ');
      try {
        await kvStore!.getEntries(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntries_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_GetEntries_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(key: string): Promise<boolean | string | number | Uint8Array>;
     * getEntries  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntries_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntries_Promise_0103 begin---------  ');
      try {
        await kvStore!.getEntries(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntriesQuery_0101
     * @tc.name SUB_DDM_SKV_Null_GetEntriesQuery_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query, callback: AsyncCallback<Entry[]>): void;
     * getEntries  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntriesQuery_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntriesQuery_0101 begin---------  ');
      try {
        kvStore!.getEntries('', (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntriesQuery_0102
     * @tc.name SUB_DDM_SKV_Null_GetEntriesQuery_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query, callback: AsyncCallback<Entry[]>): void;
     * getEntries  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntriesQuery_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntriesQuery_0102 begin---------  ');
      try {
        kvStore!.getEntries(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntriesQuery_0103
     * @tc.name SUB_DDM_SKV_Null_GetEntriesQuery_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query, callback: AsyncCallback<Entry[]>): void;
     * getEntries  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntriesQuery_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntriesQuery_0103 begin---------  ');
      try {
        kvStore!.getEntries(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntriesQuery_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query): Promise<Entry[]>;
     * getEntries  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0101 begin---------  ');
      try {
        await kvStore!.getEntries('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntriesQuery_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query): Promise<Entry[]>;
     * getEntries  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0102 begin---------  ');
      try {
        await kvStore!.getEntries(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_GetEntriesQuery_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getEntries(query: Query): Promise<Entry[]>;
     * getEntries  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_GetEntriesQuery_Promise_0103 begin---------  ');
      try {
        await kvStore!.getEntries(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSet_0101
     * @tc.name SUB_DDM_SKV_Null_getResultSet_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(keyPrefix: string, callback: AsyncCallback): void;
     * getResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSet_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSet_0101 begin---------  ');
      try {
        kvStore!.getResultSet('', (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSet_0102
     * @tc.name SUB_DDM_SKV_Null_getResultSet_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(keyPrefix: string, callback: AsyncCallback): void;
     * getResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSet_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSet_0102 begin---------  ');
      try {
        kvStore!.getResultSet(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSet_0103
     * @tc.name SUB_DDM_SKV_Null_getResultSet_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(keyPrefix: string, callback: AsyncCallback): void;
     * getResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSet_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSet_0103 begin---------  ');
      try {
        kvStore!.getResultSet(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSet_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_getResultSet_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(keyPrefix: string): Promise;
     * getResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSet_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSet_Promise_0101 begin---------  ');
      try {
        await kvStore!.getResultSet('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSet_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_getResultSet_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(keyPrefix: string): Promise;
     * getResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSet_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSet_Promise_0102 begin---------  ');
      try {
        await kvStore!.getResultSet(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSet_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_getResultSet_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(keyPrefix: string): Promise;
     * getResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSet_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSet_Promise_0103 begin---------  ');
      try {
        await kvStore!.getResultSet(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSetQuery_0101
     * @tc.name SUB_DDM_SKV_Null_getResultSetQuery_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query, callback: AsyncCallback): void;
     * getResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSetQuery_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSetQuery_0101 begin---------  ');
      try {
        kvStore!.getResultSet('', (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSetQuery_0102
     * @tc.name SUB_DDM_SKV_Null_getResultSetQuery_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query, callback: AsyncCallback): void;
     * getResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSetQuery_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSetQuery_0102 begin---------  ');
      try {
        kvStore!.getResultSet(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSetQuery_0103
     * @tc.name SUB_DDM_SKV_Null_getResultSetQuery_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query, callback: AsyncCallback): void;
     * getResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSetQuery_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSetQuery_0103 begin---------  ');
      try {
        kvStore!.getResultSet(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSetQuery_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_getResultSetQuery_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query): Promise;
     * getResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSetQuery_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSetQuery_Promise_0101 begin---------  ');
      try {
        await kvStore!.getResultSet('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSetQuery_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_getResultSetQuery_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query): Promise;
     * getResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSetQuery_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSetQuery_Promise_0102 begin---------  ');
      try {
        await kvStore!.getResultSet(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSetQuery_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_getResultSetQuery_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSet(query: Query): Promise;
     * getResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSetQuery_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSetQuery_Promise_0103 begin---------  ');
      try {
        await kvStore!.getResultSet(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_closeResultSet_0102
     * @tc.name SUB_DDM_SKV_Null_closeResultSet_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc closeResultSet(resultSet: KVStoreResultSet, callback: AsyncCallback): void;
     * closeResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_closeResultSet_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_closeResultSet_0102 begin---------  ');
      try {
        kvStore!.closeResultSet(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_closeResultSet_0103
     * @tc.name SUB_DDM_SKV_Null_closeResultSet_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc closeResultSet(resultSet: KVStoreResultSet, callback: AsyncCallback): void;
     * closeResultSet  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_closeResultSet_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_closeResultSet_0103 begin---------  ');
      try {
        kvStore!.closeResultSet(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_closeResultSet_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_closeResultSet_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc closeResultSet(resultSet: KVStoreResultSet): Promise;
     * closeResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_closeResultSet_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_closeResultSet_Promise_0102 begin---------  ');
      try {
        await kvStore!.closeResultSet(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_closeResultSet_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_closeResultSet_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc closeResultSet(resultSet: KVStoreResultSet): Promise;
     * closeResultSet  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_closeResultSet_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_closeResultSet_Promise_0103 begin---------  ');
      try {
        await kvStore!.closeResultSet(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSize_0102
     * @tc.name SUB_DDM_SKV_Null_getResultSize_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(query: Query, callback: AsyncCallback): void;
     * getResultSize  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSize_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSize_0102 begin---------  ');
      try {
        kvStore!.getResultSize(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSize_0103
     * @tc.name SUB_DDM_SKV_Null_getResultSize_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(query: Query, callback: AsyncCallback): void;
     * getResultSize  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSize_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSize_0103 begin---------  ');
      try {
        kvStore!.getResultSize(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSize_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_getResultSize_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(query: Query): Promise;
     * getResultSize  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSize_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSize_Promise_0102 begin---------  ');
      try {
        await kvStore!.getResultSize(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_getResultSize_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_getResultSize_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc getResultSize(query: Query): Promise;
     * getResultSize  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_getResultSize_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_getResultSize_Promise_0103 begin---------  ');
      try {
        await kvStore!.getResultSize(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_backup_0101
     * @tc.name SUB_DDM_SKV_Null_backup_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc backup(file: string, callback: AsyncCallback): void;
     * backup  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_backup_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_backup_0101 begin---------  ');
      try {
        kvStore!.backup('', (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_backup_0102
     * @tc.name SUB_DDM_SKV_Null_backup_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc backup(file: string, callback: AsyncCallback): void;
     * backup  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_backup_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_backup_0102 begin---------  ');
      try {
        kvStore!.backup(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_backup_0103
     * @tc.name SUB_DDM_SKV_Null_backup_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc backup(file: string, callback: AsyncCallback): void;
     * backup  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_backup_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_backup_0103 begin---------  ');
      try {
        kvStore!.backup(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_backup_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_backup_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc backup(file: string): Promise;
     * backup  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_backup_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_backup_Promise_0101 begin---------  ');
      try {
        await kvStore!.backup('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_backup_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_backup_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc backup(file: string): Promise;
     * backup  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_backup_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_backup_Promise_0102 begin---------  ');
      try {
        await kvStore!.backup(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_backup_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_backup_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc backup(file: string): Promise;
     * backup  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_backup_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_backup_Promise_0103 begin---------  ');
      try {
        await kvStore!.backup(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_restore_0101
     * @tc.name SUB_DDM_SKV_Null_restore_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc restore(file: string, callback: AsyncCallback): void;
     * restore  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_restore_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_restore_0101 begin---------  ');
      try {
        kvStore!.restore('', (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_restore_0102
     * @tc.name SUB_DDM_SKV_Null_restore_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc restore(file: string, callback: AsyncCallback): void;
     * restore  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_restore_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_restore_0102 begin---------  ');
      try {
        kvStore!.restore(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_restore_0103
     * @tc.name SUB_DDM_SKV_Null_restore_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc restore(file: string, callback: AsyncCallback): void;
     * restore  callback，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_restore_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_restore_0103 begin---------  ');
      try {
        kvStore!.restore(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_restore_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_restore_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc restore(file: string): Promise;
     * restore  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_restore_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_restore_Promise_0101 begin---------  ');
      try {
        await kvStore!.restore('');
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_restore_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_restore_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc restore(file: string): Promise;
     * restore  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_restore_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_restore_Promise_0102 begin---------  ');
      try {
        await kvStore!.restore(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_restore_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_restore_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc restore(file: string): Promise;
     * restore  Promise，key = ""/null/undefined
     */
    it('SUB_DDM_SKV_Null_restore_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_restore_Promise_0103 begin---------  ');
      try {
        await kvStore!.restore(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_0101
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array, callback: AsyncCallback<Array<[string,number]>>): void;
     * deleteBackup  callback，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_0101 begin---------  ');
      try {
        kvStore!.deleteBackup(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_0102
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array, callback: AsyncCallback<Array<[string,number]>>): void;
     * deleteBackup  callback，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_0102 begin---------  ');
      try {
        kvStore!.deleteBackup(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_0103
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array, callback: AsyncCallback<Array<[string,number]>>): void;
     * deleteBackup  callback，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_0103 begin---------  ');
      try {
        kvStore!.deleteBackup([], (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_0104
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_0104
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array, callback: AsyncCallback<Array<[string,number]>>): void;
     * deleteBackup  callback，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_0104 begin---------  ');
      try {
        kvStore!.deleteBackup(["BK001", "BK002"], (err: BusinessError, data: [string, number][]) => {
          console.error(TAG + "get err=" + err + "  data.length=" + data.length);
          expect(err).assertEqual(undefined);
          expect(data.length).assertEqual(2);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array): Promise<Array<[string,number]>>;
     * deleteBackup  Promise，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_Promise_0101 begin---------  ');
      try {
        await kvStore!.deleteBackup(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array): Promise<Array<[string,number]>>;
     * deleteBackup  Promise，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_Promise_0102 begin---------  ');
      try {
        await kvStore!.deleteBackup(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array): Promise<Array<[string,number]>>;
     * deleteBackup  Promise，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_Promise_0103 begin---------  ');
      try {
        await kvStore!.deleteBackup([]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_deleteBackup_Promise_0104
     * @tc.name SUB_DDM_SKV_Null_deleteBackup_Promise_0104
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deleteBackup(files: Array): Promise<Array<[string,number]>>;
     * deleteBackup  Promise，key = null/undefined/[]/["BK001", "BK002"]
     */
    it('SUB_DDM_SKV_Null_deleteBackup_Promise_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_deleteBackup_Promise_0104 begin---------  ');
      try {
        let data = await kvStore!.deleteBackup(["BK001", "BK002"]);
        expect(data.length).assertEqual(2);
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_enableSync_0101
     * @tc.name SUB_DDM_SKV_Null_enableSync_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc enableSync(enabled: boolean): Promise;
     * enableSync  Promise，key = true/false
     */
    it('SUB_DDM_SKV_Null_enableSync_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_enableSync_0101 begin---------  ');
      try {
        kvStore!.enableSync(true, (err: BusinessError) => {
          console.error(TAG + "get err=" + err);
          expect(err).assertEqual(undefined);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_enableSync_0102
     * @tc.name SUB_DDM_SKV_Null_enableSync_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc enableSync(enabled: boolean): Promise;
     * enableSync  Promise，key = true/false
     */
    it('SUB_DDM_SKV_Null_enableSync_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_enableSync_0102 begin---------  ');
      try {
        kvStore!.enableSync(false, (err: BusinessError) => {
          console.error(TAG + "get err=" + err);
          expect(err).assertEqual(undefined);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_enableSync_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_enableSync_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc enableSync(enabled: boolean): Promise;
     * enableSync  Promise，key = true/false
     */
    it('SUB_DDM_SKV_Null_enableSync_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_enableSync_Promise_0101 begin---------  ');
      try {
        await kvStore!.enableSync(true);
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_enableSync_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_enableSync_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc enableSync(enabled: boolean): Promise;
     * enableSync  Promise，key = true/false
     */
    it('SUB_DDM_SKV_Null_enableSync_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_enableSync_Promise_0102 begin---------  ');
      try {
        await kvStore!.enableSync(false);
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0101
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0101 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange(null, remoteSupportLabels, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0102
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0102 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange(undefined, remoteSupportLabels, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0103
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0103 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange([], remoteSupportLabels, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0104
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0104
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0104 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange(localLabels, remoteSupportLabels, (err: BusinessError) => {
          console.info(TAG + "get err=" + err);
          expect(err).assertEqual(undefined);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0201
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0201 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange(localLabels, null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0202
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0202 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange(localLabels, undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0203
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0203 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange(localLabels, [], (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_0204
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[], callback: AsyncCallback): void;
     * setSyncRange  callback，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_0204 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        kvStore!.setSyncRange(localLabels, remoteSupportLabels, (err: BusinessError) => {
          console.info(TAG + "get err=" + err);
          expect(err).assertEqual(undefined);
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0101 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange(null, remoteSupportLabels);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0102 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange(undefined, remoteSupportLabels);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0103
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0103 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange([], remoteSupportLabels);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0104
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0104
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0104 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange(localLabels, remoteSupportLabels);
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0201
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0201 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange(localLabels, null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0202
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0202 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange(localLabels, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0203
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0203 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange(localLabels, []);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncRange_Promise_0204
     * @tc.name SUB_DDM_SKV_Null_setSyncRange_Promise_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncRange(localLabels: string[], remoteSupportLabels: string[]): Promise;
     * setSyncRange  Promise，，localLabels = null/undefined/[]/['A', 'B']
    remoteSupportLabels = null/undefined/[]/['A', 'B']
     */
    it('SUB_DDM_SKV_Null_setSyncRange_Promise_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncRange_Promise_0204 begin---------  ');
      const localLabels = ['A', 'B'];
      const remoteSupportLabels = ['C', 'D'];
      try {
        await kvStore!.setSyncRange(localLabels, remoteSupportLabels);
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncParam_0101
     * @tc.name SUB_DDM_SKV_Null_setSyncParam_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncParam(defaultAllowedDelayMs: number, callback: AsyncCallback): void;
     * setSyncParam  callback，localLabels = null/undefined
     */
    it('SUB_DDM_SKV_Null_setSyncParam_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncParam_0101 begin---------  ');
      try {
        kvStore!.setSyncParam(null, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncParam_0102
     * @tc.name SUB_DDM_SKV_Null_setSyncParam_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncParam(defaultAllowedDelayMs: number, callback: AsyncCallback): void;
     * setSyncParam  callback，localLabels = null/undefined
     */
    it('SUB_DDM_SKV_Null_setSyncParam_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncParam_0102 begin---------  ');
      try {
        kvStore!.setSyncParam(undefined, (err: BusinessError) => {
          console.error(TAG + "get err=" + err.code + err.message);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncParam_Promise_0101
     * @tc.name SUB_DDM_SKV_Null_setSyncParam_Promise_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncParam(defaultAllowedDelayMs: number): Promise;
     * setSyncParam  Promise，key = null/undefined
     */
    it('SUB_DDM_SKV_Null_setSyncParam_Promise_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncParam_Promise_0101 begin---------  ');
      try {
        await kvStore!.setSyncParam(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_setSyncParam_Promise_0102
     * @tc.name SUB_DDM_SKV_Null_setSyncParam_Promise_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSyncParam(defaultAllowedDelayMs: number): Promise;
     * setSyncParam  Promise，key = null/undefined
     */
    it('SUB_DDM_SKV_Null_setSyncParam_Promise_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_setSyncParam_Promise_0102 begin---------  ');
      try {
        await kvStore!.setSyncParam(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e delete' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_sync_0101
     * @tc.name SUB_DDM_SKV_Null_sync_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * delayMs = null/undefined
     */
    it('SUB_DDM_SKV_Null_sync_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_sync_0101 begin---------  ');
      let mode = factory.SyncMode.PULL_ONLY;
      try {
        kvStore!.sync(null, mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_sync_0102
     * @tc.name SUB_DDM_SKV_Null_sync_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * delayMs = null/undefined
     */
    it('SUB_DDM_SKV_Null_sync_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_sync_0102 begin---------  ');
      let mode = factory.SyncMode.PULL_ONLY;
      try {
        kvStore!.sync(undefined, mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_sync_0103
     * @tc.name SUB_DDM_SKV_Null_sync_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * delayMs = null/undefined
     */
    it('SUB_DDM_SKV_Null_sync_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_sync_0103 begin---------  ');
      let mode = factory.SyncMode.PULL_ONLY;
      try {
        kvStore!.sync([], mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_sync_0301
     * @tc.name SUB_DDM_SKV_Null_sync_0301
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * delayMs = null/undefined
     */
    it('SUB_DDM_SKV_Null_sync_0301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_sync_0301 begin---------  ');
      let mode = factory.SyncMode.PULL_ONLY;
      try {
        kvStore!.sync(syncDeviceIds, mode, null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect( e != undefined ).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_sync_0302
     * @tc.name SUB_DDM_SKV_Null_sync_0302
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * delayMs = null/undefined
     */
    it('SUB_DDM_SKV_Null_sync_0302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_sync_0302 begin---------  ');
      let mode = factory.SyncMode.PULL_ONLY;
      try {
        kvStore!.sync(syncDeviceIds, mode, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect( e != undefined ).assertTrue();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0101
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0101 begin---------  ');
      let mode = factory.SyncMode.PUSH_ONLY;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync(null, query, mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0102
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0102 begin---------  ');
      let mode = factory.SyncMode.PUSH_ONLY;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync(undefined, query, mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0103
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0103 begin---------  ');
      let mode = factory.SyncMode.PUSH_PULL;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync([], query, mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0201
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0201 begin---------  ');
      let mode = factory.SyncMode.PUSH_ONLY;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync(syncDeviceIds, null, mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0202
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0202 begin---------  ');
      let mode = factory.SyncMode.PULL_ONLY;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync(syncDeviceIds, undefined, mode, 10);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0203
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0203 begin---------  ');
      let mode = factory.SyncMode.PUSH_ONLY;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync(syncDeviceIds, query, mode, 10);
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0401
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0401
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0401 begin---------  ');
      let mode = factory.SyncMode.PUSH_ONLY;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync(syncDeviceIds, query, mode, null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e!=undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_syncQuery_0402
     * @tc.name SUB_DDM_SKV_Null_syncQuery_0402
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sync(deviceIds: string[], query: Query, mode: SyncMode, delayMs?: number): void;
     * sync  callback，deviceIds = null/undefined/[]
     * query = null/undefined;  mode = PUSH_ONLY; delayMs = null/undefined; (syncDeviceIds, query, mode, 10);
     */
    it('SUB_DDM_SKV_Null_syncQuery_0402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_syncQuery_0402 begin---------  ');
      let mode = factory.SyncMode.PUSH_ONLY;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.sync(syncDeviceIds, query, mode, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e!=undefined).assertTrue();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_ondataChange_0101
     * @tc.name SUB_DDM_SKV_Null_ondataChange_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc on(event: 'dataChange', type: SubscribeType, listener: Callback): void;
     * on dataChange，event = null/undefined
     * type = ['SUBSCRIBE_TYPE_REMOTE', 'SUBSCRIBE_TYPE_ALL']
     * on('dataChange', type, (data: factory.ChangeNotification)
     */
    it('SUB_DDM_SKV_Null_ondataChange_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_ondataChange_0101 begin---------  ');
      let type = factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.on(null, type, (data: factory.ChangeNotification) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_ondataChange_0102
     * @tc.name SUB_DDM_SKV_Null_ondataChange_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc on(event: 'dataChange', type: SubscribeType, listener: Callback): void;
     * on dataChange，event = null/undefined
     * type = ['SUBSCRIBE_TYPE_REMOTE', 'SUBSCRIBE_TYPE_ALL']
     * on('dataChange', type, (data: factory.ChangeNotification)
     */
    it('SUB_DDM_SKV_Null_ondataChange_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_ondataChange_0102 begin---------  ');
      let type = factory.SubscribeType.SUBSCRIBE_TYPE_ALL;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.on(undefined, type, (data: factory.ChangeNotification) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_ondataChange_0201
     * @tc.name SUB_DDM_SKV_Null_ondataChange_0201
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc on(event: 'dataChange', type: SubscribeType, listener: Callback): void;
     * on dataChange，event = null/undefined
     * type = ['SUBSCRIBE_TYPE_REMOTE', 'SUBSCRIBE_TYPE_ALL']
     * on('dataChange', type, (data: factory.ChangeNotification)
     */
    it('SUB_DDM_SKV_Null_ondataChange_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_ondataChange_0201 begin---------  ');
      let type = factory.SubscribeType.SUBSCRIBE_TYPE_REMOTE;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.on('dataChange', type, (data: factory.ChangeNotification) => {
          console.info(`startTransaction 0 ${data}`);
        });
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_ondataChange_0202
     * @tc.name SUB_DDM_SKV_Null_ondataChange_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc on(event: 'dataChange', type: SubscribeType, listener: Callback): void;
     * on dataChange，event = null/undefined
     * type = ['SUBSCRIBE_TYPE_REMOTE', 'SUBSCRIBE_TYPE_ALL']
     * on('dataChange', type, (data: factory.ChangeNotification)
     */
    it('SUB_DDM_SKV_Null_ondataChange_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_ondataChange_0202 begin---------  ');
      let type = factory.SubscribeType.SUBSCRIBE_TYPE_ALL;
      const query = new factory.Query();
      query.prefixKey("batch_test");
      try {
        kvStore!.on('dataChange', type, (data: factory.ChangeNotification) => {
          console.info(`startTransaction 0 ${data}`);
        });
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_offdataChange_0101
     * @tc.name SUB_DDM_SKV_Null_offdataChange_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc off(event: 'dataChange', listener?: Callback): void;
     * off dataChange，event = null/undefined
     */
    it('SUB_DDM_SKV_Null_offdataChange_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_offdataChange_0101 begin---------  ');
      try {
        kvStore!.off(null, (data: factory.ChangeNotification) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_offdataChange_0102
     * @tc.name SUB_DDM_SKV_Null_offdataChange_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc off(event: 'dataChange', listener?: Callback): void;
     * off dataChange，event = null/undefined
     */
    it('SUB_DDM_SKV_Null_offdataChange_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_offdataChange_0102 begin---------  ');
      try {
        kvStore!.off(undefined, (data: factory.ChangeNotification) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_onsyncComplete_0101
     * @tc.name SUB_DDM_SKV_Null_onsyncComplete_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc on(event: 'syncComplete', syncCallback: Callback<Array<[string,number]>>): void;
     * on dataChange，event = null/undefined
     * on('syncComplete', (data: [string, number][])
     */
    it('SUB_DDM_SKV_Null_onsyncComplete_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_onsyncComplete_0101 begin---------  ');
      try {
        kvStore!.on(null, (data: [string, number][]) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_onsyncComplete_0102
     * @tc.name SUB_DDM_SKV_Null_onsyncComplete_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc on(event: 'syncComplete', syncCallback: Callback<Array<[string,number]>>): void;
     * on dataChange，event = null/undefined
     * on('syncComplete', (data: [string, number][])
     */
    it('SUB_DDM_SKV_Null_onsyncComplete_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_onsyncComplete_0102 begin---------  ');
      try {
        kvStore!.on(undefined, (data: [string, number][]) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_offsyncComplete_0101
     * @tc.name SUB_DDM_SKV_Null_offsyncComplete_0101
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc off(event: 'syncComplete', syncCallback?: Callback<Array<[string,number]>>): void;
     * off dataChange，event = null/undefined
     */
    it('SUB_DDM_SKV_Null_offsyncComplete_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_offsyncComplete_0101 begin---------  ');
      try {
        kvStore!.off(null, (data: [string, number][]) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_offsyncComplete_0102
     * @tc.name SUB_DDM_SKV_Null_offsyncComplete_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc off(event: 'syncComplete', syncCallback?: Callback<Array<[string,number]>>): void;
     * off dataChange，event = null/undefined
     */
    it('SUB_DDM_SKV_Null_offsyncComplete_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_offsyncComplete_0102 begin---------  ');
      try {
        kvStore!.off(undefined, (data: [string, number][]) => {
          console.info(`startTransaction 0 ${data}`);
        });
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'catch e get' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_move_0100
     * @tc.name SUB_DDM_SKV_Null_move_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  KVStoreResultSet 	move(offset: number): boolean;
     * offset = null/undefined
     */
    it('SUB_DDM_SKV_Null_move_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_move_0100 begin---------  ');
      let resultSet: factory.KVStoreResultSet;
      let moved: boolean;
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

      try {
        await kvStore!.putBatch(entries);
        await kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          resultSet = result;
          moved = resultSet.move(null);
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_move_0102
     * @tc.name SUB_DDM_SKV_Null_move_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  KVStoreResultSet 	move(offset: number): boolean;
     * offset = null/undefined
     */
    it('SUB_DDM_SKV_Null_move_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_move_0102 begin---------  ');
      let resultSet: factory.KVStoreResultSet;
      let moved: boolean;
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

      try {
        await kvStore!.putBatch(entries);
        await kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          resultSet = result;
          moved = resultSet.move(undefined);
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_moveToPosition_0100
     * @tc.name SUB_DDM_SKV_Null_moveToPosition_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  KVStoreResultSet 	moveToPosition(position: number): boolean;
     * offset = null/undefined
     */
    it('SUB_DDM_SKV_Null_moveToPosition_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_moveToPosition_0100 begin---------  ');
      let resultSet: factory.KVStoreResultSet;
      let moveToPositiond: boolean;
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

      try {
        await kvStore!.putBatch(entries);
        await kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          resultSet = result;
          moveToPositiond = resultSet.moveToPosition(null);
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_moveToPosition_0102
     * @tc.name SUB_DDM_SKV_Null_moveToPosition_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  KVStoreResultSet 	moveToPosition(position: number): boolean;
     * offset = null/undefined
     */
    it('SUB_DDM_SKV_Null_moveToPosition_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_moveToPosition_0102 begin---------  ');
      let resultSet: factory.KVStoreResultSet;
      let moveToPositiond: boolean;
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

      try {
        await kvStore!.putBatch(entries);
        await kvStore!.getResultSet('batch_test_string_key').then(async (result: factory.KVStoreResultSet) => {
          console.info(TAG + 'Succeeded getEntries, result=' + result);
          resultSet = result;
          moveToPositiond = resultSet.moveToPosition(undefined);
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_0100
     * @tc.name SUB_DDM_SKV_Null_Schema_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  Schema
     */
    it('SUB_DDM_SKV_Null_Schema_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_0100 begin---------  ');
      try {
        let first = new factory.FieldNode('first');
        first.type = factory.ValueType.STRING;
        first.nullable = false;
        first.default = 'first name';

        let english = new factory.FieldNode('english');
        english.type = factory.ValueType.STRING;
        english.appendChild(first);

        let schema = new factory.Schema();
        schema.root.appendChild(english);
        schema.indexes = ['$.english.first'];
        schema.mode = 1;
        schema.skip = 0;

        console.info(TAG + 'schema.root =' + schema.root);
        console.info(TAG + 'schema.mode=' + schema.mode);
        console.info(TAG + 'schema.skip=' + schema.skip);
        console.info(TAG + 'schema.indexes=' + schema.indexes);

        expect(schema.root != undefined).assertTrue();
        expect(schema.indexes[0]).assertEqual('$.english.first');
        expect(schema.mode).assertEqual(1);
        expect(schema.skip).assertEqual(0);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_root_0100
     * @tc.name SUB_DDM_SKV_Null_Schema_root_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  root = FieldNode/null/undefined
     */
    it('SUB_DDM_SKV_Null_Schema_root_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_root_0100 begin---------  ');
      try {
        let first = new factory.FieldNode('first');
        first.type = factory.ValueType.STRING;
        first.nullable = false;
        first.default = 'first name';

        let schema = new factory.Schema();

        schema.root.appendChild(first);
        console.info(TAG + 'schema.root =' + schema.root);
        expect(schema.root != undefined).assertTrue();

        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_root_0102
     * @tc.name SUB_DDM_SKV_Null_Schema_root_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  root = FieldNode/null/undefined
     */
    it('SUB_DDM_SKV_Null_Schema_root_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_root_0102 begin---------  ');
      try {
        let schema = new factory.Schema();
        schema.root.appendChild(null);
        console.info(TAG + 'schema.root =' + schema.root);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_root_0103
     * @tc.name SUB_DDM_SKV_Null_Schema_root_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  root = FieldNode/null/undefined
     */
    it('SUB_DDM_SKV_Null_Schema_root_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_root_0103 begin---------  ');
      try {
        let schema = new factory.Schema();
        schema.root.appendChild(undefined);
        console.info(TAG + 'schema.root =' + schema.root);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_Schema_indexes_0100
     * @tc.name SUB_DDM_SKV_Null_Schema_indexes_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  indexes = ['$.english.first']/[""]/[]
     */
    it('SUB_DDM_SKV_Null_Schema_indexes_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_Schema_indexes_0100 begin---------  ');
      try {
        let schema = new factory.Schema();
        schema.indexes = ['$.english.first'];
        console.info(TAG + 'schema.indexes1 =' + schema.indexes);
        expect(schema.indexes[0]).assertEqual('$.english.first');

        schema.indexes = [""];
        console.info(TAG + 'schema.indexes2 =' + schema.indexes);
        expect(schema.indexes[0]).assertEqual("");

        schema.indexes = [];
        console.info(TAG + 'schema.indexes3 =' + schema.indexes);
        expect(schema.indexes.length).assertEqual(0);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_FieldNode_0100
     * @tc.name SUB_DDM_SKV_Null_FieldNode_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  Schema
     */
    it('SUB_DDM_SKV_Null_FieldNode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_FieldNode_0100 begin---------  ');
      try {
        let first = new factory.FieldNode('first');
        first.type = factory.ValueType.STRING;
        first.nullable = false;
        first.default = 'first name';

        let english = new factory.FieldNode('english');
        english.type = factory.ValueType.STRING;
        english.appendChild(first);

        console.info(TAG + 'first.type =' + first.type);
        expect(first.type).assertEqual(factory.ValueType.STRING);

        console.info(TAG + 'first.nullable false=' + first.nullable);
        expect(first.nullable).assertEqual(false);

        first.nullable = true;
        console.info(TAG + 'first.nullable true=' + first.nullable);
        expect(first.nullable).assertEqual(true);

        console.info(TAG + 'first.default =' + first.default);
        expect(first.default).assertEqual('first name');
        first.default = '';
        console.info(TAG + 'first.default f22=' + first.default);
        expect(first.default).assertEqual('');

        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_FieldNode_appendChild_0100
     * @tc.name SUB_DDM_SKV_Null_FieldNode_appendChild_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild null/undefined
     */
    it('SUB_DDM_SKV_Null_FieldNode_appendChild_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_FieldNode_appendChild_0100 begin---------  ');
      try {
        let english = new factory.FieldNode('english');
        english.appendChild(null);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_FieldNode_appendChild_0102
     * @tc.name SUB_DDM_SKV_Null_FieldNode_appendChild_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild null/undefined
     */
    it('SUB_DDM_SKV_Null_FieldNode_appendChild_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_FieldNode_appendChild_0102 begin---------  ');
      try {
        let english = new factory.FieldNode('english');
        english.appendChild(undefined);
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_SingleKvNull_FieldNode_appendChild_0103
     * @tc.name SUB_DDM_SKV_Null_FieldNode_appendChild_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  appendChild null/undefined
     */
    it('SUB_DDM_SKV_Null_FieldNode_appendChild_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_Null_FieldNode_appendChild_0103 begin---------  ');
      try {
        let english = new factory.FieldNode('english');
        english.default = "";
        console.info(TAG + 'english.default =' + english.default);
        expect(english.default).assertEqual("");
        done();
      } catch (e) {
        console.error(TAG + ' catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    console.info(TAG + '-------------------describe SingleKvStoreReturnValue  end-------------------');
  })
}