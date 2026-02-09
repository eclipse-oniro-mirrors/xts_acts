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
const TEST_STORE_ID = 'SingleKvStoreQueryNull';
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


export default function QueryNull(){
  describe('QueryNull', () => {
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
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0100
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0102
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0200
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0202
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_equalTo_0204
     * @tc.name SUB_DDM_SKV_QueryNull_equalTo_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc equalTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //equalTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_equalTo_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_equalTo_0204 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.equalTo("key", true);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0100
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0102
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0200
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0202
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notEqualTo_0204
     * @tc.name SUB_DDM_SKV_QueryNull_notEqualTo_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //notEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_notEqualTo_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notEqualTo_0204 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notEqualTo("key", true);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0100
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0102
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0103
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0200
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0202
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0203
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThan_0204
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThan_0204
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/false    //greaterThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThan_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThan_0204 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThan("key", false);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0100
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0102
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0103
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0200
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0202
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThan_0203
     * @tc.name SUB_DDM_SKV_QueryNull_lessThan_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThan(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThan("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThan_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThan_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThan("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0100
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0102
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0200
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0202
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_greaterThanOrEqualTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc greaterThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //greaterThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_greaterThanOrEqualTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.greaterThanOrEqualTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0100
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0102
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0103
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0200
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0202
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_lessThanOrEqualTo_0203
     * @tc.name SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc lessThanOrEqualTo(field: string, value: number | string | boolean): Query;
     * field = null/undefined/""/
     * value = null/undefined/""/true    //lessThanOrEqualTo("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_lessThanOrEqualTo_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.lessThanOrEqualTo("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

//=========================================================================================
    //=========================================================================================
    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNull_0100
     * @tc.name SUB_DDM_SKV_QueryNull_isNull_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNull(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_isNull_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNull_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNull(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNull_0102
     * @tc.name SUB_DDM_SKV_QueryNull_isNull_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNull(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_isNull_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNull_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNull(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNull_0103
     * @tc.name SUB_DDM_SKV_QueryNull_isNull_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNull(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_isNull_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNull_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNull("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inNumber_0100
     * @tc.name SUB_DDM_SKV_QueryNull_inNumber_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inNumber_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inNumber_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inNumber(null, [1,2]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inNumber_0102
     * @tc.name SUB_DDM_SKV_QueryNull_inNumber_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inNumber_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inNumber_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inNumber(undefined, [1,2]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inNumber_0103
     * @tc.name SUB_DDM_SKV_QueryNull_inNumber_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inNumber_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inNumber_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inNumber("", [1,2]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inNumber_0200
     * @tc.name SUB_DDM_SKV_QueryNull_inNumber_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inNumber_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inNumber_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inNumber("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inNumber_0202
     * @tc.name SUB_DDM_SKV_QueryNull_inNumber_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inNumber_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inNumber_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inNumber("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInNumber_0100
     * @tc.name SUB_DDM_SKV_QueryNull_notInNumber_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInNumber_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInNumber_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInNumber(null, [1,2]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInNumber_0102
     * @tc.name SUB_DDM_SKV_QueryNull_notInNumber_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInNumber_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInNumber_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInNumber(undefined, [1,2]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInNumber_0103
     * @tc.name SUB_DDM_SKV_QueryNull_notInNumber_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInNumber_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInNumber_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInNumber("", [1,2]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInNumber_0200
     * @tc.name SUB_DDM_SKV_QueryNull_notInNumber_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInNumber_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInNumber_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInNumber("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInNumber_0202
     * @tc.name SUB_DDM_SKV_QueryNull_notInNumber_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInNumber(field: string, valueList: number[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInNumber_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInNumber_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInNumber("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inString_0100
     * @tc.name SUB_DDM_SKV_QueryNull_inString_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inString_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inString(null, ["v1", "v2"]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inString_0102
     * @tc.name SUB_DDM_SKV_QueryNull_inString_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inString_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inString_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inString(undefined, ["v1", "v2"]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inString_0103
     * @tc.name SUB_DDM_SKV_QueryNull_inString_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inString_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inString_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inString("", ["v1", "v2"]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inString_0200
     * @tc.name SUB_DDM_SKV_QueryNull_inString_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inString_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inString_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inString("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_inString_0202
     * @tc.name SUB_DDM_SKV_QueryNull_inString_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc inString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_inString_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_inString_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.inString("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInString_0100
     * @tc.name SUB_DDM_SKV_QueryNull_notInString_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInString_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInString(null, ["v1", "v2"]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInString_0102
     * @tc.name SUB_DDM_SKV_QueryNull_notInString_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInString_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInString_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInString(undefined, ["v1", "v2"]);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInString_0103
     * @tc.name SUB_DDM_SKV_QueryNull_notInString_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInString_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInString_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInString("", ["v1", "v2"]);
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInString_0200
     * @tc.name SUB_DDM_SKV_QueryNull_notInString_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInString_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInString_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInString("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_notInString_0202
     * @tc.name SUB_DDM_SKV_QueryNull_notInString_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc notInString(field: string, valueList: string[]): Query;
     * field = null/undefined/""/
     * value = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_notInString_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_notInString_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.notInString("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0100
     * @tc.name SUB_DDM_SKV_QueryNull_like_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0102
     * @tc.name SUB_DDM_SKV_QueryNull_like_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0103
     * @tc.name SUB_DDM_SKV_QueryNull_like_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0200
     * @tc.name SUB_DDM_SKV_QueryNull_like_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0202
     * @tc.name SUB_DDM_SKV_QueryNull_like_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_like_0203
     * @tc.name SUB_DDM_SKV_QueryNull_like_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc like(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //like("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_like_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_like_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.like("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })



    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0100
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike(null, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0102
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike(undefined, "value");
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0103
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike("", "value");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0200
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike("key", null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0202
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike("key", undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_unlike_0203
     * @tc.name SUB_DDM_SKV_QueryNull_unlike_0203
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc unlike(field: string, value: string): Query;
     * field = null/undefined/""/
     * value = null/undefined/""    //unlike("key", "value")
     */
    it('SUB_DDM_SKV_QueryNull_unlike_0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_unlike_0203 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.unlike("key", "");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByAsc_0100
     * @tc.name SUB_DDM_SKV_QueryNull_orderByAsc_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByAsc(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByAsc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByAsc_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByAsc(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByAsc_0102
     * @tc.name SUB_DDM_SKV_QueryNull_orderByAsc_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByAsc(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByAsc_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByAsc_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByAsc(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByAsc_0103
     * @tc.name SUB_DDM_SKV_QueryNull_orderByAsc_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByAsc(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByAsc_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByAsc_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByAsc("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByDesc_0100
     * @tc.name SUB_DDM_SKV_QueryNull_orderByDesc_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByDesc(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByDesc_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByDesc(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByDesc_0102
     * @tc.name SUB_DDM_SKV_QueryNull_orderByDesc_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByDesc(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByDesc_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByDesc_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByDesc(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_orderByDesc_0103
     * @tc.name SUB_DDM_SKV_QueryNull_orderByDesc_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc orderByDesc(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_orderByDesc_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_orderByDesc_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.orderByDesc("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_limit_0100
     * @tc.name SUB_DDM_SKV_QueryNull_limit_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc limit(total: number, offset: number): Query;
     * total = null/undefined/ ,  offset = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_limit_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_limit_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.limit(null, 1);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_limit_0102
     * @tc.name SUB_DDM_SKV_QueryNull_limit_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc limit(total: number, offset: number): Query;
     * total = null/undefined/ ,  offset = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_limit_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_limit_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.limit(undefined, 1);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })


    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_limit_0200
     * @tc.name SUB_DDM_SKV_QueryNull_limit_0200
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc limit(total: number, offset: number): Query;
     * total = null/undefined/ ,  offset = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_limit_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_limit_0200 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.limit(1, null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_limit_0202
     * @tc.name SUB_DDM_SKV_QueryNull_limit_0202
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc limit(total: number, offset: number): Query;
     * total = null/undefined/ ,  offset = null/undefined
     */
    it('SUB_DDM_SKV_QueryNull_limit_0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_limit_0202 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.limit(1, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })



    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNotNull_0100
     * @tc.name SUB_DDM_SKV_QueryNull_isNotNull_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNotNull(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_isNotNull_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNotNull_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNotNull(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNotNull_0102
     * @tc.name SUB_DDM_SKV_QueryNull_isNotNull_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNotNull(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_isNotNull_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNotNull_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNotNull(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_isNotNull_0103
     * @tc.name SUB_DDM_SKV_QueryNull_isNotNull_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc isNotNull(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_isNotNull_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_isNotNull_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.isNotNull("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_prefixKey_0100
     * @tc.name SUB_DDM_SKV_QueryNull_prefixKey_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc prefixKey(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_prefixKey_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_prefixKey_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.prefixKey(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_prefixKey_0102
     * @tc.name SUB_DDM_SKV_QueryNull_prefixKey_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc prefixKey(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_prefixKey_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_prefixKey_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.prefixKey(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_prefixKey_0103
     * @tc.name SUB_DDM_SKV_QueryNull_prefixKey_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc prefixKey(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_prefixKey_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_prefixKey_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.prefixKey("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_setSuggestIndex_0100
     * @tc.name SUB_DDM_SKV_QueryNull_setSuggestIndex_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSuggestIndex(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_setSuggestIndex_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_setSuggestIndex_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.setSuggestIndex(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_setSuggestIndex_0102
     * @tc.name SUB_DDM_SKV_QueryNull_setSuggestIndex_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSuggestIndex(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_setSuggestIndex_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_setSuggestIndex_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.setSuggestIndex(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_setSuggestIndex_0103
     * @tc.name SUB_DDM_SKV_QueryNull_setSuggestIndex_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc setSuggestIndex(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_setSuggestIndex_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_setSuggestIndex_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.setSuggestIndex("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_deviceId_0100
     * @tc.name SUB_DDM_SKV_QueryNull_deviceId_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deviceId(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_deviceId_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_deviceId_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.deviceId(null);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_deviceId_0102
     * @tc.name SUB_DDM_SKV_QueryNull_deviceId_0102
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deviceId(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_deviceId_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_deviceId_0102 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.deviceId(undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(e.code).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_deviceId_0103
     * @tc.name SUB_DDM_SKV_QueryNull_deviceId_0103
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc deviceId(field: string): Query;
     * field = null/undefined/""/
     */
    it('SUB_DDM_SKV_QueryNull_deviceId_0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_deviceId_0103 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        query.deviceId("");
        console.info(TAG + "query is " + query.getSqlLike());
        query.reset();
        console.info(TAG + "query is " + query.getSqlLike());
        query = null;
        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }

    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_QueryNull_wall_0100
     * @tc.name SUB_DDM_SKV_QueryNull_wall_0100
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc  w all
     */
    it('SUB_DDM_SKV_QueryNull_wall_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- SUB_DDM_SKV_QueryNull_wall_0100 begin---------  ');
      try {
        let query: factory.Query | null = new factory.Query();
        let qRes: factory.Query | null = new factory.Query();

        qRes = query.reset();
        expect(qRes!=undefined).assertTrue();

        qRes = query.equalTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.notEqualTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.greaterThan('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.lessThan('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.greaterThanOrEqualTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.lessThanOrEqualTo('eee', "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.isNull("value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.inNumber("field", [0, 1]);
        expect(qRes!=undefined).assertTrue();

        qRes = query.inString("field", ['test1', 'test2']);
        expect(qRes!=undefined).assertTrue();

        qRes = query.notInNumber("field", [0, 1]);
        expect(qRes!=undefined).assertTrue();

        qRes = query.notInString("field", ['test1', 'test2']);
        expect(qRes!=undefined).assertTrue();

        qRes = query.like("field", "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.unlike("field", "value");
        expect(qRes!=undefined).assertTrue();

        qRes = query.orderByAsc("field");
        expect(qRes!=undefined).assertTrue();

        qRes = query.orderByDesc("field");
        expect(qRes!=undefined).assertTrue();

        qRes = query.limit(10, 1);
        expect(qRes!=undefined).assertTrue();

        qRes = query.isNotNull("field");
        expect(qRes!=undefined).assertTrue();

        qRes = query.prefixKey("0");
        expect(qRes!=undefined).assertTrue();

        qRes = query.setSuggestIndex("0");
        expect(qRes!=undefined).assertTrue();

        qRes = query.deviceId("deviceId")
        expect(qRes!=undefined).assertTrue();

        done();
      } catch (e) {
        console.error(TAG + 'put 1, catch e ' + `, error code is ${e.code}, message is ${e.message}`);
        expect(null).assertFail();
        done();
      }
    })


    console.info(TAG + '-------------------describe SingleKvStoreReturnValue  end-------------------');
  })
}