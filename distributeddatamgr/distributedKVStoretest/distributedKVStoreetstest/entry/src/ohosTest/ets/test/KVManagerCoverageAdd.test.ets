/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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

const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]"
const TEST_BUNDLE_NAME = 'ohos.acts.kv2';
let kvManager: factory.KVManager|null ;
let kvStore : factory.SingleKVStore|null;
const TEST_STORE_ID = 'SingleKvStoreReturnValueId';

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};

const options1: factory.Options = {
  createIfMissing: true,
  encrypt: false,
  backup: false,
  autoSync: true,
  kvStoreType: factory.KVStoreType.SINGLE_VERSION,
  securityLevel: factory.SecurityLevel.S1,
};

const options2: factory.Options = {
  createIfMissing: true,
  encrypt: false,
  backup: false,
  autoSync: true,
  kvStoreType: factory.KVStoreType.SINGLE_VERSION,
  securityLevel: factory.SecurityLevel.S3,
};

const options3: factory.Options = {
  createIfMissing: true,
  encrypt: false,
  backup: false,
  autoSync: true,
  kvStoreType: factory.KVStoreType.SINGLE_VERSION,
  securityLevel: factory.SecurityLevel.S4,
};

export default function KVManagerCoverageAdd(){
  describe('KVManagerCoverageAdd', () => {

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_0100
     * @tc.name KVManagerCoverageAdd_createKVManager_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_createKVManager_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_createKVManager_001 begin---------  ');
      try {
        let kvManager: factory.KVManager = factory.createKVManager(null);
        expect(kvManager).assertEqual(undefined)
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code)
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_createKVManager_0200
     * @tc.name KVManagerCoverageAdd_createKVManager_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_createKVManager_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_createKVManager_002 begin---------  ');
      try {
        let kvManager: factory.KVManager = factory.createKVManager(undefined);
        expect(kvManager).assertEqual(undefined)
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code)
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0100
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc securityLevel is S1
     */
    it('KVManagerCoverageAdd_getKVStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore(TEST_STORE_ID, options1, (err: BusinessError, store: factory.SingleKVStore) => {
          console.info(TAG + "Succeeded in getting KVStore"+store);
          kvStore = store;
          expect(kvStore !== undefined).assertTrue()

          kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info(TAG + ' Succeeded closeKVStore');
          }).catch((err: BusinessError) => {
            console.error(TAG + ` Failed closeKVStore.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
          });

          kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info(TAG + ' Succeeded deleteKVStore');
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + ` Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0200
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc securityLevel is S3
     */
    it('KVManagerCoverageAdd_getKVStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore(TEST_STORE_ID, options2, (err: BusinessError, store: factory.SingleKVStore) => {
          console.info(TAG + "Succeeded in getting KVStore"+store);
          kvStore = store;
          expect(kvStore !== undefined).assertTrue()

          kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info(TAG + ' Succeeded closeKVStore');
          }).catch((err: BusinessError) => {
            console.error(TAG + ` Failed closeKVStore.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
          });

          kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info(TAG + ' Succeeded deleteKVStore');
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + ` Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0300
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc securityLevel is S4
     */
    it('KVManagerCoverageAdd_getKVStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore(TEST_STORE_ID, options3, (err: BusinessError, store: factory.SingleKVStore) => {
          console.info(TAG + "Succeeded in getting KVStore"+store);
          kvStore = store;
          expect(kvStore !== undefined).assertTrue()

          kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info(TAG + ' Succeeded closeKVStore');
          }).catch((err: BusinessError) => {
            console.error(TAG + ` Failed closeKVStore.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
          });

          kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
            console.info(TAG + ' Succeeded deleteKVStore');
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + ` Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0400
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_getKVStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_004 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore("", options3, (err: BusinessError, store: factory.SingleKVStore) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0500
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_getKVStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_005 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore(null, options3, (err: BusinessError, store: factory.SingleKVStore) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0600
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_getKVStore_callback_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_006 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore(undefined, options3, (err: BusinessError, store: factory.SingleKVStore) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0700
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_getKVStore_callback_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_007 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore(TEST_BUNDLE_NAME, null, (err: BusinessError, store: factory.SingleKVStore) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_callback_0800
     * @tc.name KVManagerCoverageAdd_getKVStore_callback_008
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_getKVStore_callback_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_callback_008 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore(TEST_BUNDLE_NAME, undefined, (err: BusinessError, store: factory.SingleKVStore) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0100
     * @tc.name KVManagerCoverageAdd_getKVStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_getKVStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_promise_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getKVStore<factory.SingleKVStore>("", options1).then((store: factory.SingleKVStore) => {
          expect(store!== undefined).assertTrue();
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0200
     * @tc.name KVManagerCoverageAdd_getKVStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_getKVStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_promise_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        await kvManager.getKVStore<factory.SingleKVStore>(null, options1)
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0300
     * @tc.name KVManagerCoverageAdd_getKVStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_getKVStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_promise_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        await kvManager.getKVStore<factory.SingleKVStore>(undefined, options1)
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0400
     * @tc.name KVManagerCoverageAdd_getKVStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_getKVStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_promise_004 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        await kvManager.getKVStore<factory.SingleKVStore>(TEST_BUNDLE_NAME, null)
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getKVStore_promise_0500
     * @tc.name KVManagerCoverageAdd_getKVStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_getKVStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getKVStore_promise_005 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        await kvManager.getKVStore<factory.SingleKVStore>(TEST_BUNDLE_NAME, undefined)
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0100
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore("", TEST_STORE_ID, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0200
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(null, TEST_STORE_ID, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0300
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(undefined, TEST_STORE_ID, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0400
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_004 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(TEST_BUNDLE_NAME, "", (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0500
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_005 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(TEST_BUNDLE_NAME, null, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_callback_0600
     * @tc.name KVManagerCoverageAdd_closeKVStore_callback_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_callback_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_callback_006 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(TEST_BUNDLE_NAME, undefined, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0100
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore("", TEST_STORE_ID).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0200
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(null, TEST_STORE_ID).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0300
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(undefined, TEST_STORE_ID).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0400
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_004 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(TEST_BUNDLE_NAME, "").then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0500
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_005 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(TEST_BUNDLE_NAME, null).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_closeKVStore_promise_0600
     * @tc.name KVManagerCoverageAdd_closeKVStore_promise_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_closeKVStore_promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_closeKVStore_promise_006 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.closeKVStore(TEST_BUNDLE_NAME, undefined).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0100
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore("", TEST_STORE_ID, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0200
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(null, TEST_STORE_ID, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0300
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(undefined, TEST_STORE_ID, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0400
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_004 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, "", (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0500
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_005 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, null, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_callback_0600
     * @tc.name KVManagerCoverageAdd_deleteKVStore_callback_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_callback_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_callback_006 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, undefined, (err: BusinessError) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0100
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore("", TEST_STORE_ID).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0200
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(null, TEST_STORE_ID).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0300
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(undefined, TEST_STORE_ID).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0400
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_004 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, "").then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0500
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_005 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, null).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_deleteKVStore_promise_0600
     * @tc.name KVManagerCoverageAdd_deleteKVStore_promise_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec is undefined
     */
    it('KVManagerCoverageAdd_deleteKVStore_promise_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_deleteKVStore_promise_006 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.deleteKVStore(TEST_BUNDLE_NAME, undefined).then(() => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG +`Failed to get KVStore.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_callback_0100
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_callback_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_callback_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_callback_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId("", (err: BusinessError, data: string[]) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_callback_0200
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_callback_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_callback_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_callback_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(null, (err: BusinessError, data: string[]) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_callback_0300
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_callback_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_callback_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_callback_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(undefined, (err: BusinessError, data: string[]) => {
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_promise_0100
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_promise_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_promise_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_promise_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId("").then((data: string[]) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_promise_0200
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_promise_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_promise_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_promise_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(null).then((data: string[]) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_getAllKVStoreId_promise_0300
     * @tc.name KVManagerCoverageAdd_getAllKVStoreId_promise_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_getAllKVStoreId_promise_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_getAllKVStoreId_promise_003 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        kvManager.getAllKVStoreId(undefined).then((data: string[]) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(`Failed to get AllKVStoreId.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_on_0100
     * @tc.name KVManagerCoverageAdd_on_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_on_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_on_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = () => {
          console.info(TAG + 'death callback call');
        }
        kvManager.on(null, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_on_0200
     * @tc.name KVManagerCoverageAdd_on_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_on_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_on_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = () => {
          console.info(TAG + 'death callback call');
        }
        kvManager.on(undefined, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_off_0100
     * @tc.name KVManagerCoverageAdd_off_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('KVManagerCoverageAdd_off_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_off_001 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = () => {
          console.info(TAG + 'death callback call');
        }
        kvManager.off(null, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_KVManagerCoverageAdd_off_0200
     * @tc.name KVManagerCoverageAdd_off_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('KVManagerCoverageAdd_off_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- KVManagerCoverageAdd_off_002 begin---------  ');
      try {
        kvManager = factory.createKVManager(config);
        console.info(TAG + 'kvManager=' + kvManager);
        expect(kvManager !== undefined).assertTrue()
        const deathCallback = () => {
          console.info(TAG + 'death callback call');
        }
        kvManager.off(undefined, deathCallback);
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })


    console.info(TAG + '-------------------describe KVManagerCoverageAdd  end-------------------');
  })
}