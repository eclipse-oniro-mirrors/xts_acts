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

const TEST_BUNDLE_NAME = 'ohos.acts.kv2';
const TEST_STORE_ID = 'DeviceKvStoreReturnValueId';
let kvManager: factory.KVManager|null ;
let kvStore : factory.DeviceKVStore|null;
let localDeviceId = '';

function sleep(ms:number) {
  return new Promise<ESObject>(resolve => setTimeout(resolve, ms));
}

const TAG = "[Kv_Promise_Ets_TEST >>>>>> ]"

const config : factory.KVManagerConfig = {
  bundleName: TEST_BUNDLE_NAME,
  context: context
};


export default function DeviceKvStoreGetCoverageAdd(){
  describe('DeviceKvStoreGetCoverageAdd', () => {
    const options: factory.Options = {
      createIfMissing: true,
      encrypt: false,
      backup: false,
      autoSync: true,
      kvStoreType: factory.KVStoreType.DEVICE_COLLABORATION,
      securityLevel: factory.SecurityLevel.S2,
    };
    beforeAll(async (done:Function) => {
      console.info(TAG + 'beforeAll context.databaseDir=' + context.databaseDir);
      kvManager = factory.createKVManager(config);
      console.info(TAG + 'beforeAll end, kvManager=' + kvManager);

      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeAll getKVStore for getKVStore success');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeAll getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });

      let getDeviceId = new Promise<string>((resolve, reject) => {
        kvStore!.on('dataChange', 0, (data) => {
          console.info(TAG + 'beforeAll on data change: ' + JSON.stringify(data));
          console.info(TAG + 'beforeAll on data.deviceId=' + JSON.stringify(data.deviceId));
          resolve(data.deviceId);
        });
        kvStore!.put("getDeviceId", "byPut").then((data) => {
          console.info(TAG + 'beforeAll put success');
          expect(data == undefined).assertTrue();
        });
        setTimeout(() => {
          reject(new Error('not resolved in 2 second, reject it.'));
        }, 2000);
      });
      await getDeviceId.then((deviceId) => {
        console.info(TAG + 'beforeAll getDeviceId=' + JSON.stringify(deviceId));
        localDeviceId = deviceId;
      }).catch((error: BusinessError) => {
        console.error(TAG + 'beforeAll can NOT getDeviceId, fail: ' +
          `, error code is ${error.code}, message is ${error.message}`);
        expect(null).assertFail();
      });

      await sleep(3000);
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID);
      kvStore = null;
      console.info(TAG + 'beforeAll end');
      await sleep(2000);
      done();

    });


    beforeEach(async (done:Function) =>  {
      console.info(TAG + 'beforeEach' + JSON.stringify(options));
      await kvManager!.getKVStore(TEST_STORE_ID, options).then((store: factory.DeviceKVStore) => {
        kvStore = store;
        console.info(TAG + 'beforeEach getKVStore success');
      }).catch((err: BusinessError) => {
        console.error(TAG + 'beforeEach getKVStore err ' + `, error code is ${err.code}, message is ${err.message}`);
      });
      done();
    });
    afterEach(async (done:Function) =>  {
      console.info(TAG + 'afterEach');
      await kvManager!.closeKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded closeKVStore');
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed closeKVStore.code is ${err.code},message is ${err.message}`);
      });

      await kvManager!.deleteKVStore(TEST_BUNDLE_NAME, TEST_STORE_ID).then(() => {
        console.info(TAG + ' afterEach Succeeded deleteKVStore');
        done();
      }).catch((err: BusinessError) => {
        console.error(TAG + `afterEach Failed deleteKVStore .code is ${err.code},message is ${err.message}`);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_get_0100
     * @tc.name GetCoverageAdd_get_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('GetCoverageAdd_get_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_get_001 begin---------  ');
      const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
      try {
        kvStore?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async () => {
          console.info(TAG + 'Succeeded in putting');
          if (kvStore != null) {
            kvStore.get(localDeviceId, KEY_TEST_STRING_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
              console.info(TAG + 'Succeeded in getting');
              console.info(TAG + 'data is '+ data);
              expect(data).assertEqual(VALUE_TEST_STRING_ELEMENT)
              done();
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }

        }).catch((error: BusinessError) => {
          console.error(TAG + `Failed to put.code is ${error.code},message is ${error.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_get_0200
     * @tc.name GetCoverageAdd_get_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_get_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_get_002 begin---------  ');
      const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
      try {
        kvStore?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async () => {
          console.info(TAG + 'Succeeded in putting');
          if (kvStore != null) {
            kvStore.get("", KEY_TEST_STRING_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
              console.info(TAG + 'Succeeded in getting');
              console.info(TAG + 'data is '+ data);
              expect(data).assertEqual(VALUE_TEST_STRING_ELEMENT)
              done();
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }

        }).catch((error: BusinessError) => {
          console.error(TAG + `Failed to put.code is ${error.code},message is ${error.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_get_0300
     * @tc.name GetCoverageAdd_get_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_get_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_get_003 begin---------  ');
      const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
      try {
        kvStore?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async () => {
          console.info(TAG + 'Succeeded in putting');
          if (kvStore != null) {
            kvStore.get(null, KEY_TEST_STRING_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
              expect(null).assertFail();
              done();
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }

        }).catch((error: BusinessError) => {
          console.error(TAG + `Failed to put.code is ${error.code},message is ${error.message}`);
          expect(401).assertEqual(error.code);
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_get_0400
     * @tc.name GetCoverageAdd_get_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_get_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_get_004 begin---------  ');
      const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
      try {
        kvStore?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async () => {
          console.info(TAG + 'Succeeded in putting');
          if (kvStore != null) {
            kvStore.get(undefined, KEY_TEST_STRING_ELEMENT).then((data: boolean | string | number | Uint8Array) => {
              expect(null).assertFail();
              done();
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }

        }).catch((error: BusinessError) => {
          console.error(TAG + `Failed to put.code is ${error.code},message is ${error.message}`);
          expect(401).assertEqual(error.code);
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_get_0500
     * @tc.name GetCoverageAdd_get_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('GetCoverageAdd_get_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_get_005 begin---------  ');
      const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
      try {
        kvStore?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async () => {
          console.info(TAG + 'Succeeded in putting');
          if (kvStore != null) {
            kvStore.get(localDeviceId, "").then((data: boolean | string | number | Uint8Array) => {
              expect(null).assertFail();
              done();
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to get.code is ${err.code},message is ${err.message}`);
              expect(401).assertEqual(err.code);
              done();
            });
          }

        }).catch((error: BusinessError) => {
          console.error(TAG + `Failed to put.code is ${error.code},message is ${error.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_get_0600
     * @tc.name GetCoverageAdd_get_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_get_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_get_006 begin---------  ');
      const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
      try {
        kvStore?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async () => {
          console.info(TAG + 'Succeeded in putting');
          if (kvStore != null) {
            await kvStore.get(localDeviceId, null);
            expect(null).assertFail();
            done();
          }

        }).catch((error: BusinessError) => {
          console.error(TAG + `Failed to put.code is ${error.code},message is ${error.message}`);
          expect(401).assertEqual(error.code);
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_get_0700
     * @tc.name GetCoverageAdd_get_007
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_get_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_get_007 begin---------  ');
      const KEY_TEST_STRING_ELEMENT = 'key_test_string_2';
      const VALUE_TEST_STRING_ELEMENT = 'value-string-002';
      try {
        kvStore?.put(KEY_TEST_STRING_ELEMENT, VALUE_TEST_STRING_ELEMENT).then(async () => {
          console.info(TAG + 'Succeeded in putting');
          if (kvStore != null) {
            await kvStore.get(localDeviceId, undefined);
            expect(null).assertFail();
            done();
          }
        }).catch((error: BusinessError) => {
          console.error(TAG + `Failed to put.code is ${error.code},message is ${error.message}`);
          expect(401).assertEqual(error.code);
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries01_0100
     * @tc.name GetCoverageAdd_getEntries01_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries01_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries('', (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG +`Failed to get Entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries01_0200
     * @tc.name GetCoverageAdd_getEntries01_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries01_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(null, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG +`Failed to get Entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries01_0300
     * @tc.name GetCoverageAdd_getEntries01_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries01_003 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(undefined, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG +`Failed to get Entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries02_0100
     * @tc.name GetCoverageAdd_getEntries02_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries02_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries("").then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries02_0200
     * @tc.name GetCoverageAdd_getEntries02_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries02_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(null).then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries02_0300
     * @tc.name GetCoverageAdd_getEntries02_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries02_003 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(undefined).then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries03_0100
     * @tc.name GetCoverageAdd_getEntries03_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries03_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries03_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries("", 'batch_test_string_key', (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting entries');
            console.info(TAG + `entries.length: ${entries.length}`);
            console.info(TAG + `entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries03_0200
     * @tc.name GetCoverageAdd_getEntries03_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries03_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries03_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(null, 'batch_test_string_key', (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting entries');
            console.info(TAG + `entries.length: ${entries.length}`);
            console.info(TAG + `entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries03_0300
     * @tc.name GetCoverageAdd_getEntries03_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries03_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries03_003 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(undefined, 'batch_test_string_key', (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting entries');
            console.info(TAG + `entries.length: ${entries.length}`);
            console.info(TAG + `entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries03_0400
     * @tc.name GetCoverageAdd_getEntries03_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('GetCoverageAdd_getEntries03_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries03_004 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, "", (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries03_0500
     * @tc.name GetCoverageAdd_getEntries03_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getEntries03_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries03_005 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, null, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries03_0600
     * @tc.name GetCoverageAdd_getEntries03_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getEntries03_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries03_006 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, undefined, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries04_0100
     * @tc.name GetCoverageAdd_getEntries04_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries04_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries04_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries("", 'batch_test_string_key').then((entries: factory.Entry[]) => {
            console.info(TAG +'Succeeded in getting entries');
            console.info(TAG +`entries.length: ${entries.length}`);
            expect(entries.length).assertEqual(0)
            done()
          }).catch((err: BusinessError) => {
            console.error(TAG +`Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done()
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries04_0200
     * @tc.name GetCoverageAdd_getEntries04_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries04_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries04_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(null, 'batch_test_string_key').then((entries: factory.Entry[]) => {
            console.info(TAG +'Succeeded in getting entries');
            console.info(TAG +`entries.length: ${entries.length}`);
            expect(entries.length).assertEqual(0)
            done()
          }).catch((err: BusinessError) => {
            console.error(TAG +`Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done()
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries04_0300
     * @tc.name GetCoverageAdd_getEntries04_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries04_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries04_003 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(undefined, 'batch_test_string_key').then((entries: factory.Entry[]) => {
            console.info(TAG +'Succeeded in getting entries');
            console.info(TAG +`entries.length: ${entries.length}`);
            expect(entries.length).assertEqual(0)
            done()
          }).catch((err: BusinessError) => {
            console.error(TAG +`Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done()
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries04_0400
     * @tc.name GetCoverageAdd_getEntries04_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('GetCoverageAdd_getEntries04_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries04_004 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, "").then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done()
          }).catch((err: BusinessError) => {
            console.error(TAG +`Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done()
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries04_0500
     * @tc.name GetCoverageAdd_getEntries04_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getEntries04_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries04_005 begin---------  ');
      try {
        if (kvStore != null) {
          await kvStore.getEntries(localDeviceId, null);
          expect(null).assertFail();
          done()
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries04_0600
     * @tc.name GetCoverageAdd_getEntries04_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getEntries04_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries04_006 begin---------  ');
      try {
        if (kvStore != null) {
          await kvStore.getEntries(localDeviceId, undefined);
          expect(null).assertFail();
          done()
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries05_0100
     * @tc.name GetCoverageAdd_getEntries05_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries05_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries05_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries("", (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries05_0200
     * @tc.name GetCoverageAdd_getEntries05_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries05_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries05_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(null, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries05_0300
     * @tc.name GetCoverageAdd_getEntries05_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries05_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries05_003 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(undefined, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries06_0100
     * @tc.name GetCoverageAdd_getEntries06_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries06_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries06_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries("").then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries06_0200
     * @tc.name GetCoverageAdd_getEntries06_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries06_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries06_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(null).then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries06_0300
     * @tc.name GetCoverageAdd_getEntries06_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries06_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries06_003 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(undefined).then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get Entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries07_0100
     * @tc.name GetCoverageAdd_getEntries07_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries07_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries07_001 begin---------  ');
      try {
        if (kvStore != null) {
          let query = new factory.Query();
          query.deviceId('localDeviceId');
          query.prefixKey("batch_test");
          kvStore.getEntries("", query, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG +'Succeeded in getting entries');
            console.info(TAG +`entries.length: ${entries.length}`);
            console.info(TAG +`entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          })
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries07_0200
     * @tc.name GetCoverageAdd_getEntries07_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries07_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries07_002 begin---------  ');
      try {
        if (kvStore != null) {
          let query = new factory.Query();
          query.deviceId('localDeviceId');
          query.prefixKey("batch_test");
          kvStore.getEntries(null, query, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG +'Succeeded in getting entries');
            console.info(TAG +`entries.length: ${entries.length}`);
            console.info(TAG +`entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          })
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries07_0300
     * @tc.name GetCoverageAdd_getEntries07_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries07_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries07_003 begin---------  ');
      try {
        if (kvStore != null) {
          let query = new factory.Query();
          query.deviceId('localDeviceId');
          query.prefixKey("batch_test");
          kvStore.getEntries(undefined, query, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG +'Succeeded in getting entries');
            console.info(TAG +`entries.length: ${entries.length}`);
            console.info(TAG +`entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          })
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries07_0400
     * @tc.name GetCoverageAdd_getEntries07_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('GetCoverageAdd_getEntries07_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries07_004 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, "", (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          })
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries07_0500
     * @tc.name GetCoverageAdd_getEntries07_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getEntries07_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries07_005 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, null, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          })
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries07_0600
     * @tc.name GetCoverageAdd_getEntries07_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getEntries07_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries07_006 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, undefined, (err: BusinessError, entries: factory.Entry[]) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          })
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries08_0100
     * @tc.name GetCoverageAdd_getEntries08_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getEntries08_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries08_001 begin---------  ');
      try {
        if (kvStore != null) {
          let query = new factory.Query();
          query.deviceId('localDeviceId');
          query.prefixKey("batch_test");
          kvStore.getEntries("", query).then((entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded in getting entries');
            console.info(TAG + `entries.length: ${entries.length}`);
            console.info(TAG + `entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries08_0200
     * @tc.name GetCoverageAdd_getEntries08_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getEntries08_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries08_002 begin---------  ');
      try {
        if (kvStore != null) {
          let query = new factory.Query();
          query.deviceId('localDeviceId');
          query.prefixKey("batch_test");
          kvStore.getEntries(null, query).then((entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded in getting entries');
            console.info(TAG + `entries.length: ${entries.length}`);
            console.info(TAG + `entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries08_0300
     * @tc.name GetCoverageAdd_getEntries08_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getEntries08_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries08_003 begin---------  ');
      try {
        if (kvStore != null) {
          let query = new factory.Query();
          query.deviceId('localDeviceId');
          query.prefixKey("batch_test");
          kvStore.getEntries(undefined, query).then((entries: factory.Entry[]) => {
            console.info(TAG + 'Succeeded in getting entries');
            console.info(TAG + `entries.length: ${entries.length}`);
            console.info(TAG + `entries[0]: ${entries[0]}`);
            expect(entries.length).assertEqual(0)
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries08_0400
     * @tc.name GetCoverageAdd_getEntries08_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('GetCoverageAdd_getEntries08_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries08_004 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getEntries(localDeviceId, "").then((entries: factory.Entry[]) => {
            expect(null).assertFail();
            done();
          }).catch((err: BusinessError) => {
            console.error(TAG + `Failed to get entries.code is ${err.code},message is ${err.message}`);
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries08_0500
     * @tc.name GetCoverageAdd_getEntries08_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getEntries08_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries08_005 begin---------  ');
      try {
        if (kvStore != null) {
          await kvStore.getEntries(localDeviceId, null);
          expect(null).assertFail();
          done();
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getEntries08_0600
     * @tc.name GetCoverageAdd_getEntries08_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getEntries08_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getEntries08_006 begin---------  ');
      try {
        if (kvStore != null) {
          await kvStore.getEntries(localDeviceId, undefined);
          expect(null).assertFail();
          done();
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet01_0100
     * @tc.name GetCoverageAdd_getResultSet01_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSet01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet01_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSet("", async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet01_0200
     * @tc.name GetCoverageAdd_getResultSet01_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSet01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet01_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSet(null, async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet01_0300
     * @tc.name GetCoverageAdd_getResultSet01_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSet01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet01_003 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSet(undefined, async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet01_0400
     * @tc.name GetCoverageAdd_getResultSet01_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value assert
     */
    it('GetCoverageAdd_getResultSet01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet01_004 begin---------  ');
      try {
        if (kvStore != null) {
          let resultSet: factory.KVStoreResultSet;
          kvStore.getResultSet("batch_test_string_key", async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            resultSet = result;
            expect(resultSet !== undefined).assertTrue();
            console.info(TAG +'Succeeded in getting resultSet');
            if (kvStore != null) {
              kvStore.closeResultSet(resultSet).then(() => {
                console.info('Succeeded in closing resultSet');
                done();
              }).catch((err: BusinessError) => {
                console.error(`Failed to close resultSet.code is ${err.code},message is ${err.message}`);
                expect(null).assertFail();
                done();
              });
            }
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet02_0100
     * @tc.name GetCoverageAdd_getResultSet02_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSet02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet02_001 begin---------  ');
      try {
        kvStore?.getResultSet("").then((result: factory.KVStoreResultSet) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet02_0200
     * @tc.name GetCoverageAdd_getResultSet02_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSet02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet02_002 begin---------  ');
      try {
        await kvStore?.getResultSet(null);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet02_0300
     * @tc.name GetCoverageAdd_getResultSet02_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSet02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet02_003 begin---------  ');
      try {
        await kvStore?.getResultSet(undefined);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet02_0400
     * @tc.name GetCoverageAdd_getResultSet02_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc add return value asser
     */
    it('GetCoverageAdd_getResultSet02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet02_004 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet;
        kvStore?.getResultSet('batch_test_string_key').then((result: factory.KVStoreResultSet) => {
          console.info(TAG +'Succeeded in getting resultSet');
          resultSet = result;
          expect(resultSet !== undefined).assertTrue();
          if (kvStore != null) {
            kvStore.closeResultSet(resultSet).then(() => {
              console.info('Succeeded in closing resultSet');
              done();
            }).catch((err: BusinessError) => {
              console.error(`Failed to close resultSet.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet03_0100
     * @tc.name GetCoverageAdd_getResultSet03_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSet03_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet03_001 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet;
        if (kvStore != null) {
          kvStore.getResultSet("", 'batch_test_string_key', async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting resultSet');
            resultSet = result;
            expect(resultSet !== undefined).assertTrue();
            await kvStore?.closeResultSet(resultSet);
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet03_0200
     * @tc.name GetCoverageAdd_getResultSet03_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSet03_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet03_002 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet;
        if (kvStore != null) {
          kvStore.getResultSet(null, 'batch_test_string_key', async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting resultSet');
            resultSet = result;
            expect(resultSet !== undefined).assertTrue();
            await kvStore?.closeResultSet(resultSet);
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet03_0300
     * @tc.name GetCoverageAdd_getResultSet03_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSet03_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet03_003 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet;
        if (kvStore != null) {
          kvStore.getResultSet(undefined, 'batch_test_string_key', async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting resultSet');
            resultSet = result;
            expect(resultSet !== undefined).assertTrue();
            await kvStore?.closeResultSet(resultSet);
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet03_0400
     * @tc.name GetCoverageAdd_getResultSet03_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('GetCoverageAdd_getResultSet03_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet03_004 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSet(localDeviceId, "", async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet03_0500
     * @tc.name GetCoverageAdd_getResultSet03_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getResultSet03_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet03_005 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSet(localDeviceId, null, async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet03_0600
     * @tc.name GetCoverageAdd_getResultSet03_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getResultSet03_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet03_006 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSet(localDeviceId, undefined, async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet04_0100
     * @tc.name GetCoverageAdd_getResultSet04_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSet04_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet04_001 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet|undefined = undefined;
        kvStore?.getResultSet("", 'batch_test_string_key').then((result: factory.KVStoreResultSet) => {
          console.info(TAG +'Succeeded in getting resultSet');
          resultSet = result;
          expect(resultSet !== undefined).assertTrue();
          if (kvStore != null) {
            kvStore.closeResultSet(resultSet).then(() => {
              console.info(TAG +'Succeeded in closing resultSet');
              done();
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to close resultSet.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get resultSet.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet04_0200
     * @tc.name GetCoverageAdd_getResultSet04_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSet04_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet04_002 begin---------  ');
      try {
        let resultSet = await kvStore?.getResultSet(null, 'batch_test_string_key');
        console.info(TAG +'Succeeded in getting resultSet');
        expect(resultSet !== undefined).assertTrue();
        await kvStore?.closeResultSet(resultSet);
        console.info(TAG +'Succeeded in closing resultSet');
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet04_0300
     * @tc.name GetCoverageAdd_getResultSet04_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSet04_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet04_003 begin---------  ');
      try {
        let resultSet = await kvStore?.getResultSet(undefined, 'batch_test_string_key');
        console.info(TAG +'Succeeded in getting resultSet');
        expect(resultSet !== undefined).assertTrue();
        await kvStore?.closeResultSet(resultSet);
        console.info(TAG +'Succeeded in closing resultSet');
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet04_0400
     * @tc.name GetCoverageAdd_getResultSet04_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is ""
     */
    it('GetCoverageAdd_getResultSet04_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet04_004 begin---------  ');
      try {
        kvStore?.getResultSet(localDeviceId, "").then((result: factory.KVStoreResultSet) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get resultSet.code is ${err.code},message is ${err.message}`);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet04_0500
     * @tc.name GetCoverageAdd_getResultSet04_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getResultSet04_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet04_005 begin---------  ');
      try {
        await kvStore?.getResultSet(localDeviceId, null);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet04_0600
     * @tc.name GetCoverageAdd_getResultSet04_006
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getResultSet04_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet04_006 begin---------  ');
      try {
        await kvStore?.getResultSet(localDeviceId, undefined);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet05_0100
     * @tc.name GetCoverageAdd_getResultSet05_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSet05_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet05_001 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet;
        const query = new factory.Query();
        query.prefixKey("batch_test");
        if (kvStore != null) {
          kvStore.getResultSet("", query, async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting resultSet');
            resultSet = result;
            expect(resultSet !== undefined).assertTrue();
            await kvStore?.closeResultSet(resultSet);
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet05_0200
     * @tc.name GetCoverageAdd_getResultSet05_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSet05_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet05_002 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet;
        const query = new factory.Query();
        query.prefixKey("batch_test");
        if (kvStore != null) {
          kvStore.getResultSet(null, query, async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting resultSet');
            resultSet = result;
            expect(resultSet !== undefined).assertTrue();
            await kvStore?.closeResultSet(resultSet);
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet05_0300
     * @tc.name GetCoverageAdd_getResultSet05_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSet05_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet05_003 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet;
        const query = new factory.Query();
        query.prefixKey("batch_test");
        if (kvStore != null) {
          kvStore.getResultSet(undefined, query, async (err: BusinessError, result: factory.KVStoreResultSet) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get resultset.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            console.info(TAG + 'Succeeded in getting resultSet');
            resultSet = result;
            expect(resultSet !== undefined).assertTrue();
            await kvStore?.closeResultSet(resultSet);
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet06_0100
     * @tc.name GetCoverageAdd_getResultSet06_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSet06_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet06_001 begin---------  ');
      try {
        let resultSet: factory.KVStoreResultSet|undefined = undefined;
        const query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore?.getResultSet("", query).then((result: factory.KVStoreResultSet) => {
          console.info(TAG +'Succeeded in getting resultSet');
          resultSet = result;
          expect(resultSet !== undefined).assertTrue();
          if (kvStore != null) {
            kvStore.closeResultSet(resultSet).then(() => {
              console.info(TAG +'Succeeded in closing resultSet');
              done();
            }).catch((err: BusinessError) => {
              console.error(TAG + `Failed to close resultSet.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            });
          }
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get resultSet.code is ${err.code},message is ${err.message}`);
          expect(null).assertFail();
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet06_0200
     * @tc.name GetCoverageAdd_getResultSet06_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSet06_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet06_002 begin---------  ');
      try {
        const query = new factory.Query();
        query.prefixKey("batch_test");
        let resultSet = await kvStore?.getResultSet(null, query);
        console.info(TAG +'Succeeded in getting resultSet');
        expect(resultSet !== undefined).assertTrue();
        await kvStore?.closeResultSet(resultSet);
        console.info(TAG +'Succeeded in closing resultSet');
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSet06_0300
     * @tc.name GetCoverageAdd_getResultSet06_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSet06_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSet06_003 begin---------  ');
      try {
        const query = new factory.Query();
        query.prefixKey("batch_test");
        let resultSet = await kvStore?.getResultSet(undefined, query);
        console.info(TAG +'Succeeded in getting resultSet');
        expect(resultSet !== undefined).assertTrue();
        await kvStore?.closeResultSet(resultSet);
        console.info(TAG +'Succeeded in closing resultSet');
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize01_0100
     * @tc.name GetCoverageAdd_getResultSize01_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSize01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize01_001 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSize(null, (err: BusinessError, resultSize: number) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get result size.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize01_0200
     * @tc.name GetCoverageAdd_getResultSize01_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSize01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize01_002 begin---------  ');
      try {
        if (kvStore != null) {
          kvStore.getResultSize(undefined, (err: BusinessError, resultSize: number) => {
            if (err != undefined) {
              console.error(TAG + `Failed to get result size.code is ${err.code},message is ${err.message}`);
              expect(null).assertFail();
              done();
            }
            expect(null).assertFail();
            done();
          });
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize02_0100
     * @tc.name GetCoverageAdd_getResultSize02_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSize02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize02_001 begin---------  ');
      try {
        await kvStore?.getResultSize(null)
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize02_0200
     * @tc.name GetCoverageAdd_getResultSize02_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSize02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize02_002 begin---------  ');
      try {
        await kvStore?.getResultSize(undefined)
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize03_0100
     * @tc.name GetCoverageAdd_getResultSize03_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSize03_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize03_001 begin---------  ');
      try {
        if (kvStore != null) {
          const query = new factory.Query();
          query.prefixKey("batch_test");
          if (kvStore != null) {
            kvStore.getResultSize("", query, (err: BusinessError, resultSize: number) => {
              if (err != undefined) {
                console.error(TAG + `Failed to get resultSize.code is ${err.code},message is ${err.message},resultSize is ${resultSize}`);
                expect(15100004).assertEqual(err.code)
                done();
              }else {
                expect(null).assertFail();
                done();
              }
            });
          }
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize03_0200
     * @tc.name GetCoverageAdd_getResultSize03_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSize03_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize03_002 begin---------  ');
      try {
        if (kvStore != null) {
          const query = new factory.Query();
          query.prefixKey("batch_test");
          if (kvStore != null) {
            kvStore.getResultSize(null, query, (err: BusinessError, resultSize: number) => {
              if (err != undefined) {
                console.error(TAG + `Failed to get resultSize.code is ${err.code},message is ${err.message},resultSize is ${resultSize}`);
                expect(15100004).assertEqual(err.code)
                done();
              }else {
                expect(null).assertFail();
                done();
              }
            });
          }
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize03_0300
     * @tc.name GetCoverageAdd_getResultSize03_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSize03_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize03_003 begin---------  ');
      try {
        if (kvStore != null) {
          const query = new factory.Query();
          query.prefixKey("batch_test");
          if (kvStore != null) {
            kvStore.getResultSize(undefined, query, (err: BusinessError, resultSize: number) => {
              if (err != undefined) {
                console.error(TAG + `Failed to get resultSize.code is ${err.code},message is ${err.message},resultSize is ${resultSize}`);
                expect(15100004).assertEqual(err.code)
                done();
              }else {
                expect(null).assertFail();
                done();
              }
            });
          }
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize03_0400
     * @tc.name GetCoverageAdd_getResultSize03_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getResultSize03_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize03_004 begin---------  ');
      try {
        if (kvStore != null) {
          if (kvStore != null) {
            kvStore.getResultSize(localDeviceId, null, (err: BusinessError, resultSize: number) => {
              expect(null).assertFail();
              done();
            });
          }
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize03_0500
     * @tc.name GetCoverageAdd_getResultSize03_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getResultSize03_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize03_005 begin---------  ');
      try {
        if (kvStore != null) {
          if (kvStore != null) {
            kvStore.getResultSize(localDeviceId, undefined, (err: BusinessError, resultSize: number) => {
              expect(null).assertFail();
              done();
            });
          }
        }
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize04_0100
     * @tc.name GetCoverageAdd_getResultSize04_001
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is ""
     */
    it('GetCoverageAdd_getResultSize04_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize04_001 begin---------  ');
      try {
        let query = new factory.Query();
        query.prefixKey("batch_test");
        kvStore?.getResultSize("", query).then((resultSize: number) => {
          expect(null).assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error(TAG + `Failed to get resultSize.code is ${err.code},message is ${err.message}`);
          expect(15100004).assertEqual(err.code);
          done();
        });
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(null).assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize04_0200
     * @tc.name GetCoverageAdd_getResultSize04_002
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is null
     */
    it('GetCoverageAdd_getResultSize04_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize04_002 begin---------  ');
      try {
        let query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore?.getResultSize(null, query);
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(15100004).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize04_0300
     * @tc.name GetCoverageAdd_getResultSize04_003
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc first param is undefined
     */
    it('GetCoverageAdd_getResultSize04_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize04_003 begin---------  ');
      try {
        let query = new factory.Query();
        query.prefixKey("batch_test");
        await kvStore?.getResultSize(undefined, query);
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(15100004).assertEqual(error.code);
        done();
      }
    })

    /**
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize04_0400
     * @tc.name GetCoverageAdd_getResultSize04_004
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is null
     */
    it('GetCoverageAdd_getResultSize04_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize04_004 begin---------  ');
      try {
        await kvStore?.getResultSize(localDeviceId, null);
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
     * @tc.number SUB_DistributedData_KVStore_SDK_GetCoverageAdd_getResultSize04_0500
     * @tc.name GetCoverageAdd_getResultSize04_005
     * @tc.type FUNC
     * @tc.size MediumTest
     * @tc.level Level 2
     * @tc.desc sec param is undefined
     */
    it('GetCoverageAdd_getResultSize04_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function) => {
      console.info(TAG + ' --------- GetCoverageAdd_getResultSize04_005 begin---------  ');
      try {
        await kvStore?.getResultSize(localDeviceId, undefined);
        expect(null).assertFail();
        done();
      } catch (e) {
        let error = e as BusinessError;
        console.error(TAG + `Failed to get.code is ${error.code},message is ${error.message}`);
        expect(401).assertEqual(error.code);
        done();
      }
    })
    console.info(TAG + '-------------------describe DeviceKvStoreGetCoverageAdd  end-------------------');
  })
}